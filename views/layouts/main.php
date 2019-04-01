<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>

    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => 'PersonalSoft v1.0',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
           // '<li ><a href="/site/index" class="glyphicon glyphicon-star"></a></li>',
            ['label' => 'Dashboard', 'url' => ['/site/index']],
            ['label' => 'Gestión HV', 'url' => ['/site/gestionhv']],
            ['label' => 'Gestión Requisición', 'items' => [
                ['label' => 'Activos', 'url' => ['/site/gractivos']],
                ['label' => 'Inactivos', 'url' => ['/site/grinactivos']],
            ],  ],
            ['label' => 'Gestión Pruebas', 'items' => [
                ['label' => 'Pruebas Digitales', 'url' => ['/site/gpdigitales']],
                '<div class="dropdown-divider"></div>',
                '<div class="dropdown-header">Pruebas del Sistema</div>',
                //['label' => 'Crear Prueba', 'url' => ['/site/gpcrearprueba']],
                ['label' => 'Pruebas Registradas', 'url' => ['/site/gpregistradas']],
            ],  ],
            ['label' => 'Requisición de Personal', 'items' => [
                ['label' => 'Activaciones de Requisición', 'url' => ['/site/rpactivarequisicion']],
                //['label' => 'Resultados', 'url' => ['/site/rpresultados']],
                ['label' => 'Historicos', 'url' => ['/site/rphistorico']]
            ],  ],
        ],
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        </br>
        </br>
        </br>
        <?= $content ?>
    </div>
</div>

<?php $this->endBody() ?>
</body>
<div style="height: 100px"></div>
<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; Universidad Cooperativa de Colombia <?= date('Y') ?></p>
    </div>
</footer>
</html>
<?php $this->endPage() ?>
