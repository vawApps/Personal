<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = 'PersonalSoft v1.0';
?>
<div class="container">

    <ol class="breadcrumb">
        <li><a href="#">Gestión Requisición</a></li>
        <li class="active">Inactivos</li>
    </ol>
</div>

<div id="alert_message"></div>
<div>
    <table id="grinactivos" class="display" style="width:100%">
        <thead>
        <tr>
            <th>Cargo</th>
            <th>Fecha inicial</th>
            <th>Fecha Final</th>
            <th>Estado</th>
            <th>Editar</th>
            <th>Eliminar</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>Cargo</th>
            <th>Fecha inicial</th>
            <th>Fecha Final</th>
            <th>Estado</th>
            <th>Editar</th>
            <th>Eliminar</th>
        </tr>
        </tfoot>
    </table>
</div>

<!-- Modal Pruebas-->
<div class="modal fade" id="gestionactivos" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Pruebas Asignadas al Empleado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" method="post">

                    <div class="form-group">
                        <span class="col-md-1 text-center glyphicon glyphicon-chevron-right" style="font-size: x-large; top: 40px;"></span>
                        <div class="col-md-8">
                            <label for="select111" class="col-md-8 control-label">Seleccione Cargo</label>

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
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1">
                                Activar Requisición
                            </label>
                            </br>
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2" checked="">
                                Desactivar Requisición
                            </label>
                        </div>
                    </div>


                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Actualizar</button>
            </div>
        </div>
    </div>
</div>

<script>
    function prueba1(){
        swal({
                title: "Está Seguro?",
                text: "Eliminaras el registro seleccionado",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Eliminar",
                cancelButtonText: "Cancelar",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function (isConfirm) {
                if (isConfirm) {
                    swal("Eliminado!", "El registro fue eliminado.", "success");
                } else {
                    swal("Cancelado", "El registro continúa en la lista.", "error");
                }
            });
    };
</script>
