<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = 'PersonalSoft v1.0';
?>
<div class="container">

    <ol class="breadcrumb">
        <li><a href="#">Requisición de Personal</a></li>
        <li class="active">Activaciones de Requisición</li>
    </ol>

    <form class="form-horizontal">
        <div class="form-group">
            <fieldset>
                <div style="background-color: #0fb2aa;height: 70px;width: 100%;">
                    <h1 style="color: antiquewhite;text-align: center;"> <span class="glyphicon glyphicon-play-circle btn-lg" aria-hidden="true" style="font-size: xx-large"></span>Activar Requisición de Personal</h1>

                </div>

                <div style="background-color: rgb(245,255,245);height: 600px;width: 100%;">

                    <div class="form-group">
                        <span class="col-md-1 text-center glyphicon glyphicon-chevron-right" style="font-size: x-large; top: 40px;"></span>
                        <div class="col-md-8">
                            <label for="select111" class="control-label">Seleccione Cargo</label>

                            <select id="select111" class="form-control">
                                <option>Abogado</option>
                                <option>Abogado Especialista</option>
                                <option>Abogado Especialista Sectorial</option>
                                <option>Abogado Jefe</option>
                                <option>Almacenista (Código Transitorio)</option>
                            </select>

                        </div>
                    </div>

                    <div class="form-group">
                        <span class="col-md-1 text-center glyphicon glyphicon-calendar" style="font-size: x-large; top: 40px;"></span>
                        <div class="col-md-8">
                            <label class="control-label" for="inputDefault">Fecha Inicial</label>
                            <input id="lname" name="name" type="date" class="form-control" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <span class="col-md-1 text-center glyphicon glyphicon-calendar" style="font-size: x-large; top: 40px;"></span>
                        <div class="col-md-8">
                            <label class="control-label" for="inputDefault">Fecha Final</label>
                            <input id="lname" name="name" type="date" class="form-control" value="">
                        </div>
                    </div>

                    <div class="form-group">
                        <span class="col-md-1 text-center" style="font-size: x-large; top: 40px;"></span>
                        <div class="col-md-8">
                        <label class="control-label">Cantidad de Aspirantes Requeridos</label>
                        <div class="btn-group">
                            <a href="javascript:void(0)" class="btn">1</a>
                            <a href="javascript:void(0)" class="btn">2</a>
                            <a href="javascript:void(0)" class="btn">3</a>
                            <a href="javascript:void(0)" class="btn">4</a>
                            <a href="javascript:void(0)" class="btn">5</a>
                        </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-10" style="text-align: center">
                            <button type="button" class="btn btn-raised btn-success" onclick="activa1();">Activar Solicitud</button>
                        </div>
                    </div>

                </div>
            </fieldset>
        </div>
    </form>

</div>

<script>
    function activa1(){
        swal({
                title: "Está Seguro?",
                text: "Activarás una nueva solicitud de Requisición",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Activar",
                cancelButtonText: "Cancelar",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function (isConfirm) {
                if (isConfirm) {
                    swal("Activada!", "La solicitud se encuentra activa.", "success");
                } else {
                    swal("Cancelado", "El registro no fué guardado.", "error");
                }
            });
    };
</script>


