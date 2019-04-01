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
        <li><a href="#">Pruebas del Sistema</a></li>
        <li class="active">Pruebas Registradas</li>
    </ol>
</div>

<div id="alert_message"></div>
<div>
    <table id="gpregistradas" class="display" style="width:100%">
        <thead>
        <tr>
            <th>Código</th>
            <th>Tipo de Prueba</th>
            <th>Calificación</th>
            <th>Editar</th>
            <th>Eliminar</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>Código</th>
            <th>Tipo de Prueba</th>
            <th>Calificación</th>
            <th>Editar</th>
            <th>Eliminar</th>
        </tr>
        </tfoot>
    </table>
</div>

<!-- Modal Pruebas-->
<div class="modal fade" id="pruebasresgistradas" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                        <span class="col-md-1 text-center glyphicon glyphicon-zoom-in" style="font-size: x-large; top: 40px;"></span>
                        <div class="col-md-8">
                            <label class="control-label" for="inputDefault">Código</label>
                            <input id="lname" name="name" type="number" class="form-control" value="">
                        </div>
                    </div>

                    <div class="form-group">
                        <span class="col-md-1 text-center glyphicon glyphicon-chevron-right" style="font-size: x-large; top: 40px;"></span>
                        <div class="col-md-8">
                            <label for="select111" class="col-md-8 control-label">Tipo de Prueba</label>

                            <select id="select111" class="form-control">
                                <option>Razonamiento abstracto</option>
                                <option>Técnica</option>
                                <option>Psicológica´</option>
                            </select>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Calificación</label>
                        <div class="btn-group">
                            <a href="javascript:void(0)" class="btn">1</a>
                            <a href="javascript:void(0)" class="btn">2</a>
                            <a href="javascript:void(0)" class="btn">3</a>
                            <a href="javascript:void(0)" class="btn">4</a>
                            <a href="javascript:void(0)" class="btn">5</a>
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