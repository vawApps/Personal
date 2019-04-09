<?php
	use yii\helpers\Html;
	use app\assets\AppAsset;
	use yii\bootstrap\ActiveForm;
	use yii\bootstrap\Alert;
	use yii\helpers\Url;
	use app\models\Aspirantes;

	$fn_apirante = new Aspirantes;
    $resultado = $fn_apirante->Consultar_Registro_P(1,1);

    var_dump($resultado);