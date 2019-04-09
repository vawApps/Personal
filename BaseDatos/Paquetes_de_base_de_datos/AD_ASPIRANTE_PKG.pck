CREATE OR REPLACE PACKAGE AD_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI               IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI                 IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_TIPO_DOCUMENTOI            IN ASPIRANTE.TIPO_DOCUMENTO%TYPE,
                                  PTY_NOMBREI                    IN ASPIRANTE.NOMBRE%TYPE,
                                  PTY_APELLIDOI                  IN ASPIRANTE.APELLIDO%TYPE,
                                  PTY_GENEROI                    IN ASPIRANTE.GENERO%TYPE,
                                  PTY_FECHA_NACIMIENTOI          IN ASPIRANTE.FECHA_NACIMIENTO%TYPE,
                                  PTY_DIRECCIONI                 IN ASPIRANTE.DIRECCION%TYPE,
                                  PTY_TELEFONOI                  IN ASPIRANTE.TELEFONO%TYPE,
                                  PTY_CELULARI                   IN ASPIRANTE.CELULAR%TYPE,
                                  PTY_ESTADO_CIVILI              IN ASPIRANTE.ESTADO_CIVIL%TYPE,
                                  PTY_CORREO_ELECTRONICOI        IN ASPIRANTE.CORREO_ELECTRONICO%TYPE,
                                  PTY_DISCAPACIDADI              IN ASPIRANTE.DISCAPACIDAD%TYPE,
                                  PTY_SALARIO_ASPIRAI            IN ASPIRANTE.SALARIO_ASPIRA%TYPE,
                                  PTY_PROFESIONI                 IN ASPIRANTE.PROFESION%TYPE,
                                  PTY_VIAJAI                     IN ASPIRANTE.VIAJA%TYPE,
                                  PTY_FECHA_INSCRIPCIONI         IN ASPIRANTE.FECHA_INSCRIPCION%TYPE,
                                  PTY_CODIGO_VACANTEI            IN ASPIRANTE.CODIGO_VACANTE%TYPE,
                                  PTY_CODIGO_FORMULARIOI         IN ASPIRANTE.CODIGO_FORMULARIO%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI     IN ASPIRANTE.PROFESION_COMPLEMENTO%TYPE,
                                  PTY_FORMULARIO_PRUEBA_CODIGOI  IN ASPIRANTE.FORMULARIO_PRUEBA_CODIGO%TYPE,
                                  PTY_CIUD_NACII                 IN ASPIRANTE.CIUD_NACI%TYPE,
                                  PTY_CIUD_ACTUALI               IN ASPIRANTE.CIUD_ACTUAL%TYPE,
                                  PNB_RESULTADOO                 OUT NUMBER,
                                  PVH_MENSAJEO                   OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI               IN ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_DOCUMENTOI                 IN ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_TIPO_DOCUMENTOI            IN ASPIRANTE.TIPO_DOCUMENTO%TYPE,
                                    PTY_NOMBREI                    IN ASPIRANTE.NOMBRE%TYPE,
                                    PTY_APELLIDOI                  IN ASPIRANTE.APELLIDO%TYPE,
                                    PTY_GENEROI                    IN ASPIRANTE.GENERO%TYPE,
                                    PTY_FECHA_NACIMIENTOI          IN ASPIRANTE.FECHA_NACIMIENTO%TYPE,
                                    PTY_DIRECCIONI                 IN ASPIRANTE.DIRECCION%TYPE,
                                    PTY_TELEFONOI                  IN ASPIRANTE.TELEFONO%TYPE,
                                    PTY_CELULARI                   IN ASPIRANTE.CELULAR%TYPE,
                                    PTY_ESTADO_CIVILI              IN ASPIRANTE.ESTADO_CIVIL%TYPE,
                                    PTY_CORREO_ELECTRONICOI        IN ASPIRANTE.CORREO_ELECTRONICO%TYPE,
                                    PTY_DISCAPACIDADI              IN ASPIRANTE.DISCAPACIDAD%TYPE,
                                    PTY_SALARIO_ASPIRAI            IN ASPIRANTE.SALARIO_ASPIRA%TYPE,
                                    PTY_PROFESIONI                 IN ASPIRANTE.PROFESION%TYPE,
                                    PTY_VIAJAI                     IN ASPIRANTE.VIAJA%TYPE,
                                    PTY_FECHA_INSCRIPCIONI         IN ASPIRANTE.FECHA_INSCRIPCION%TYPE,
                                    PTY_CODIGO_VACANTEI            IN ASPIRANTE.CODIGO_VACANTE%TYPE,
                                    PTY_CODIGO_FORMULARIOI         IN ASPIRANTE.CODIGO_FORMULARIO%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI     IN ASPIRANTE.PROFESION_COMPLEMENTO%TYPE,
                                    PTY_FORMULARIO_PRUEBA_CODIGOI  IN ASPIRANTE.FORMULARIO_PRUEBA_CODIGO%TYPE,
                                    PTY_CIUD_NACII                 IN ASPIRANTE.CIUD_NACI%TYPE,
                                    PTY_CIUD_ACTUALI               IN ASPIRANTE.CIUD_ACTUAL%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI  IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI    IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PRF_REGISTROO     OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO    OUT NUMBER,
                                  PVH_MENSAJEO      OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI  IN ASPIRANTE.COD_EMPRESA%TYPE,
                               PTY_DOCUMENTOI    IN ASPIRANTE.DOCUMENTO%TYPE,
                               PVH_MENSAJEO      OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI               IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI                 IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_TIPO_DOCUMENTOI            IN ASPIRANTE.TIPO_DOCUMENTO%TYPE,
                                  PTY_NOMBREI                    IN ASPIRANTE.NOMBRE%TYPE,
                                  PTY_APELLIDOI                  IN ASPIRANTE.APELLIDO%TYPE,
                                  PTY_GENEROI                    IN ASPIRANTE.GENERO%TYPE,
                                  PTY_FECHA_NACIMIENTOI          IN ASPIRANTE.FECHA_NACIMIENTO%TYPE,
                                  PTY_DIRECCIONI                 IN ASPIRANTE.DIRECCION%TYPE,
                                  PTY_TELEFONOI                  IN ASPIRANTE.TELEFONO%TYPE,
                                  PTY_CELULARI                   IN ASPIRANTE.CELULAR%TYPE,
                                  PTY_ESTADO_CIVILI              IN ASPIRANTE.ESTADO_CIVIL%TYPE,
                                  PTY_CORREO_ELECTRONICOI        IN ASPIRANTE.CORREO_ELECTRONICO%TYPE,
                                  PTY_DISCAPACIDADI              IN ASPIRANTE.DISCAPACIDAD%TYPE,
                                  PTY_SALARIO_ASPIRAI            IN ASPIRANTE.SALARIO_ASPIRA%TYPE,
                                  PTY_PROFESIONI                 IN ASPIRANTE.PROFESION%TYPE,
                                  PTY_VIAJAI                     IN ASPIRANTE.VIAJA%TYPE,
                                  PTY_FECHA_INSCRIPCIONI         IN ASPIRANTE.FECHA_INSCRIPCION%TYPE,
                                  PTY_CODIGO_VACANTEI            IN ASPIRANTE.CODIGO_VACANTE%TYPE,
                                  PTY_CODIGO_FORMULARIOI         IN ASPIRANTE.CODIGO_FORMULARIO%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI     IN ASPIRANTE.PROFESION_COMPLEMENTO%TYPE,
                                  PTY_FORMULARIO_PRUEBA_CODIGOI  IN ASPIRANTE.FORMULARIO_PRUEBA_CODIGO%TYPE,
                                  PTY_CIUD_NACII                 IN ASPIRANTE.CIUD_NACI%TYPE,
                                  PTY_CIUD_ACTUALI               IN ASPIRANTE.CIUD_ACTUAL%TYPE,
                                  PNB_RESULTADOO                 OUT NUMBER,
                                  PVH_MENSAJEO                   OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO ASPIRANTE VALUES (PTY_DOCUMENTOI,PTY_TIPO_DOCUMENTOI,PTY_NOMBREI,
                                   PTY_APELLIDOI,PTY_GENEROI,PTY_FECHA_NACIMIENTOI,PTY_DIRECCIONI,
                                   PTY_TELEFONOI,PTY_CELULARI,PTY_ESTADO_CIVILI,PTY_CORREO_ELECTRONICOI,
                                   PTY_DISCAPACIDADI,PTY_SALARIO_ASPIRAI,PTY_PROFESIONI,PTY_VIAJAI,
                                   PTY_FECHA_INSCRIPCIONI,PTY_CODIGO_VACANTEI,PTY_CODIGO_FORMULARIOI,
                                   PTY_PROFESION_COMPLEMENTOI,PTY_FORMULARIO_PRUEBA_CODIGOI,PTY_CIUD_NACII,
                                   PTY_CIUD_ACTUALI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_ASPIRANTE_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI               IN ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_DOCUMENTOI                 IN ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_TIPO_DOCUMENTOI            IN ASPIRANTE.TIPO_DOCUMENTO%TYPE,
                                    PTY_NOMBREI                    IN ASPIRANTE.NOMBRE%TYPE,
                                    PTY_APELLIDOI                  IN ASPIRANTE.APELLIDO%TYPE,
                                    PTY_GENEROI                    IN ASPIRANTE.GENERO%TYPE,
                                    PTY_FECHA_NACIMIENTOI          IN ASPIRANTE.FECHA_NACIMIENTO%TYPE,
                                    PTY_DIRECCIONI                 IN ASPIRANTE.DIRECCION%TYPE,
                                    PTY_TELEFONOI                  IN ASPIRANTE.TELEFONO%TYPE,
                                    PTY_CELULARI                   IN ASPIRANTE.CELULAR%TYPE,
                                    PTY_ESTADO_CIVILI              IN ASPIRANTE.ESTADO_CIVIL%TYPE,
                                    PTY_CORREO_ELECTRONICOI        IN ASPIRANTE.CORREO_ELECTRONICO%TYPE,
                                    PTY_DISCAPACIDADI              IN ASPIRANTE.DISCAPACIDAD%TYPE,
                                    PTY_SALARIO_ASPIRAI            IN ASPIRANTE.SALARIO_ASPIRA%TYPE,
                                    PTY_PROFESIONI                 IN ASPIRANTE.PROFESION%TYPE,
                                    PTY_VIAJAI                     IN ASPIRANTE.VIAJA%TYPE,
                                    PTY_FECHA_INSCRIPCIONI         IN ASPIRANTE.FECHA_INSCRIPCION%TYPE,
                                    PTY_CODIGO_VACANTEI            IN ASPIRANTE.CODIGO_VACANTE%TYPE,
                                    PTY_CODIGO_FORMULARIOI         IN ASPIRANTE.CODIGO_FORMULARIO%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI     IN ASPIRANTE.PROFESION_COMPLEMENTO%TYPE,
                                    PTY_FORMULARIO_PRUEBA_CODIGOI  IN ASPIRANTE.FORMULARIO_PRUEBA_CODIGO%TYPE,
                                    PTY_CIUD_NACII                 IN ASPIRANTE.CIUD_NACI%TYPE,
                                    PTY_CIUD_ACTUALI               IN ASPIRANTE.CIUD_ACTUAL%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE ASPIRANTE
         SET TIPO_DOCUMENTO           = NVL (PTY_TIPO_DOCUMENTOI           , TIPO_DOCUMENTO          ),
             NOMBRE                   = NVL (PTY_NOMBREI                   , NOMBRE                  ),
             APELLIDO                 = NVL (PTY_APELLIDOI                 , APELLIDO                ),
             GENERO                   = NVL (PTY_GENEROI                   , GENERO                  ),
             FECHA_NACIMIENTO         = NVL (PTY_FECHA_NACIMIENTOI         , FECHA_NACIMIENTO        ),
             DIRECCION                = NVL (PTY_DIRECCIONI                , DIRECCION               ),
             TELEFONO                 = NVL (PTY_TELEFONOI                 , TELEFONO                ),
             CELULAR                  = NVL (PTY_CELULARI                  , CELULAR                 ),
             ESTADO_CIVIL             = NVL (PTY_ESTADO_CIVILI             , ESTADO_CIVIL            ),
             CORREO_ELECTRONICO       = NVL (PTY_CORREO_ELECTRONICOI       , CORREO_ELECTRONICO      ),
             DISCAPACIDAD             = NVL (PTY_DISCAPACIDADI             , DISCAPACIDAD            ),
             SALARIO_ASPIRA           = NVL (PTY_SALARIO_ASPIRAI           , SALARIO_ASPIRA          ),
             PROFESION                = NVL (PTY_PROFESIONI                , PROFESION               ),
             VIAJA                    = NVL (PTY_VIAJAI                    , VIAJA                   ),
             FECHA_INSCRIPCION        = NVL (PTY_FECHA_INSCRIPCIONI        , FECHA_INSCRIPCION       ),
             CODIGO_VACANTE           = NVL (PTY_CODIGO_VACANTEI           , CODIGO_VACANTE          ),
             CODIGO_FORMULARIO        = NVL (PTY_CODIGO_FORMULARIOI        , CODIGO_FORMULARIO       ),
             PROFESION_COMPLEMENTO    = NVL (PTY_PROFESION_COMPLEMENTOI    , PROFESION_COMPLEMENTO   ),
             FORMULARIO_PRUEBA_CODIGO = NVL (PTY_FORMULARIO_PRUEBA_CODIGOI , FORMULARIO_PRUEBA_CODIGO),
             CIUD_NACI                = NVL (PTY_CIUD_NACII                , CIUD_NACI               ),
             CIUD_ACTUAL              = NVL (PTY_CIUD_ACTUALI              , CIUD_ACTUAL             )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   DOCUMENTO = PTY_DOCUMENTOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI  IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI    IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PRF_REGISTROO     OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO    OUT NUMBER,
                                  PVH_MENSAJEO      OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           DOCUMENTO,
           TIPO_DOCUMENTO,            
           NOMBRE,                    
           APELLIDO,                  
           GENERO,                    
           FECHA_NACIMIENTO,          
           DIRECCION,                 
           TELEFONO,                  
           CELULAR,                   
           ESTADO_CIVIL,              
           CORREO_ELECTRONICO,        
           DISCAPACIDAD,              
           SALARIO_ASPIRA,            
           PROFESION,                 
           VIAJA,                     
           FECHA_INSCRIPCION,         
           CODIGO_VACANTE,           
           CODIGO_FORMULARIO,         
           PROFESION_COMPLEMENTO,     
           FORMULARIO_PRUEBA_CODIGO, 
           CIUD_NACI,                
           CIUD_ACTUAL              
     FROM ASPIRANTE
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   DOCUMENTO = PTY_DOCUMENTOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI  IN ASPIRANTE.COD_EMPRESA%TYPE,
                               PTY_DOCUMENTOI    IN ASPIRANTE.DOCUMENTO%TYPE,
                               PVH_MENSAJEO      OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM ASPIRANTE
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   DOCUMENTO = PTY_DOCUMENTOI;
   
   VBO_EXISTE_REGISTRO BOOLEAN := TRUE;
   VNB_CONTEO NUMBER;
   
   BEGIN
              
   OPEN CUR_EXISTE_REGISTRO;
    FETCH CUR_EXISTE_REGISTRO INTO VNB_CONTEO;
     IF VNB_CONTEO < 1 THEN
        VBO_EXISTE_REGISTRO := FALSE;
     END IF;
     CLOSE CUR_EXISTE_REGISTRO;
        
   
   RETURN VBO_EXISTE_REGISTRO;
      EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en AD_ASPIRANTE_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_ASPIRANTE_PKG;
/
