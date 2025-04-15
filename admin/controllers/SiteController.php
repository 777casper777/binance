<?php

namespace app\controllers;

use phpDocumentor\Reflection\Types\Null_;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

use app\models\News;
use app\models\Buy;
use app\models\Sells;
use app\models\History_buy;
use app\models\History_sells;
use app\models\Config;
use app\models\Process;
use yii\data\Pagination;


class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    private $pages=50;
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        #return $this->render('news');
        #$this->actionNews();
        #echo 1;exit(1);
        #return $this->redirect(['site/news']);
        return $this->render('index');
        #return $this->actionLogin();
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function securuty(){
       isset($_SESSION['__id'])!=false ? true : exit('Access denided!');
    }
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
            #return $this->actionNews();
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
    public function getDates(){
        $date_to=time()+3600*24*7;
        $date_for=time();
        $res=['date_for'=>date("Y-m-d",$date_for), 'date_to'=>date("Y-m-d",$date_to)];
        return $res;
    }
    public function actionNews(){
        $this->securuty();
        $id=Yii::$app->request->get('id');
        if (Yii::$app->request->post()) {
            $date_for = Yii::$app->request->post('date_for');
            $date_to = Yii::$app->request->post('date_to');
            $query = News::find()->where(['between', 'date', $date_for, $date_to ]);
        }else{
            if($id!=null){
                $query=News::find()->where(['id'=>$id]);
            }else{
                $data=$this->getDates();
                $date_for=$data['date_for'];
                $date_to=$data['date_to'];
                $query=News::find();
            }

        }
        $pagination = new Pagination([
            'defaultPageSize' =>$this->pages ,
            'totalCount' => $query->count(),
        ]);

        $news = $query->orderBy(['date'=>SORT_DESC])
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $this->render('news', [
            'news' => $news,
            'pagination' => $pagination,
            'date_for'=>$date_for,
            'date_to'=>$date_to,
        ]);
    }
    public function actionBuy(){
        $this->securuty();
        $id=Yii::$app->request->get('id');
        if ($id!=null){
            $query=Buy::find()->where(['id'=>$id]);
        }else{
            $query=Buy::find();
        }
        $pagination = new Pagination([
            'defaultPageSize' => $this->pages,
            'totalCount' => $query->count(),
        ]);

        $buy = $query->orderBy(['date'=>SORT_DESC])
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $this->render('buy', [
            'buy' => $buy,
            'pagination' => $pagination,
        ]);

    }
    public function actionSells(){
        $this->securuty();
        $id=Yii::$app->request->get('id');
        if ($id!=null){
            $query=Sells::find()->where(['news_id'=>$id]);
        }else{
            $query=Sells::find();
        }
        $pagination = new Pagination([
            'defaultPageSize' => $this->pages,
            'totalCount' => $query->count(),
        ]);

        $sells = $query->orderBy(['date'=>SORT_DESC])
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $this->render('sells', [
            'sells' => $sells,
            'pagination' => $pagination,
        ]);

    }
    public function actionHistory_buy(){
        $this->securuty();
        $id=Yii::$app->request->get('id');
        $query=History_buy::find()->where(['news_id'=>$id]);
        $pagination = new Pagination([
            'defaultPageSize' => $this->pages,
            'totalCount' => $query->count(),
        ]);

        $history_buy = $query->orderBy(['date'=>SORT_DESC,'history_buy'=>SORT_DESC])
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $this->render('history_buy', [
            'history_buy' => $history_buy,
            'pagination' => $pagination,
        ]);

    }
    public function actionHistory_sells(){
        $this->securuty();
        $id=Yii::$app->request->get('id');
        $query=History_sells::find()->where(['buy_id'=>$id]);
        $pagination = new Pagination([
            'defaultPageSize' => $this->pages,
            'totalCount' => $query->count(),
        ]);

        $history_sells = $query->orderBy(['date'=>SORT_DESC,'history_sells'=>SORT_DESC])
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $this->render('history_sells', [
            'history_sells' => $history_sells,
            'pagination' => $pagination,
        ]);

    }
    public function actionTest(){
        exec("nohup python /var/www/site/data/www/s0565745f.fastvps-server.com/python/parser.py > /dev/null 2>&1 & echo $!" ,$op);
        //print_r($op);
        //exit(1);
    }
    public function run(){
      $process=new Process();
      $process->runCom("nohup python /var/www/site/data/www/s0565745f.fastvps-server.com/python/parser.py > /dev/null 2>&1 & echo $!");
      $data=[
          'status'=>'run',
          'pid'=>$process->getPid(),
          'time'=>date("Y-m-d H:i:s")
      ];
      $process->writeInfo($data);

    }
    public function stop(){
        $process= new Process();
        $json=$process->getInfo();
        $pid=$json['pid'];
        $process->setPid($pid);
        $process->stop();
        $data=[
            'status'=>'stop',
            'time'=>date("Y-m-d H:i:s")
        ];
        $process->writeInfo($data);

    }
    public function actionExist(){


    }
    public function actionConfig()
    {
        $this->securuty();
        $model = new Config();
        $path=Yii::getAlias('@app').'/../config/config.json';
        $type=Yii::$app->request->get('type');
        $process=new Process();

        if($type!= null){
            if ($type=="run") {
                $json = $process->getInfo();
                $json['status'] == 'run' ? $process->setPid($json['pid']) : '';
                if ($process->status()==false) {
                    $this->run();
                }
                $status = "stop";
                $message = "Остановить скрипт";
            }
            if ($type=="stop"){
                $this->stop();
                $status="run";
                $message="Запустить срипт";
            }
        }else {

            $json = $process->getInfo();
            $json['status'] == 'run' ? $process->setPid($json['pid']) : '';
            if ($process->status() == false) {
                $data = [
                    'status' => 'stop',
                    'time' => date("Y-m-d H:i:s")
                ];
                $process->writeInfo($data);
            }
            $json = $process->getInfo();
            if ($json['status'] == "stop") {
                $status = "run";
                $message = "Запустиь скрипт";
            } else {
                $status = "stop";
                $message = "Остановить скрипт";
            }
        }

        if (Yii::$app->request->post()) {
            if(Yii::$app->request->post('test_script')=='1') Yii::$app->request->post('test_script','1'); else Yii::$app->request->post('test_script','0');
            $post=Yii::$app->request->post();
            $f = fopen($path, 'w+');
            $json=json_encode($post);
            fwrite($f,$json);
            fclose($f);
            $config=$this->get_config_from_json_file($path);
        } else {
            $config=$this->get_config_from_json_file($path);
        }
        return $this->render('config',
            [   'model' => $model,
                'config'=>$config,
                'status'=>$status,
                'message'=>$message
            ]);

    }
    public function get_config_from_json_file($path){
        $f = fopen($path, 'r');
        $json = fread($f, filesize($path));
        $config = json_decode($json, true);
        $config['Config']['test_script']=$config['Config']['test_script']=="0" ? false : true;
        fclose($f);
        return $config['Config'];
    }
    public function actionForm(){
        $week_time=60*60*24*7;
        $date_to=time()+3600*24;
        $date_for=$date_to-$week_time;
        return $this->render('search_form',
            [
                'date_for'=>date("d-m-Y",$date_for),
                'date_to'=>date("d-m-Y",$date_to),
            ]
        );
    }
}
