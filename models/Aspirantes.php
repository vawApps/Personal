<?php 

	namespace app\models;
	use Yii;
	use yii\db\ActiveRecord;
	use yii\db\Command;
	use PDO;
	use yii\base\Model;

	Class Aspirantes extends Model{	

		public function Consultar_Registro_P($c1,$c2){
			//dsn de la conexion a la base de datos
			$db = Yii::$app->params['hvdb'];		
			$usuario = Yii::$app->params['usuario'];
			$contrasena = Yii::$app->params['password'];
			//establece la conexion con la bese de dato AWA
			$conexion = oci_connect($usuario, $contrasena, $db, 'AL32UTF8');									
			//se hace el llamado al procedimietno que trae la informacion de las mesas
			$stid = oci_parse($conexion,"BEGIN AD_ASPIRANTE_ESTUDIOS_PKG.CONSULTAR_REGISTO_P(:c1,:c2,:c3,:c4,:c5); END;");
			//inicializa el cursor pasa como parametro
			$c3 = oci_new_cursor($conexion);
			//se pasan los parametros del procedimiento 
			oci_bind_by_name($stid, ":c1", $c1, 4);
			oci_bind_by_name($stid, ":c2", $c2, 10);			
			oci_bind_by_name($stid, ':c3', $c3,-1, OCI_B_CURSOR);
			oci_bind_by_name($stid, ":c4", $c4, 10);
			oci_bind_by_name($stid, ":c5", $c5, 200);
			//se ejecuta el procidimiento 
			oci_execute($stid);
			oci_execute($c3,OCI_DEFAULT);
			//se extrae los datos del cursor en un array			
			oci_fetch_all($c3, $cursor);
			//retona el array de datos
			return array($cursor, $c4, $c5); //cursor, resultado, mensaje
		}
	}