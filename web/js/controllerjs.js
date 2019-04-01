$(document).ready(function() {

    //------------------- GestionHV
    var dataSet_Gestionhv = [
        [ "ADRIANA PAOLA", "CUJAR ALARCON", "2753716114", "Activo",       "Abogado", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "ADRIANA MARCELA", "SALCEDO SEGURA", "8670618046", "Activo",      "Abogado Especialista", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "ANDREA YOHANNA", "LOZANO SANTOS", "4165548388", "Activo", 	    "Abogado Especialista Sectorial", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "ALEJANDRA MARIA", "ACUÑA	MENDOZA", "5951779215", "Activo", 	    "Abogado Jefe", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "AYDA CATALINA", "GUTIERREZ ROMERO", "5288869692", "Activo",      "Actor", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "CAMILO ALEXANDER", "SAMPER MARTINEZ", "6557432278", "Activo",    "Administrador", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "CESAR AUGUSTO", "BARRAGAN GARCIA", "2442056508", "Activo",       "Administrador de Redes y Recursos de Informática", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "CLAUDIA PILAR", "PINZON YEPES", "2158652368", "Activo",          "Administrador Jefe", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "DIANA PATRICIA", "AGUDELO SUAREZ", "9354493367", "Activo",       "Almacenista (Código Transitorio)", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "DIANA PATRICIA", "PULIDO CHAPARRO", "8983511505", "Activo",      "Almacenista Jefe", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "DIEGO ANDRES", "BOLIVAR FORERO", "4707139296", "Activo",         "Analista Central de Presupuesto", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "DOLLY JANETH", "RAMIREZ LAVERDE", "4842044322", "Activo",        "Analista de Asuntos Audiovisuales", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "FRANCE JURANNI", "ARROYAVE CORREDOR", "5534012815", "Activo",    "Analista de Colocación y Seguimiento de Pasantías", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "GABY ELENITH", "NAVARRETE CORTES", "1096498369", "Activo",       "Analista de Higiene y Seguridad Industrial", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "GLORIA AMPARO", "LOZADA ARAGON", "3636123763", "Activo",         "Analista de Información y Control Estudiantil", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "GUSTAVO ALBERTO", "BOLIVAR CARREÑO", "6332075928", "Activo",     "Analista de Información y Control Estudiantil Jefe", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "GUSTAVO ADOLFO", "GALLO CIFUENTES", "6281339662", "Inactivo",    "Analista de Laboratorio de Protección Ambiental", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "JENNY PAOLA", "VANEGAS RTIZ", "1563064578", "Inactivo",          "Analista de Nómina", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "JESUS ALVEIRO", "MOSCOSO PEÑA", "5256879182", "Inactivo",        "Analista de Organización y Sistemas", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "JORGE HERNANDO", "PALACIOS ZAQUE", "4918448534", "Inactivo",     "Analista de Presupuesto", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "LAURA GISELA", "HERRERA HERRERA", "8915716808", "Inactivo",      "Analista de Recursos Humanos", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "LINA JHINET", "SABOGAL RAMIREZ", "8338867563", "Inactivo",       "Analista de Registro y Control Estadístico", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"],
        [ "LINA PAOLA", "AVILA SAENZ", "6461601988", "Inactivo",           "Analista de Registro y Ctrl. Estadístico Jefe", "<button type='button' name='perfil' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#perfilgestionmodal'>Ver</button>","<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#pruebasgestionmodal'>Ver</button>"]
    ];

    $('#gestionhv').DataTable( {
        "language": {
            "url": "js/json/Spanish.json"
        },
        data: dataSet_Gestionhv,
    } );

    //------------------- Gestion Requisicion
            //------------------- Activos
    var dataSet_GesrecAct = [
        [ "Abogado", "09/11/2018", "20/12/2018", "Activo", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Especialista", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Especialista Sectorial", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Jefe", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Actor", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador de Redes y Recursos de Informática", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador Jefe", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Almacenista (Código Transitorio)", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Almacenista Jefe", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Central de Presupuesto", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Asuntos Audiovisuales", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Colocación y Seguimiento de Pasantías", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Higiene y Seguridad Industrial", "01/05/2018", "10/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Información y Control Estudiantil", "01/05/2018", "10/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Información y Control Estudiantil Jefe", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Laboratorio de Protección Ambiental", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Nómina", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Organización y Sistemas", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Presupuesto", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Recursos Humanos", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Registro y Control Estadístico", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Registro y Ctrl. Estadístico Jefe", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Especialista de Recursos Humanos", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Financiero", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Programador de Sistemas", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Animador Cultural", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Archivista", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Archivista Jefe", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Arquitecto", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Arreglista Musical", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asesor Artístico", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente Administrativo", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente Agropecuario", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente de Almacén (Código Transitorio)", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente de Anatomía y Patología", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Especialista", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Especialista Sectorial", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Jefe", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Actor", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador de Redes y Recursos de Informática", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' >Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador Jefe", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Almacenista (Código Transitorio)", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Almacenista Jefe", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Central de Presupuesto", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Asuntos Audiovisuales", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Colocación y Seguimiento de Pasantías", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Higiene y Seguridad Industrial", "01/05/2018", "10/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Información y Control Estudiantil", "01/05/2018", "10/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Información y Control Estudiantil Jefe", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Laboratorio de Protección Ambiental", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Nómina", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Organización y Sistemas", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Presupuesto", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Recursos Humanos", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Registro y Control Estadístico", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Registro y Ctrl. Estadístico Jefe", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Especialista de Recursos Humanos", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Financiero", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Programador de Sistemas", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Animador Cultural", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Archivista", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Archivista Jefe", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Arquitecto", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Arreglista Musical", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asesor Artístico", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente Administrativo", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente Agropecuario", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente de Almacén (Código Transitorio)", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente de Anatomía y Patología", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='prueba1' onclick='prueba1();'>Eliminar</button>" ],
    ];

    $('#gractivos').DataTable( {
        "language": {
            "url": "js/json/Spanish.json"
        },
        data: dataSet_GesrecAct,
    } );

            //------------------- Inactivos
    var dataSet_GesrecIna = [
        [ "Abogado", "09/11/2018", "20/12/2018", "Activo", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Especialista", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Especialista Sectorial", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Jefe", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Actor", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador de Redes y Recursos de Informática", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador Jefe", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Almacenista (Código Transitorio)", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Almacenista Jefe", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Central de Presupuesto", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Asuntos Audiovisuales", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Colocación y Seguimiento de Pasantías", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Higiene y Seguridad Industrial", "01/05/2018", "10/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Información y Control Estudiantil", "01/05/2018", "10/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Información y Control Estudiantil Jefe", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Laboratorio de Protección Ambiental", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Nómina", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Organización y Sistemas", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Presupuesto", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Recursos Humanos", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Registro y Control Estadístico", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Registro y Ctrl. Estadístico Jefe", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Especialista de Recursos Humanos", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Financiero", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Programador de Sistemas", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Animador Cultural", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Archivista", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Archivista Jefe", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Arquitecto", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Arreglista Musical", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asesor Artístico", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente Administrativo", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente Agropecuario", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente de Almacén (Código Transitorio)", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente de Anatomía y Patología", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Especialista", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Especialista Sectorial", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Abogado Jefe", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Actor", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador de Redes y Recursos de Informática", "09/11/2018", "20/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' >Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Administrador Jefe", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Almacenista (Código Transitorio)", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Almacenista Jefe", "01/05/2018", "15/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Central de Presupuesto", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Asuntos Audiovisuales", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Colocación y Seguimiento de Pasantías", "01/05/2018", "30/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Higiene y Seguridad Industrial", "01/05/2018", "10/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Información y Control Estudiantil", "01/05/2018", "10/05/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Información y Control Estudiantil Jefe", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Laboratorio de Protección Ambiental", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Nómina", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Organización y Sistemas", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Presupuesto", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Recursos Humanos", "27/10/2018", "15/11/2018", "En pruebas" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Registro y Control Estadístico", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista de Registro y Ctrl. Estadístico Jefe", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Especialista de Recursos Humanos", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Financiero", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Analista Programador de Sistemas", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Animador Cultural", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Archivista", "09/11/2018", "13/11/2018", "En revisión" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Archivista Jefe", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Arquitecto", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Arreglista Musical", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asesor Artístico", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente Administrativo", "05/11/2018", "18/12/2018", "Activo" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente Agropecuario", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente de Almacén (Código Transitorio)", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "Asistente de Anatomía y Patología", "09/02/2018", "22/04/2018", "Finalizado" , "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#gestionactivos'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='prueba1' onclick='prueba1();'>Eliminar</button>" ],
    ];

    $('#grinactivos').DataTable( {
        "language": {
            "url": "js/json/Spanish.json"
        },
        data: dataSet_GesrecIna,
    } );

    //------------------- Pruebas Registradas
    var dataSet_GpRegistrada = [
        [ "1845", "Psicológica", "3", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "2845", "Psicológica", "3", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "3845", "Psicológica", "3", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "4845", "Psicológica", "3", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "5845", "Psicológica", "3", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "6564", "Psicológica", "3", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "7566", "Técnica", "4", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "8543", "Técnica", "4", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "9755", "Técnica", "4", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1067", "Técnica", "4", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1154", "Técnica", "4", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1252", "Técnica", "4", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1364", "Técnica", "4", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1445", "Razonamiento abstracto", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1555", "Razonamiento abstracto", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "4562", "Razonamiento abstracto", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "0213", "Razonamiento abstracto", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "7523", "Razonamiento abstracto", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "5959", "Razonamiento abstracto", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "9856", "Razonamiento abstracto", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "5651", "Psicológica´", "1", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "2211", "Psicológica´", "1", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1122", "Psicológica´", "1", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1312", "Psicológica´", "1", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "5341", "Técnica", "1", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1534", "Técnica", "1", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "2786", "Técnica", "2", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "2867", "Técnica", "2", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "4572", "Técnica", "2", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "3473", "Razonamiento abstracto", "2", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "2456", "Razonamiento abstracto", "2", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "7655", "Razonamiento abstracto", "2", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "9876", "Razonamiento abstracto", "2", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "0987", "Razonamiento abstracto", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "1234", "Técnica", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ],
        [ "8763", "Técnica", "5", "<button type='button' name='pruebas' class='btn btn-raised btn-warning' id='1' data-toggle='modal' data-target='#pruebasresgistradas'>Editar</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-danger' id='1' onclick='prueba1();'>Eliminar</button>" ]
    ];

    $('#gpregistradas').DataTable( {
        "language": {
            "url": "js/json/Spanish.json"
        },
        data: dataSet_GpRegistrada,
    } );

    //------------------- Historicos
    var dataSet_Historicos = [
        [ "Oficinista", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Operador de Audio", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Operador de Computación", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Operador de Equipos de Telecomunicaciones", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Operador de Máquina de Reproducción", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Orientador", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Periodista", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Planificador", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Planificador Central", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Planificador de Información y Control Estudiantil", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Programador de Sistemas", "01/06/2014", "05/07/2014", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Promotor Cultural", "05/09/2017", "15/09/2017", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Promotor de Cursos", "05/09/2017", "15/09/2017", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Promotor de Relaciones Públicas e Interinstitucionales", "05/09/2017", "15/09/2017", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Promotor Social", "05/09/2017", "15/09/2017", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Promotor Vendedor de Material Didáctico", "05/09/2017", "15/09/2017", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Psicólogo", "05/09/2017", "15/09/2017", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Psicólogo Jefe", "05/09/2017", "15/09/2017", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Psicopedagogo", "05/09/2017", "15/09/2017", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Recepcionista", "22/07/2016", "28/07/2016", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Registrador de Bienes", "22/07/2016", "28/07/2016", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Revisor de Contraloría", "22/07/2016", "28/07/2016", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Secretaria (o)", "22/07/2016", "28/07/2016", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Secretaria (o) Bilingüe", "22/07/2016", "28/07/2016", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Secretaria (o) Ejecutiva (o)", "22/07/2016", "28/07/2016", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Secretaria (o) Ejecutiva (o) Bilingüe", "22/07/2016", "28/07/2016", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Serigrafista", "22/07/2016", "28/07/2016", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Serigrafista Principal", "22/07/2016", "28/07/2016", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Soplador de Vidrio", "25/11/2013", "05/12/2013", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Soplador de Vidrio Jefe", "25/11/2013", "05/12/2013", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Sub-director Educativo", "25/11/2013", "05/12/2013", "2011/04/25", "Contratado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Supervisor de Asuntos Audiovisuales", "25/11/2013", "05/12/2013", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Supervisor de Biblioteca", "25/11/2013", "05/12/2013", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Supervisor de Carpintería", "25/11/2013", "05/12/2013", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Supervisor de Costos de Obras", "25/11/2013", "05/12/2013", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"],
        [ "Odontólogo", "25/11/2013", "05/12/2013", "2011/04/25", "Rechazado","<button type='button' name='pruebas' class='btn btn-raised btn-primary' id='1' data-toggle='modal' data-target='#historico'>Ver</button>", "<button type='button' name='pruebas' class='btn btn-raised btn-info' id='1' data-toggle='modal' data-target='#auditoria'>Auditoria</button>"]
    ];

    $('#historicos').DataTable( {
        "language": {
            "url": "js/json/Spanish.json"
        },
        data: dataSet_Historicos,
    } );


    //------------------- Dahsboard
             //------------------- GRAFICO LINEAL
    Highcharts.chart('dashboardline', {

        title: {
            text: 'Requisiciones por Area (ultimos 4 años)'
        },

        yAxis: {
            title: {
                text: 'Cantidad de Requisiciones'
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },

        plotOptions: {
            series: {
                label: {
                    connectorAllowed: false
                },
                pointStart: 2015
            }
        },

        series: [{
            name: 'Gestion Humana',
            data: [20, 30, 15, 6]
        }, {
            name: 'Ventas',
            data: [13, 12, 2, 5]
        }, {
            name: 'Ingenieria',
            data: [14, 21, 13, 2]
        }, {
            name: 'Gerencia',
            data: [null, null, 2, 1]
        }, {
            name: 'Diseño',
            data: [9, 6, 14, 3]
        }],

        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        }

    });

              //------------------- GRAFICO BARRA
    Highcharts.chart('dashboardbar', {
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Actualidad Laboral por Areas'
        },
        xAxis: {
            categories: ['Gestion Humana', 'Ventas', 'Ingenieria', 'Gerencia', 'Diseño'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Cantidad de Empleados',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' Empleados'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -40,
            y: 80,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Empleados Activos',
            data: [15, 8, 29, 8, 10]
        }, {
            name: 'Vacantes Disponibles',
            data: [3, 2, 1, 0, 2]
        }, {
            name: 'Empleados en Licencias',
            data: [1, 0, 1, 2, 3]
        }]
    });

    //DATEPICKER
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        //language:  'es',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
       // language:  'es',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });


    //------------------- FIN
} );