<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = 'PersonalSoft v1.0';
?>
<div class="container">

    <ol class="breadcrumb">
        <li><a href="#">Gestión Pruebas</a></li>
        <li class="active">Pruebas Digitales</li>
    </ol>


    <form class="form-horizontal">
        <div class="form-group">
        <fieldset>
               <div style="background-color: #0fb2aa;height: 70px;width: 100%;">
                    <h1 style="color: antiquewhite;text-align: center;"> <span class="glyphicon glyphicon-cloud-upload btn-lg" aria-hidden="true" style="font-size: xx-large"></span>Subir Prueba</h1>

               </div>

                <div style="background-color: rgb(245,255,245);height: 500px;width: 100%;">

                    <div class="form-group">
                        <div class="col-lg-8 col-lg-offset-2">
                    <label class="control-label" for="focusedInput1">Cédula Aspirante</label>
                    <input class="form-control" id="focusedInput1" type="number">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-8 col-lg-offset-2">
                        <input type="file" id="inputFile4" multiple="">
                        <div class="input-group">
                            <input type="text" readonly="" class="form-control" placeholder="Seleccione Archivo Prueba">
                            <span class="input-group-btn input-group-sm">
                            <button type="button" class="btn btn-fab btn-fab-mini">
                              <i class="material-icons">attach_file</i>
                            </button>
                          </span>
                        </div>
                        </div>
                    </div>

                    <div class="form-group">
					<div class="col-lg-8 col-lg-offset-2">
                        <label class="control-label" for="focusedInput1">Calificación</label>
                            <select id="select111" class="form-control">
                                <option>Seleccione</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
					<div class="col-lg-8 col-lg-offset-2">
                        <label class="control-label" for="focusedInput1">Tipo de Prueba</label>
                            <select id="select1111" class="form-control">
								<option>Seleccione</option>
                                <option>Razonamiento abstracto</option>
                                <option>Técnica</option>
                                <option>Psicológica</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" style="text-align: center;">
                        <div class="col-lg-8 col-lg-offset-2">
                            <button type="submit" class="btn btn-primary">Guardar</button>
                        </div>
                    </div>

                </div>
        </fieldset>
        </div>
    </form>

</div>




