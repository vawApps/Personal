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
        <li class="active">Historicos</li>
    </ol>
</div>

<div id="alert_message"></div>
<div>
    <table id="historicos" class="display" style="width:100%">
        <thead>
        <tr>
            <th>Cargo</th>
            <th>Fecha inicial</th>
            <th>Fecha Final</th>
            <th>Fecha Ejecuta</th>
            <th>Estado</th>
            <th>Resultados</th>
            <th>Auditoria</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>Cargo</th>
            <th>Fecha inicial</th>
            <th>Fecha Final</th>
            <th>Fecha Ejecuta</th>
            <th>Estado</th>
            <th>Resultados</th>
            <th>Auditoria</th>
        </tr>
        </tfoot>
    </table>
</div>


<!-- Modal Historico-->
<div class="modal fade" id="historico" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Resultados para el Cargo</h5>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" method="post">

                    <div class="form-group">
                        <div class="col-md-12">
                            <h2>Aspirantes Aplicados para este Cargo.</h2>

                            <p><small>Usted cuenta con 3 aspirantes para este cargo, a continuación encontrará los datos de estos aspirantes y el avance en el proceso de selección.</small></p>

                            <br>

                            <div style="background-color: #dfead2">
                            <p class="text-primary">Jon Doe 1: Documento Número 3254658654</p>
                            <p>Procentaje de Afinidad al Cargo: 40%</p>
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-success" style="width: 40%"></div>
                            </div>
                            <p>Procentaje de resultado de Pruebas: 30%</p>
                            <p class="text-success">Cantidad de Pruebas: 3</p>
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-info" style="width: 20%"></div>
                            </div>
                            </div>

                            <br>

                            <div style="background-color: #dfead2">
                            <p class="text-primary">Jon Doe 2: Documento Número 3254658654</p>
                            <p>Procentaje de Afinidad al Cargo: 40%</p>
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-success" style="width: 40%"></div>
                            </div>
                            <p>Procentaje de resultado de Pruebas: 30%</p>
                            <p class="text-success">Cantidad de Pruebas: 3</p>
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-info" style="width: 20%"></div>
                            </div>
                            </div>

                            <br>

                            <div style="background-color: #dfead2">
                            <p class="text-primary">Jon Doe 3: Documento Número 3254658654</p>
                            <p>Procentaje de Afinidad al Cargo: 40%</p>
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-success" style="width: 40%"></div>
                            </div>
                            <p>Procentaje de resultado de Pruebas: 30%</p>
                            <p class="text-success">Cantidad de Pruebas: 3</p>
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-info" style="width: 20%"></div>
                            </div>
                            </div>

                            <br>
                            <br>
                            <br>
                            <div style="text-align: center">
                            <a href="javascript:void(0)" class="btn btn-raised btn-success">Aspirante Contratado</a>
                            <a href="javascript:void(0)" class="btn btn-raised btn-warning">Cancelar Proceso</a>
                            </div>
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

<!-- Modal Auditoria-->
<div class="modal fade" id="auditoria" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Linea de Tiempo del Proceso de Selección</h5>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" method="post">

                    <div class="form-group">
                        <div class="container mt-5 mb-5">
                                <div class="row">
                                    <div class="col-md-6 offset-md-3">
                                      <ul class="timeline">
                                            <li>
                                                <h5 class="text-primary">Prueba Razonamiento Abstracto, 21 Marzo, 2018</h5>
                                                <p><span class="text-success">Nota: </span> No hay notas....</p>
                                            </li>
                                            <li>
                                                <h5 class="text-primary">Prueba Técnica, 21 Marzo, 2018</h5>
                                                <p><span class="text-success">Nota: </span> No hay notas....</p>
                                            </li>
                                            <li>
                                                <h5 class="text-primary">Prueba Psicológica, 21 Marzo, 2018</h5>
                                                <p><span class="text-success">Nota: </span> No hay notas....</p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
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