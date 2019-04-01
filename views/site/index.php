<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = 'PersonalSoft v1.0';
?>

<div class="container">

    <ol class="breadcrumb">
        <li class="active">Dashboard</li>
    </ol>



<div class="row">
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail" style="background-color: #512DA8;">
            <h1 align="center" style="color: white; font-size: 120px;">26</h1>
            <div class="caption" style="color: white; font-weight: bold;" align="center">
                <p>Nuevas Hojas de Vida</p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail" style="background-color: #009688;">
            <h1 align="center" style="color: white; font-size: 120px;">2</h1>
            <div class="caption" style="color: white; font-weight: bold;" align="center">
                <p>Vacantes Disponibles</p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-4" style="text-align: center">
        <div class="thumbnail" style="background-color: #FFA000;">
            </br>
            <a name='pruebas' id='1' class="glyphicon glyphicon-cog lg" style="color: white; font-size: 120px;" data-toggle='modal' data-target='#index1'"></a>
            <div class="caption" style="color: white; font-weight: bold;" align="center">
                </br>
                <p>Configurar Alertas</p>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-6 col-md-6">

<div id="dashboardline"></div>

    </div>
    <div class="col-sm-6 col-md-6">

<div id="dashboardbar"></div>

    </div>
</div>

</div>

<!-- Modal Pruebas-->
<div class="modal fade" id="index1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Configurar el envío de alertas</h5>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" method="post">

                    <div class="form-group">
                        <div class="col-md-8">
                            <h5>Frecuencia para el envío de informes:</h5>
                            </br>
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                                Díario
                            </label>
                            </br>
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                Semanal
                            </label>
                            </br>
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">
                                Mensual
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <span class="col-md-1 text-center glyphicon glyphicon-calendar" style="font-size: x-large; top: 40px;"></span>
                        <div class="col-md-8">
                            <label class="control-label" for="inputDefault">Fecha Inicial</label>
                            <input id="lname" name="name" type="text" class="form-control" placeholder="DD/MM/AAAA" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <span class="col-md-1 text-center glyphicon glyphicon-calendar" style="font-size: x-large; top: 40px;"></span>
                        <div class="col-md-8">
                            <label class="control-label" for="inputDefault">Fecha Final</label>
                            <input id="lname" name="name" type="text" class="form-control" placeholder="DD/MM/AAAA" value="">
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal" onclick="index1();">Guardar</button>
                <button type="button" class="btn btn btn-warning" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>

<script>
    function index1(){
        swal("Registro Guardado!", "", "success")
    };
</script>