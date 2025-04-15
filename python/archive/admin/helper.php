<?php

/*
  Автор:Владимир Великанов
  skype:it_create
 */

// класс включает вспомогательные методы для работы с лендиногм
class Helper {

    public $conect = false; // тип соединения с сервером (БД)   (false-не удачно,true-удачно)
    public $link_conect = false; // указатель на соединение с сервером БД


    //-------подключение к бд--------------
    public function conect_bd($arr) {
        /*
          $arr['server']- сервер
          $arr['user_name']-имя пользователя
          $arr['user_pass']-пароль пользователя
          $arr['bd_name']-имя БД
         */
        $this->conect = true;
        //    $this->conect_bd($this->config_bd);
        $this->link_conect = mysqli_connect($arr['server'], $arr['user_name'], $arr['user_pass'], $arr['bd_name']);

        //if (!mysqli_ping($this->link_conect)) $this->link_conect= mysqli_connect($arr['server'],$arr['user_name'],$arr['user_pass'],$arr['bd_name']);
        if ($this->link_conect == false) {
            echo 'Соединение  сервером базы данных mysqli не установлено!';
            $this->conect = false;
            exit;
        }
        $conect_bd = mysqli_select_db($this->link_conect, $arr['bd_name']);
        if ($conect_bd == false) {
            echo 'Соединение с базой данных не установлено!';
            $this->conect = false;
            exit;
        }
        mysqli_query($this->link_conect, "SET NAMES 'utf8';");
        return $this->conect;
    }

    //-------закрытие бд------------------
    public function close_bd() {
        mysqli_close($this->link_conect);
    }

    public function escape($str) {
        return mysqli_real_escape_string($this->link_conect, $str);
    }

    //-------выполнение запроса в бд--------
    public function query_bd($sql) { // return void
        $res = mysqli_query($this->link_conect, $sql);
        if (!$res) {
            echo "<br>Cant't do $sql";
            echo mysqli_error($this->link_conect) . '<br>';
        }
    }

    //-------добавление записи в бд--------
    public function insert_bd($table_name, $arr) { // arr-массив значений
        $result = true;
        $sql = '';
        if ($this->conect == false) {
            echo 'Нет соединения с БД, запись в таблицу не возможна';
            $result = false;
            exit;
        } else {
            $str_1 = "INSERT INTO `$table_name` (";
            $str_2 = "";
            $str_3 = "(";
            $len = count($arr);
            $i = 0;
            foreach ($arr as $key => $value) {
                $value = str_replace("'", "", $value);
                $key = str_replace("'", "", $key);
                if ($len - 1 > $i) {
                    $str_2 = $str_2 . "`" . $key . "`" . ',';
                    $str_3 = $str_3 . "'" . $value . "'" . ',';
                } else {
                    $str_2 = $str_2 . "`" . $key . "`)";
                    $str_3 = $str_3 . "'" . $value . "');";
                }
                $i++;
            }
            $sql = $str_1 . $str_2 . " VALUES " . $str_3;
            mysqli_query($this->link_conect, "SET CHARACTER SET utf8");
            mysqli_query($this->link_conect, "SET collation_connection = utf8");
            $res=mysqli_query($this->link_conect, $sql);
            if (!$res) {
                echo "<br>Cant't do insert in $table_name";
                echo $sql . '<br>';
                echo mysqli_error($this->link_conect) . '<br>';
                $result = false;
            }  //else mysqli_free_result($res);
        }
        return $result;
    }

    //-------обновление записи в бд--------
    public function update_bd($table_name, $arr, $id) {
        $result = true;
        $sql = '';
        if ($this->conect == false) {
            echo "Can't do connection with DB";
            $result = false;
            exit;
        } else {
            $str_1 = "UPDATE `$table_name` SET ";
            $str_2 = "";
            $str_3 = " WHERE `id`=";
            $len = count($arr);
            $i = 0;
            foreach ($arr as $key => $value) {
                if ($len - 1 > $i) {
                    $str_2 = $str_2 . "`" . $key . "`='" . $value . "',";
                } else {
                    $str_2 = $str_2 . "`" . $key . "`='" . $value . "'";
                }
                $i++;
            }
            $sql = $str_1 . $str_2 . $str_3 . $id;
            $res=mysqli_query($this->link_conect, $sql);
            if (!$res) {
                echo "<br>Can't do update: $sql";
                $result = false;
         }//else mysqli_free_result($res);
        }
        return $result;
    }

    //--------удаление записи из бд--------
    public function delete_bd($table_name, $id) {
        $result = true;
        $sql = "DELETE FROM  $table_name WHERE `id`=";
        if ($this->conect == false) {
            echo 'Нет соединения с БД, удаление не возможно';
            $result = false;
            exit;
        } else {
            $sql = $sql . $id;
            $res=mysqli_query($this->link_conect, $sql);
            if (!$res) {
                echo "<br>Удалить запись в таблице $table_name не удалось";
                $result = false;
                exit;
            }
            //mysqli_close($this->link_conect);
        }
        return $result;
    }

    public function reconnect() {
        if (!mysqli_ping($this->link_conect)) {
            $this->conect_bd($this->config_bd);
            mysqli_query($this->link_conect, "SET NAMES 'utf8';");
        }
    }

    //--------запрос на выборку из бд------
    public function select_bd($sql) {
        //echo $sql;
        $arr = array();
        if ($this->conect == false) {
            echo "Cant't do connection!";
            exit;
        } else {
            //$this->reconnect();
            $res = mysqli_query($this->link_conect, $sql);
            if (!$res) {
                echo "Can not do this query:$sql<br>".PHP_EOL;
            } else {
                if (mysqli_num_rows($res) == 1) {
                    $arr[] = mysqli_fetch_array($res);
                } else {
                    while ($row = mysqli_fetch_array($res)) {
                        $arr[] = $row;
                    }
                }
            }
           //mysqli_free_result($res);
        }
        return $arr;
    }

//---------------------------------------------------------------------------------------
// очистка таблицы
    public function clear_table($table) {
        if ($this->conect == false) {
            echo "Cant't do connection!";
            exit;
        } else {
            mysqli_query($this->link_conect, "DELETE FROM $table");
        }
    }


}

?>