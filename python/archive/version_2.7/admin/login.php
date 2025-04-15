<?php
header("Content-Type: text/html; charset=utf-8"); 
session_start();

if(!isset($_SESSION['authorized'])){
    $error ='';
    if(isset($_POST['submit'])){
        if($_POST['username'] =='vage' && $_POST['password'] == 'enter'){
            $_SESSION['authorized'] = true;
            header('Location: index.php');
            exit();
        }
        else{
            $error = "<font color='red'>Ошибка авторизации</font>";
        }
    }

    ?>
    <form action='' method='post' autocomplete='off'>
        <table>
            <tr><td class="ss">Логин:</td> <td><input type="text" name="username" value=""></td></tr>
            <tr><td>Пароль:</td> <td><input type="password" name="password" value=""></td></tr>
            <tr><td></td><td><input type="submit" name="submit" value="Войти"></td></tr>
            <tr><td colspan="2" align="center"><?php if(!empty($error)) echo $error; ?></td></tr>
        </table>

    </form>
    <style type="text/css">
        table {
            margin:0 auto;
        }
        form td.ss {
            width:100px;
        }
    </style>
<?php } else { header('Location: index.php');}?>


