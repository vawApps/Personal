<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = 'PersonalSoft v1.0';
?>

<div class="container">

    <ol class="breadcrumb">
        <li class="active">Gestión HV</li>
    </ol>



<div id="alert_message"></div>
<div>
    <table id="gestionhv" class="display" style="width:100%">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Cedula</th>
            <th>Estado</th>
            <th>Cargo</th>
            <th>Perfil</th>
            <th>Pruebas</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Cedula</th>
            <th>Estado</th>
            <th>Cargo</th>
            <th>Perfil</th>
            <th>Pruebas</th>
        </tr>
        </tfoot>
    </table>
</div>
</div>

<!-- Modal Perfil-->
<div class="modal fade" id="perfilgestionmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Perfil del Empleado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                                <form class="form-horizontal" method="post">

                                        <div class="form-group">
                                            <span class="col-md-1 text-center glyphicon glyphicon-chevron-right" style="font-size: x-large; top: 40px;"></span>
                                            <div class="col-md-8">
                                                <label class="control-label" for="inputDefault">Tipo de Documento</label>
                                                <input id="fname" name="name" type="text" class="form-control" disabled="" value="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <span class="col-md-1 text-center glyphicon glyphicon-chevron-right" style="font-size: x-large; top: 40px;"></span>
                                            <div class="col-md-8">
                                                <label class="control-label" for="inputDefault">Numero de Documento</label>
                                                <input id="lname" name="name" type="text" class="form-control" disabled="" value="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <span class="col-md-1 text-center glyphicon glyphicon-user" style="font-size: x-large; top: 40px;"></span>
                                            <div class="col-md-8">
                                                <label class="control-label" for="inputDefault">Nombres</label>
                                                <input id="email" name="email" type="text" class="form-control" disabled="" value="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <span class="col-md-1 text-center glyphicon glyphicon-user" style="font-size: x-large; top: 40px;"></span>
                                            <div class="col-md-8">
                                                <label class="control-label" for="inputDefault">Apellidos</label>
                                                <input id="phone" name="phone" type="text" class="form-control" disabled="" value="">
                                            </div>
                                        </div>
                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-chevron-right" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Genero</label>
                                            <input id="fname" name="name" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-calendar" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Fecha de Nacimiento</label>
                                            <input id="lname" name="name" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-flag" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Direccion</label>
                                            <input id="email" name="email" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-phone-alt" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Telefono</label>
                                            <input id="phone" name="phone" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-phone" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Celular</label>
                                            <input id="fname" name="name" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-user" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Estado Civil</label>
                                            <input id="lname" name="name" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-send" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Correo Electronico</label>
                                            <input id="email" name="email" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-exclamation-sign" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Discapacidad</label>
                                            <input id="phone" name="phone" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="col-md-1 text-center  glyphicon glyphicon-education" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Profesion</label>
                                            <input id="fname" name="name" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-plane" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Disponibilidad de Viaje</label>
                                            <input id="lname" name="name" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-calendar" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Fecha Registro</label>
                                            <input id="email" name="email" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span class="col-md-1 text-center glyphicon glyphicon-pushpin" style="font-size: x-large; top: 40px;"></span>
                                        <div class="col-md-8">
                                            <label class="control-label" for="inputDefault">Ciudad de Nacimiento</label>
                                            <input id="phone" name="phone" type="text" class="form-control" disabled="" value="">
                                        </div>
                                    </div>

                                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Pruebas-->
<div class="modal fade" id="pruebasgestionmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Pruebas Asignadas al Empleado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

