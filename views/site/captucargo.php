<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = 'PersonalSoft v1.0';
?>

<div class="container">

    <ol class="breadcrumb">
        <li class="active">Publicar Oferta</li>
    </ol>

    <form>

        <h2>Apertura de Cargos</h2>

        <div class="form-group row col-md-6">
            <label for="example-text-input" class="col-2 col-form-label">Seleccione Area</label>
            <div class="col-10">
                <div class="btn-group">
                    <a href="bootstrap-elements.html" data-target="#" class="btn btn-raised dropdown-toggle" data-toggle="dropdown">
                        Seleccione...
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)">Dropdown link</a></li>
                        <li><a href="javascript:void(0)">Dropdown link</a></li>
                        <li><a href="javascript:void(0)">Dropdown link</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="form-group row col-md-6">
            <label for="example-text-input" class="col-2 col-form-label">Seleccione Cargo</label>
            <div class="col-10">
                <div class="btn-group">
                    <a href="bootstrap-elements.html" data-target="#" class="btn btn-raised dropdown-toggle" data-toggle="dropdown">
                        Seleccione...
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)">Dropdown link</a></li>
                        <li><a href="javascript:void(0)">Dropdown link</a></li>
                        <li><a href="javascript:void(0)">Dropdown link</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4" style="text-align: center">
            <div class="thumbnail" style="background-color: #49676B;">\
                </br>
                <a name='pruebas' id='1' class="glyphicon glyphicon-hand-up lg" style="color: white; font-size: 120px;" data-toggle='modal' data-target='#index1'"></a>
                </br>
                <div class="caption" style="color: white; font-weight: bold;" align="center">
                    </br>
                    <p>Seleccione competencias a requerir</p>
                </div>
            </div>
        </div>

        <div class="form-group row col-md-6">
            <label for="example-text-input" class="col-2 col-form-label">Fecha Apertura</label>
            <div class="col-10">
                <input class="form-control" type="date" value="Artisanal kale" id="example-text-input">
            </div>
        </div>

        <div class="form-group row col-md-6">
            <label for="example-text-input" class="col-2 col-form-label">Fecha Cierre</label>
            <div class="col-10">
                <input class="form-control" type="date" value="Artisanal kale" id="example-text-input">
            </div>
        </div>

        <div class="form-group row col-md-10">
            <label for="textArea" class="col-md-2 col-form-label">Descripción</label>
            <div class="col-md-10">
                <textarea class="form-control" rows="3" id="textArea"></textarea>
                <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-8">
                <button type="submit" class="btn btn-raised btn-success">Guardar</button>
            </div>
        </div>

    </form>


</div>


<script>
    function index1(){
        swal("Registro Guardado!", "", "success")
    };
</script>