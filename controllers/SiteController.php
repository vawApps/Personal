<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

class SiteController extends Controller
{
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

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

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

    public function actionAbout()
    {
        return $this->render('about');
    }

    public function actionGestionhv()
    {
        return $this->render('gestionhv');
    }

    public function actionGractivos()
    {
        return $this->render('gractivos');
    }

    public function actionGrinactivos()
    {
        return $this->render('grinactivos');
    }

    public function actionGpdigitales()
    {
        return $this->render('gpdigitales');
    }

    public function actionGpcrearprueba()
    {
        return $this->render('gpcrearprueba');
    }

    public function actionGpregistradas()
    {
        return $this->render('gpregistradas');
    }

    public function actionRpactivarequisicion()
    {
        return $this->render('rpactivarequisicion');
    }

    public function actionRpresultados()
    {
        return $this->render('rpresultados');
    }

    public function actionRphistorico()
    {
        return $this->render('rphistorico');
    }

    public function actionCaptucargo()
    {
        return $this->render('captucargo');
    }

    public function actionCaptuHV()
    {
        return $this->render('captuhv');
    }
}
