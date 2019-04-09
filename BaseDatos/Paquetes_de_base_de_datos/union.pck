CREATE OR REPLACE PACKAGE AD_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                               PTY_CODIGOI        IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_ASPIRANTE_ESTUDIOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO ASPIRANTE_ESTUDIOS VALUES (PTY_CODIGOI,PTY_DOCUMENTOI,PTY_UNIVERSIDADI,PTY_PROFESIONI,
                                             PTY_FECHA_INICIOI,PTY_FECHA_FINI,PTY_ESTADO_ESTUDIOI,PTY_IDIOMAI,
                                             PTY_NIVEL_IDIOMAI,PTY_COD_CIUDADI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_ASPIRANTE_ESTUDIOS_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
   IS

   BEGIN
      UPDATE ASPIRANTE_ESTUDIOS
         SET DOCUMENTO            = NVL (PTY_DOCUMENTOI          , DOCUMENTO         ),
             UNIVERSIDAD          = NVL (PTY_UNIVERSIDADI        , UNIVERSIDAD       ),
             PROFESION            = NVL (PTY_PROFESIONI          , PROFESION         ),
             FECHA_INICIO         = NVL (PTY_FECHA_INICIOI       , FECHA_INICIO      ),
             FECHA_FIN            = NVL (PTY_FECHA_FINI          , FECHA_FIN         ),
             ESTADO_ESTUDIO       = NVL (PTY_ESTADO_ESTUDIOI     , ESTADO_ESTUDIO    ),
             IDIOMA               = NVL (PTY_IDIOMAI             , IDIOMA            ),
             NIVEL_IDIOMA         = NVL (PTY_NIVEL_IDIOMAI       , NIVEL_IDIOMA      ),
             COD_CIUDAD           = NVL (PTY_COD_CIUDADI         , COD_CIUDAD        )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_ASPIRANTE_ESTUDIOS_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DOCUMENTO,      
           UNIVERSIDAD,    
           PROFESION,      
           FECHA_INICIO,   
           FECHA_FIN,      
           ESTADO_ESTUDIO, 
           IDIOMA,         
           NIVEL_IDIOMA,   
           COD_CIUDAD 
     FROM ASPIRANTE_ESTUDIOS
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_ASPIRANTE_ESTUDIOS_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                               PTY_CODIGOI        IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM ASPIRANTE_ESTUDIOS
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_ASPIRANTE_ESTUDIOS_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_ASPIRANTE_ESTUDIOS_PKG;
/
CREATE OR REPLACE PACKAGE AD_ASPIRANTE_EXPERIENCIA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                  PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                  PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                  PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                    PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                    PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                    PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                    PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                    PNB_RESULTADOO      OUT NUMBER,
                                    PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_ASPIRANTE_EXPERIENCIA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_ASPIRANTE_EXPERIENCIA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                  PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                  PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                  PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO ASPIRANTE_EXPERIENCIA VALUES (PTY_CODIGOI,PTY_DOCUMENTOI,PTY_EMPRESAI,PTY_CARGOI,
                                                PTY_FECHA_INICIOI,PTY_FECHA_FINI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_ASPIRANTE_EXPERIENCIA_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                    PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                    PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                    PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                    PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                    PNB_RESULTADOO      OUT NUMBER,
                                    PVH_MENSAJEO        OUT VARCHAR2)
   IS

   BEGIN
      UPDATE ASPIRANTE_EXPERIENCIA
         SET DOCUMENTO            = NVL (PTY_DOCUMENTOI        , DOCUMENTO         ),
             EMPRESA              = NVL (PTY_EMPRESAI          , EMPRESA           ),
             CARGO                = NVL (PTY_CARGOI            , CARGO             ),
             FECHA_INICIO         = NVL (PTY_FECHA_INICIOI     , FECHA_INICIO      ),
             FECHA_FIN            = NVL (PTY_FECHA_FINI        , FECHA_FIN         )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_ASPIRANTE_EXPERIENCIA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DOCUMENTO,      
           EMPRESA,    
           CARGO,      
           FECHA_INICIO,   
           FECHA_FIN 
     FROM ASPIRANTE_EXPERIENCIA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_ASPIRANTE_EXPERIENCIA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM ASPIRANTE_EXPERIENCIA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se presento un error en AD_ASPIRANTE_EXPERIENCIA_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_ASPIRANTE_EXPERIENCIA_PKG;
/
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
CREATE OR REPLACE PACKAGE AD_CARGOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN CARGOS.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN CARGOS.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_CARGOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_CARGOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN CARGOS.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO CARGOS VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_CARGOS_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN CARGOS.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE CARGOS
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_CARGOS_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM CARGOS
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_CARGOS_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM CARGOS
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_CARGOS_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_CARGOS_PKG;
/
CREATE OR REPLACE PACKAGE AD_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO CONTACTO VALUES (PTY_CODIGOI,PTY_COD_VACANTEI,PTY_CONTACTOI,PTY_CORREO_CONTACTOI,
                                   PTY_RECIBE_HV_CORREOI,PTY_TELEFONO_CONTACTOI,PTY_FECHA_ENTREVISTAI,
                                   PTY_LUGAR_ENTREVISTAI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_CONTACTO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
   IS

   BEGIN
      UPDATE CONTACTO
         SET COD_VACANTE            = NVL (PTY_COD_VACANTEI           , COD_VACANTE            ),
             CONTACTO               = NVL (PTY_CONTACTOI              , CONTACTO               ),
             CORREO_CONTACTO        = NVL (PTY_CORREO_CONTACTOI       , CORREO_CONTACTO        ),
             RECIBE_HV_CORREO       = NVL (PTY_RECIBE_HV_CORREOI      , RECIBE_HV_CORREO       ),
             TELEFONO_CONTACTO      = NVL (PTY_TELEFONO_CONTACTOI     , TELEFONO_CONTACTO      ),
             FECHA_ENTREVISTA       = NVL (PTY_FECHA_ENTREVISTAI      , FECHA_ENTREVISTA       ),
             LUGAR_ENTREVISTA       = NVL (PTY_LUGAR_ENTREVISTAI      , LUGAR_ENTREVISTA       )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_CONTACTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           COD_VACANTE,   
           CONTACTO,         
           CORREO_CONTACTO,  
           RECIBE_HV_CORREO, 
           TELEFONO_CONTACTO,
           FECHA_ENTREVISTA, 
           LUGAR_ENTREVISTA
     FROM CONTACTO
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_CONTACTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM CONTACTO
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_CONTACTO_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE AD_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2);
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2);
  /*************************************************************/
  FUNCTION EXISTE_REGISTRO_F(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                             PVH_MENSAJEO OUT VARCHAR2) RETURN BOOLEAN;
  /*************************************************************/
END AD_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2) IS
  BEGIN
  
    OPEN PRF_REGISTROO FOR
      SELECT CODIGO, DESCRIPCION, TIPO, COD_PADRE FROM DEPARTAMENTOS; /* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
    PNB_RESULTADOO := 1;
  
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se presento un error en AD_DEPARTAMENTOS_PKG.CONSULTAR_DEPARTAMENTO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_DEPARTAMENTO_P;
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2) IS
  BEGIN
  
    OPEN PRF_REGISTROO FOR
      SELECT CODIGO, DESCRIPCION, TIPO, COD_PADRE
        FROM DEPARTAMENTOS
       WHERE COD_PADRE = PTY_COD_PADREI;
    PNB_RESULTADOO := 1;
  
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se presento un error en AD_DEPARTAMENTOS_PKG.CONSULTAR_MUNICIPIO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_MUNICIPIO_P;
  /*************************************************************/
  FUNCTION EXISTE_REGISTRO_F(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                             PVH_MENSAJEO OUT VARCHAR2) RETURN BOOLEAN IS
  
    CURSOR CUR_EXISTE_REGISTRO IS
      SELECT COUNT(1) FROM DEPARTAMENTOS WHERE CODIGO = PTY_CODIGOI;
  
    VBO_EXISTE_REGISTRO BOOLEAN := TRUE;
    VNB_CONTEO          NUMBER;
  
  BEGIN
  
    OPEN CUR_EXISTE_REGISTRO;
    FETCH CUR_EXISTE_REGISTRO
      INTO VNB_CONTEO;
    IF VNB_CONTEO < 1 THEN
      VBO_EXISTE_REGISTRO := FALSE;
    END IF;
    CLOSE CUR_EXISTE_REGISTRO;
  
    RETURN VBO_EXISTE_REGISTRO;
  EXCEPTION
    WHEN OTHERS THEN
      PVH_MENSAJEO := 'Se present? un error en AD_DEPARTAMENTOS_PKG.EXISTE_REGISTRO_F ' ||
                      SQLCODE || ' - ' || SQLERRM;
  END EXISTE_REGISTRO_F;
  /*************************************************************/
END AD_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE AD_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2)RETURN BOOLEAN;
                               
   /*************************************************************/
END AD_EMPRESA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI IN EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI IN EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI      IN EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO EMPRESA VALUES (PTY_COD_EMPRESAI,PTY_NIT_EMPRESAI,PTY_NOM_EMPRESAI,PTY_ESTADOI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en AD_EMPRESA_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
/*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI IN EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI IN EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI      IN EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE EMPRESA
         SET NIT_EMPRESA = NVL (PTY_NIT_EMPRESAI, NIT_EMPRESA),
             NOMBRE_EMPRESA = NVL (PTY_NOM_EMPRESAI, NOMBRE_EMPRESA),
             ESTADO = NVL (PTY_ESTADOI, ESTADO)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en AD_EMPRESA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           NIT_EMPRESA, 
           NOMBRE_EMPRESA,
           ESTADO
     FROM EMPRESA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en AD_EMPRESA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN EMPRESA.COD_EMPRESA%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM EMPRESA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI;
   
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
               'Se presentó un error en AD_EMPRESA_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_EMPRESA_PKG;
/
CREATE OR REPLACE PACKAGE AD_ESCALA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN ESCALA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN ESCALA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_ESCALA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_ESCALA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN ESCALA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO ESCALA VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en AD_ESTADO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN ESCALA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE ESCALA
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en AD_ESTADO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM ESCALA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en AD_ESCALA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM ESCALA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se presentï¿½ un error en AD_ESCALA_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_ESCALA_PKG;
/
CREATE OR REPLACE PACKAGE AD_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI       IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI  IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO    OUT NUMBER,
                                  PVH_MENSAJEO      OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI       IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI  IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO    OUT NUMBER,
                                    PVH_MENSAJEO      OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_FORMULARIO_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI       IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI  IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO    OUT NUMBER,
                                  PVH_MENSAJEO      OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO FORMULARIO_PRUEBA VALUES (PTY_CODIGOI,PTY_ESCALAI,PTY_TIPO_PRUEBAI,PTY_CALIFICACIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_FORMULARIO_PRUEBA_ASPIRANTE_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI       IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI  IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO    OUT NUMBER,
                                    PVH_MENSAJEO      OUT VARCHAR2)
   IS

   BEGIN
      UPDATE FORMULARIO_PRUEBA
         SET ESCALA         = NVL (PTY_ESCALAI      ,   ESCALA        ),
             TIPO_PRUEBA    = NVL (PTY_TIPO_PRUEBAI ,   TIPO_PRUEBA   ),
             CALIFICACION   = NVL (PTY_CALIFICACIONI,   CALIFICACION  )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_FORMULARIO_PRUEBA_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           ESCALA,      
           TIPO_PRUEBA, 
           CALIFICACION
     FROM FORMULARIO_PRUEBA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_FORMULARIO_PRUEBA_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM FORMULARIO_PRUEBA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_FORMULARIO_PRUEBA_ASPIRANTE_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_FORMULARIO_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE AD_GENERO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN GENERO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN GENERO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_GENERO_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_GENERO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN GENERO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO GENERO VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_GENERO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN GENERO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE GENERO
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_GENERO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM GENERO
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_GENERO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM GENERO
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_GENERO_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_GENERO_PKG;
/
CREATE OR REPLACE PACKAGE AD_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI   IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI   IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI   IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI   IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_HABILIDADES_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI   IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI   IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO HABILIDADES_ASPIRANTE VALUES (PTY_CODIGOI,PTY_DOCUMENTOI,PTY_HABILIDADI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_HABILIDADES_ASPIRANTE_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI   IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI   IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE HABILIDADES_ASPIRANTE
         SET DOCUMENTO   = NVL (PTY_DOCUMENTOI,   DOCUMENTO  ),
             HABILIDAD   = NVL (PTY_HABILIDADI,   HABILIDAD  )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_HABILIDADES_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DOCUMENTO,
           HABILIDAD
     FROM HABILIDADES_ASPIRANTE
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_HABILIDADES_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM HABILIDADES_ASPIRANTE
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_HABILIDADES_ASPIRANTE_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_HABILIDADES_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE AD_HABILIDADES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN HABILIDADES.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN HABILIDADES.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_HABILIDADES_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_HABILIDADES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN HABILIDADES.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO HABILIDADES VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_HABILIDADES_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN HABILIDADES.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE HABILIDADES
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_HABILIDADES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM HABILIDADES
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_HABILIDADES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM HABILIDADES
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_HABILIDADES_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_HABILIDADES_PKG;
/
CREATE OR REPLACE PACKAGE AD_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI IN PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI IN PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI IN PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI IN PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                               PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_PERFIL_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI IN PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI IN PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO PERFIL VALUES (PTY_COD_PERFILI,PTY_TIPO_PERFILI, PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PERFIL_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI IN PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI IN PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE PERFIL
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION),
             TIPO_PERFIL = NVL (PTY_TIPO_PERFILI, TIPO_PERFIL)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   COD_PERFIL = PTY_COD_PERFILI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PERFIL_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI   IN PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_PERFIL,
           TIPO_PERFIL,
           DESCRIPCION
     FROM PERFIL
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_PERFIL = PTY_COD_PERFILI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PERFIL_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                               PTY_COD_PERFILI   IN PERFIL.COD_PERFIL%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM PERFIL
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_PERFIL = PTY_COD_PERFILI;
   
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
               'Se present? un error en AD_PERFIL_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_PERFIL_PKG;
/
CREATE OR REPLACE PACKAGE AD_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI  IN PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN PROFESIONES.COD_EMPRESA%TYPE,
                               PTY_COD_PROFESIONI  IN PROFESIONES.COD_PROFESION%TYPE,
                               PVH_MENSAJEO        OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_PROFESIONES_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI  IN PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_PROFESION,
           DESCRIPCION
     FROM PROFESIONES
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_PROFESION = PTY_COD_PROFESIONI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PROFESIONES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN PROFESIONES.COD_EMPRESA%TYPE,
                               PTY_COD_PROFESIONI  IN PROFESIONES.COD_PROFESION%TYPE,
                               PVH_MENSAJEO        OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM PROFESIONES
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_PROFESION = PTY_COD_PROFESIONI;
   
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
               'Se present? un error en AD_PROFESIONES_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_PROFESIONES_PKG;
/
CREATE OR REPLACE PACKAGE AD_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI    IN PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN PROFESION_DETALLE.COD_EMPRESA%TYPE,
                               PTY_COD_PRODETAI  IN PROFESION_DETALLE.COD_PRODETA%TYPE,
                               PVH_MENSAJEO        OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_PROFESION_DETALLE_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI    IN PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_PRODETA,
           COD_PROFESION,
           DESCRIPCION
     FROM PROFESION_DETALLE
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_PRODETA = PTY_COD_PRODETAI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PROFESION_DETALLE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN PROFESION_DETALLE.COD_EMPRESA%TYPE,
                               PTY_COD_PRODETAI  IN PROFESION_DETALLE.COD_PRODETA%TYPE,
                               PVH_MENSAJEO        OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM PROFESION_DETALLE
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_PRODETA = PTY_COD_PRODETAI;
   
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
               'Se present? un error en AD_PROFESION_DETALLE_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_PROFESION_DETALLE_PKG;
/
CREATE OR REPLACE PACKAGE AD_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI IN TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI IN TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                               PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_TIPO_DE_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI IN TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO TIPO_DE_PRUEBA VALUES (PTY_COD_PRUEBAI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DE_PRUEBA_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI IN TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE TIPO_DE_PRUEBA
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   COD_PRUEBA = PTY_COD_PRUEBAI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DE_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_PRUEBA,
           DESCRIPCION
     FROM TIPO_DE_PRUEBA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_PRUEBA = PTY_COD_PRUEBAI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                               PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM TIPO_DE_PRUEBA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_PRUEBA = PTY_COD_PRUEBAI;
   
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
               'Se present? un error en AD_TIPO_DE_PRUEBA_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_TIPO_DE_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE AD_TIPO_DOCUMENTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_TIPO_DOCUMENTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_TIPO_DOCUMENTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO TIPO_DOCUMENTO VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DOCUMENTO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE TIPO_DOCUMENTO
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DOCUMENTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM TIPO_DOCUMENTO
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DOCUMENTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM TIPO_DOCUMENTO
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_TIPO_DOCUMENTO_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_TIPO_DOCUMENTO_PKG;
/
CREATE OR REPLACE PACKAGE AD_USUARIO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                  PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                  PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                  PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                  PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                    PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                    PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                    PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                    PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                    PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                    PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                    PNB_RESULTADOO         OUT NUMBER,
                                    PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PRF_REGISTROO          OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN USUARIO.COD_EMPRESA%TYPE,
                               PTY_COD_USUARIOI   IN USUARIO.COD_USUARIO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_USUARIO_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_USUARIO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                  PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                  PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                  PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                  PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO USUARIO VALUES (PTY_COD_USUARIOI,PTY_DOCUMENTOI,PTY_NOMBRE_USUARIOI,
                                  PTY_CONTRASENAI,PTY_COD_PERFILI,PTY_ESTADOI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_USUARIO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                    PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                    PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                    PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                    PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                    PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                    PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                    PNB_RESULTADOO         OUT NUMBER,
                                    PVH_MENSAJEO           OUT VARCHAR2)
   IS

   BEGIN
      UPDATE USUARIO
         SET DOCUMENTO              = NVL (PTY_DOCUMENTOI            , DOCUMENTO           ),
             NOMBRE_USUARIO         = NVL (PTY_NOMBRE_USUARIOI       , NOMBRE_USUARIO      ),
             CONTRASENA             = NVL (PTY_CONTRASENAI           , CONTRASENA          ),
             COD_PERFIL             = NVL (PTY_COD_PERFILI           , COD_PERFIL          ),
             ESTADO                 = NVL (PTY_ESTADOI               , ESTADO              )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   COD_USUARIO = PTY_COD_USUARIOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_USUARIO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PRF_REGISTROO          OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_USUARIO,
           DOCUMENTO,      
           NOMBRE_USUARIO, 
           CONTRASENA,     
           COD_PERFIL,     
           ESTADO
     FROM USUARIO
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_USUARIO = PTY_COD_USUARIOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_USUARIO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN USUARIO.COD_EMPRESA%TYPE,
                               PTY_COD_USUARIOI   IN USUARIO.COD_USUARIO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM USUARIO
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_USUARIO = PTY_COD_USUARIOI;
   
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
               'Se present? un error en AD_USUARIO_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_USUARIO_PKG;
/
CREATE OR REPLACE PACKAGE AD_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_VACANTES_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO VACANTES VALUES (PTY_CODIGOI,PTY_CODIGO_CARGOI,PTY_FECHA_INICIALI,
                                   PTY_FECHA_FINALI,PTY_DESCRI_VACANTEI,PTY_HABILIDADES_REQI,PTY_ACTI_REALIZAI,
                                   PTY_JORNADA_LABORALI,PTY_TIPO_EMPLEOI,PTY_RANGO_SALARIALI,PTY_CANTIDAD_VACANTEI,
                                   PTY_EXPERIENCIA_MINIMAI,PTY_IDIOMA_REQUERIDOI,PTY_NIVEL_ESTUDIOI,PTY_DISPONIBLE_VIAJEI,
                                   PTY_ACEPTA_DISCAPACIDADI,PTY_COD_CIUDADI,PTY_ESTADOI,PTY_PROFESIONI,
                                   PTY_PROFESION_COMPLEMENTOI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE VACANTES
         SET CODIGO_CARGO          = NVL (PTY_CODIGO_CARGOI         , CODIGO_CARGO         ),
             FECHA_INICIAL         = NVL (PTY_FECHA_INICIALI        , FECHA_INICIAL        ),
             FECHA_FINAL           = NVL (PTY_FECHA_FINALI          , FECHA_FINAL          ),
             DESCRI_VACANTE        = PTY_DESCRI_VACANTEI       ,
             HABILIDADES_REQ       = NVL (PTY_HABILIDADES_REQI      , HABILIDADES_REQ      ),
             ACTI_REALIZA          = NVL (PTY_ACTI_REALIZAI         , ACTI_REALIZA         ),
             JORNADA_LABORAL       = NVL (PTY_JORNADA_LABORALI      , JORNADA_LABORAL      ),
             TIPO_EMPLEO           = NVL (PTY_TIPO_EMPLEOI          , TIPO_EMPLEO          ),
             RANGO_SALARIAL        = NVL (PTY_RANGO_SALARIALI       , RANGO_SALARIAL       ),
             CANTIDAD_VACANTE      = NVL (PTY_CANTIDAD_VACANTEI     , CANTIDAD_VACANTE     ),
             EXPERIENCIA_MINIMA    = NVL (PTY_EXPERIENCIA_MINIMAI   , EXPERIENCIA_MINIMA   ),
             IDIOMA_REQUERIDO      = NVL (PTY_IDIOMA_REQUERIDOI     , IDIOMA_REQUERIDO     ),
             NIVEL_ESTUDIO         = NVL (PTY_NIVEL_ESTUDIOI        , NIVEL_ESTUDIO        ),
             DISPONIBLE_VIAJE      = NVL (PTY_DISPONIBLE_VIAJEI     , DISPONIBLE_VIAJE     ),
             ACEPTA_DISCAPACIDAD   = NVL (PTY_ACEPTA_DISCAPACIDADI  , ACEPTA_DISCAPACIDAD  ),
             COD_CIUDAD            = NVL (PTY_COD_CIUDADI           , COD_CIUDAD           ),
             ESTADO                = NVL (PTY_ESTADOI               , ESTADO               ),
             PROFESION             = NVL (PTY_PROFESIONI            , PROFESION            ),
             PROFESION_COMPLEMENTO = NVL (PTY_PROFESION_COMPLEMENTOI, PROFESION_COMPLEMENTO)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           CODIGO_CARGO,         
           FECHA_INICIAL,        
           FECHA_FINAL,          
           DESCRI_VACANTE,       
           HABILIDADES_REQ,      
           ACTI_REALIZA,         
           JORNADA_LABORAL,      
           TIPO_EMPLEO,          
           RANGO_SALARIAL,       
           CANTIDAD_VACANTE,     
           EXPERIENCIA_MINIMA,   
           IDIOMA_REQUERIDO,     
           NIVEL_ESTUDIO,        
           DISPONIBLE_VIAJE,     
           ACEPTA_DISCAPACIDAD,  
           COD_CIUDAD,          
           ESTADO,               
           PROFESION,            
           PROFESION_COMPLEMENTO
     FROM VACANTES
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM VACANTES
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_VACANTES_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_VACANTES_PKG;
/
CREATE OR REPLACE PACKAGE CA_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_ASPIRANTE_ESTUDIOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_CIUDADI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la ciudad del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_ESTUDIOS_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                        PTY_CODIGOI,
                                                        PTY_DOCUMENTOI,     
                                                        PTY_UNIVERSIDADI,   
                                                        PTY_PROFESIONI,     
                                                        PTY_FECHA_INICIOI,  
                                                        PTY_FECHA_FINI,     
                                                        PTY_ESTADO_ESTUDIOI,
                                                        PTY_IDIOMAI,        
                                                        PTY_NIVEL_IDIOMAI,  
                                                        PTY_COD_CIUDADI,
                                                        PNB_RESULTADOO,
                                                        PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_ESTUDIOS_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_ESTUDIOS_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                          PTY_CODIGOI,     
                                                          PTY_DOCUMENTOI,     
                                                          PTY_UNIVERSIDADI,   
                                                          PTY_PROFESIONI,     
                                                          PTY_FECHA_INICIOI,  
                                                          PTY_FECHA_FINI,     
                                                          PTY_ESTADO_ESTUDIOI,
                                                          PTY_IDIOMAI,        
                                                          PTY_NIVEL_IDIOMAI,  
                                                          PTY_COD_CIUDADI,
                                                          PNB_RESULTADOO,
                                                          PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_ESTUDIOS_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         AD_ASPIRANTE_ESTUDIOS_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                        PTY_CODIGOI,
                                                        PRF_REGISTROO,
                                                        PNB_RESULTADOO,
                                                        PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_ESTUDIOS_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         VBO_EXISTE := AD_ASPIRANTE_ESTUDIOS_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_ESTUDIOS_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ASPIRANTE_ESTUDIOS_PKG;
/
CREATE OR REPLACE PACKAGE CA_ASPIRANTE_EXPERIENCIA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                  PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                  PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                  PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                    PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                    PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                    PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                    PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                    PNB_RESULTADOO      OUT NUMBER,
                                    PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                PVH_MENSAJEO        OUT VARCHAR2);
                                
   /*************************************************************/
END CA_ASPIRANTE_EXPERIENCIA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ASPIRANTE_EXPERIENCIA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                  PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                  PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                  PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_EXPERIENCIA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PTY_DOCUMENTOI,     
                                                           PTY_EMPRESAI,   
                                                           PTY_CARGOI,     
                                                           PTY_FECHA_INICIOI,  
                                                           PTY_FECHA_FINI,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_EXPERIENCIA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                    PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                    PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                    PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                    PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                    PNB_RESULTADOO      OUT NUMBER,
                                    PVH_MENSAJEO        OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_EXPERIENCIA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                             PTY_CODIGOI,     
                                                             PTY_DOCUMENTOI,     
                                                             PTY_EMPRESAI,   
                                                             PTY_CARGOI,      
                                                             PTY_FECHA_INICIOI,  
                                                             PTY_FECHA_FINI,
                                                             PNB_RESULTADOO,
                                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_EXPERIENCIA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         AD_ASPIRANTE_EXPERIENCIA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PRF_REGISTROO,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_EXPERIENCIA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                PVH_MENSAJEO        OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         VBO_EXISTE := AD_ASPIRANTE_EXPERIENCIA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_EXPERIENCIA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ASPIRANTE_EXPERIENCIA_PKG;
/
CREATE OR REPLACE PACKAGE CA_ASPIRANTE_PKG
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
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ASPIRANTE_PKG
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
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo de documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NOMBREI IS NULL
      THEN
         PVH_MENSAJEO := 'El nombre del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_APELLIDOI IS NULL
      THEN
         PVH_MENSAJEO := 'El apellido del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_GENEROI IS NULL
      THEN
         PVH_MENSAJEO := 'El genero del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_NACIMIENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha de nacimiento del aspirante no pueden ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DIRECCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La direccion del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TELEFONOI IS NULL
      THEN
         PVH_MENSAJEO := 'El telefono del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CELULARI IS NULL
      THEN
         PVH_MENSAJEO := 'El celular del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESTADO_CIVILI IS NULL
      THEN
         PVH_MENSAJEO := 'El estado civil del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CORREO_ELECTRONICOI IS NULL
      THEN
         PVH_MENSAJEO := 'El correo electronico del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DISCAPACIDADI IS NULL
      THEN
         PVH_MENSAJEO := 'La discapacidad del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_SALARIO_ASPIRAI IS NULL
      THEN
         PVH_MENSAJEO := 'El salario aspirado no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La profesion del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_VIAJAI IS NULL
      THEN
         PVH_MENSAJEO := 'La disponibilidad de viaje del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_INSCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha de inscripcion del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGO_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la de la vacante del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGO_FORMULARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESION_COMPLEMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'La profecion completa del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FORMULARIO_PRUEBA_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario prueba del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CIUD_NACII IS NULL
      THEN
         PVH_MENSAJEO := 'La ciudad de nacimiento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CIUD_ACTUALI IS NULL
      THEN
         PVH_MENSAJEO := 'La ciudad actual del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_DOCUMENTOI,                
                                               PTY_TIPO_DOCUMENTOI,           
                                               PTY_NOMBREI,                   
                                               PTY_APELLIDOI,                 
                                               PTY_GENEROI,                   
                                               PTY_FECHA_NACIMIENTOI,         
                                               PTY_DIRECCIONI,                
                                               PTY_TELEFONOI,                 
                                               PTY_CELULARI,                  
                                               PTY_ESTADO_CIVILI,             
                                               PTY_CORREO_ELECTRONICOI,       
                                               PTY_DISCAPACIDADI,             
                                               PTY_SALARIO_ASPIRAI,           
                                               PTY_PROFESIONI,                
                                               PTY_VIAJAI,                    
                                               PTY_FECHA_INSCRIPCIONI,        
                                               PTY_CODIGO_VACANTEI,           
                                               PTY_CODIGO_FORMULARIOI,        
                                               PTY_PROFESION_COMPLEMENTOI,    
                                               PTY_FORMULARIO_PRUEBA_CODIGOI, 
                                               PTY_CIUD_NACII,                
                                               PTY_CIUD_ACTUALI,              
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
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
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                PTY_DOCUMENTOI,               
                                                PTY_TIPO_DOCUMENTOI,          
                                                PTY_NOMBREI,                  
                                                PTY_APELLIDOI,                
                                                PTY_GENEROI,                  
                                                PTY_FECHA_NACIMIENTOI,        
                                                PTY_DIRECCIONI,               
                                                PTY_TELEFONOI,                
                                                PTY_CELULARI,                 
                                                PTY_ESTADO_CIVILI,            
                                                PTY_CORREO_ELECTRONICOI,      
                                                PTY_DISCAPACIDADI,            
                                                PTY_SALARIO_ASPIRAI,          
                                                PTY_PROFESIONI,               
                                                PTY_VIAJAI,                   
                                                PTY_FECHA_INSCRIPCIONI,       
                                                PTY_CODIGO_VACANTEI,          
                                                PTY_CODIGO_FORMULARIOI,       
                                                PTY_PROFESION_COMPLEMENTOI,   
                                                PTY_FORMULARIO_PRUEBA_CODIGOI,
                                                PTY_CIUD_NACII,               
                                                PTY_CIUD_ACTUALI,             
                                                PNB_RESULTADOO,
                                                PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
      ELSE
         AD_VACANTES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                              PTY_DOCUMENTOI,
                                              PRF_REGISTROO,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
      ELSE
         VBO_EXISTE := AD_ASPIRANTE_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_DOCUMENTOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE CA_CARGOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     CARGOS.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     CARGOS.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_CARGOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_CARGOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     CARGOS.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion del cargo no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CARGOS_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_CARGOS_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     CARGOS.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CARGOS_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_CARGOS_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
      ELSE
         AD_CARGOS_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_CARGOS_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
      ELSE
         VBO_EXISTE := AD_CARGOS_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_CARGOS_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_CARGOS_PKG;
/
CREATE OR REPLACE PACKAGE CA_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante del contacto no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CONTACTO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,      
                                              PTY_CODIGOI,           
                                              PTY_COD_VACANTEI,      
                                              PTY_CONTACTOI,         
                                              PTY_CORREO_CONTACTOI,  
                                              PTY_RECIBE_HV_CORREOI, 
                                              PTY_TELEFONO_CONTACTOI,
                                              PTY_FECHA_ENTREVISTAI, 
                                              PTY_LUGAR_ENTREVISTAI,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_CONTACTO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CONTACTO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,      
                                                PTY_CODIGOI,           
                                                PTY_COD_VACANTEI,      
                                                PTY_CONTACTOI,         
                                                PTY_CORREO_CONTACTOI,  
                                                PTY_RECIBE_HV_CORREOI, 
                                                PTY_TELEFONO_CONTACTOI,
                                                PTY_FECHA_ENTREVISTAI, 
                                                PTY_LUGAR_ENTREVISTAI, 
                                                PNB_RESULTADOO,
                                                PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_CONTACTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
      ELSE
         AD_VACANTES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                              PTY_CODIGOI,
                                              PRF_REGISTROO,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_CONTACTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
      ELSE
         VBO_EXISTE := AD_CONTACTO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_CONTACTO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE CA_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2);

  /*************************************************************/
  PROCEDURE EXISTE_REGISTRO_P(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                              PVH_MENSAJEO OUT VARCHAR2);
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2);
  /*************************************************************/

END CA_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2)
  
   IS
  
  BEGIN
  
    AD_DEPARTAMENTOS_PKG.CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO,
                                                  PNB_RESULTADOO,
                                                  PVH_MENSAJEO);
  
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se present? un error en CA_DEPARTAMENTOS_PKG.CONSULTAR_DEPARTAMENTO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_DEPARTAMENTO_P;
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2) IS
  
  BEGIN
  
    IF PTY_COD_PADREI IS NULL THEN
      PVH_MENSAJEO := 'El codigo del departamento no puede ser null';
    ELSE
      AD_DEPARTAMENTOS_PKG.CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI,
                                                 PRF_REGISTROO,
                                                 PNB_RESULTADOO,
                                                 PVH_MENSAJEO);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se present? un error en CA_DEPARTAMENTOS_PKG.CONSULTAR_MUNICIPIO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_MUNICIPIO_P;
  /*************************************************************/
  PROCEDURE EXISTE_REGISTRO_P(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                              PVH_MENSAJEO OUT VARCHAR2) IS
    VBO_EXISTE BOOLEAN := FALSE;
  BEGIN
    IF PTY_CODIGOI IS NULL THEN
      PVH_MENSAJEO := 'El codigo del departamento no puede ser null';
    ELSE
      VBO_EXISTE := AD_DEPARTAMENTOS_PKG.EXISTE_REGISTRO_F(PTY_CODIGOI,
                                                           PVH_MENSAJEO);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      PVH_MENSAJEO := 'Se present? un error en CA_DEPARTAMENTOS_PKG.EXISTE_REGISTRO_P ' ||
                      SQLCODE || ' - ' || SQLERRM;
  END EXISTE_REGISTRO_P;
  /*************************************************************/
END CA_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE CA_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_EMPRESA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NIT_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El nit de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NOM_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El nombre de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESTADOI IS NULL
      THEN
         PVH_MENSAJEO := 'El estado de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_EMPRESA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                             PTY_NIT_EMPRESAI,
                                             PTY_NOM_EMPRESAI,
                                             PTY_ESTADOI,
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_EMPRESA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_NIT_EMPRESAI,
                                               PTY_NOM_EMPRESAI,
                                               PTY_ESTADOI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
      ELSE
         AD_EMPRESA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                             PRF_REGISTROO,
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
      ELSE
         VBO_EXISTE := AD_EMPRESA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
/*************************************************************/
END CA_EMPRESA_PKG;
/
CREATE OR REPLACE PACKAGE CA_ESCALA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     ESCALA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     ESCALA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_ESCALA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ESCALA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     ESCALA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la escala no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la escala no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ESCALA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_ESCALA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     ESCALA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la escala no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ESCALA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_ESCALA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del estado no puede ser null';
      ELSE
         AD_ESCALA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_ESCALA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del estado no puede ser null';
      ELSE
         VBO_EXISTE := AD_ESCALA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_ESCALA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ESCALA_PKG;
/
CREATE OR REPLACE PACKAGE CA_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_FORMULARIO_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESCALAI IS NULL
      THEN
         PVH_MENSAJEO := 'La escala del formulario de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo de la prueba del formulario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_FORMULARIO_PRUEBA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                       PTY_CODIGOI,
                                                       PTY_ESCALAI,      
                                                       PTY_TIPO_PRUEBAI, 
                                                       PTY_CALIFICACIONI,
                                                       PNB_RESULTADOO,
                                                       PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_FORMULARIO_PRUEBA_ASPIRANTE_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_FORMULARIO_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                         PTY_CODIGOI,
                                                         PTY_ESCALAI,      
                                                         PTY_TIPO_PRUEBAI, 
                                                         PTY_CALIFICACIONI,
                                                         PNB_RESULTADOO,
                                                         PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_FORMULARIO_PRUEBA_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
      ELSE
         AD_FORMULARIO_PRUEBA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                       PTY_CODIGOI,
                                                       PRF_REGISTROO,
                                                       PNB_RESULTADOO,
                                                       PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_FORMULARIO_PRUEBA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
      ELSE
         VBO_EXISTE := AD_FORMULARIO_PRUEBA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_FORMULARIO_PRUEBA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_FORMULARIO_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE CA_GENERO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     GENERO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     GENERO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_GENERO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_GENERO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     GENERO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del genero no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion del genero no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_GENERO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_GENERO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     GENERO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del genero no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_GENERO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_GENERO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del genero no puede ser null';
      ELSE
         AD_GENERO_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_GENERO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del genero no puede ser null';
      ELSE
         VBO_EXISTE := AD_GENERO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_GENERO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_GENERO_PKG;
/
CREATE OR REPLACE PACKAGE CA_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN  HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_HABILIDADES_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento de las habilidades del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_HABILIDADI IS NULL
      THEN
         PVH_MENSAJEO := 'La habilidad del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_ASPIRANTE_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PTY_DOCUMENTOI,
                                                           PTY_HABILIDADI,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_HABILIDADES_ASPIRANTE_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                             PTY_CODIGOI,
                                                             PTY_DOCUMENTOI,
                                                             PTY_HABILIDADI,
                                                             PNB_RESULTADOO,
                                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_HABILIDADES_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         AD_HABILIDADES_ASPIRANTE_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PRF_REGISTROO,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_HABILIDADES_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN  HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         VBO_EXISTE := AD_HABILIDADES_ASPIRANTE_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_HABILIDADES_ASPIRANTE_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_HABILIDADES_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE CA_HABILIDADES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     HABILIDADES.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     HABILIDADES.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_HABILIDADES_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_HABILIDADES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     HABILIDADES.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_HABILIDADES_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     HABILIDADES.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_HABILIDADES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         AD_HABILIDADES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_HABILIDADES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         VBO_EXISTE := AD_HABILIDADES_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_HABILIDADES_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_HABILIDADES_PKG;
/
CREATE OR REPLACE PACKAGE CA_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_PERFIL_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI     IN     PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo del perfil no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la escala no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_PERFIL_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PERFILI,
                                            PTY_TIPO_PERFILI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PERFIL_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_PERFIL_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_COD_PERFILI,
                                               PTY_TIPO_PERFILI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_PERFIL_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
      ELSE
         AD_PERFIL_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PERFILI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PERFIL_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                PTY_COD_PERFILI     IN     PERFIL.COD_PERFIL%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
      ELSE
         VBO_EXISTE := AD_PERFIL_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PERFILI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_PERFIL_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_PERFIL_PKG;
/
CREATE OR REPLACE PACKAGE CA_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_PROFESIONES_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_PROFESIONI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la profesion no puede ser null';
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                    PTY_COD_PROFESIONI,
                                                    PRF_REGISTROO,
                                                    PNB_RESULTADOO,
                                                    PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESIONES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_COD_PROFESIONI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la profesion no puede ser null';
      ELSE
         VBO_EXISTE := AD_PROFESIONES_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PROFESIONI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESIONES_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_PROFESIONES_PKG;
/
CREATE OR REPLACE PACKAGE CA_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI   IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                PTY_COD_PRODETAI IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_PROFESION_DETALLE_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI   IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_PRODETAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del detalle de la profesion no puede ser null';
      ELSE
         AD_PROFESION_DETALLE_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                    PTY_COD_PRODETAI,
                                                    PRF_REGISTROO,
                                                    PNB_RESULTADOO,
                                                    PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESION_DETALLE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                PTY_COD_PRODETAI IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_PRODETAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del detalle de la profesion no puede ser null';
      ELSE
         VBO_EXISTE := AD_PROFESION_DETALLE_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PRODETAI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESION_DETALLE_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_PROFESION_DETALLE_PKG;
/
CREATE OR REPLACE PACKAGE CA_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_TIPO_DE_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion del tipo de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PRUEBAI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DE_PRUEBA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_COD_PRUEBAI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DE_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PRUEBAI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
      ELSE
         VBO_EXISTE := AD_TIPO_DE_PRUEBA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PRUEBAI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DE_PRUEBA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_TIPO_DE_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE CA_TIPO_DOCUMENTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/
END CA_TIPO_DOCUMENTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_TIPO_DOCUMENTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de documento no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion del tipo de documento no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DOCUMENTO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DOCUMENTO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de documento no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DOCUMENTO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DOCUMENTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de documento no puede ser null';
      ELSE
         AD_TIPO_DOCUMENTO_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DOCUMENTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de documento no puede ser null';
      ELSE
         VBO_EXISTE := AD_TIPO_DOCUMENTO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DOCUMENTO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_TIPO_DOCUMENTO_PKG;
/
CREATE OR REPLACE PACKAGE CA_USUARIO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                  PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                  PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                  PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                  PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                    PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                    PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                    PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                    PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                    PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                    PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                    PNB_RESULTADOO         OUT NUMBER,
                                    PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PRF_REGISTROO          OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                PVH_MENSAJEO           OUT VARCHAR2);
                                
   /*************************************************************/
END CA_USUARIO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_USUARIO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                  PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                  PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                  PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                  PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_USUARIO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                             PTY_COD_USUARIOI,   
                                             PTY_DOCUMENTOI,     
                                             PTY_NOMBRE_USUARIOI,
                                             PTY_CONTRASENAI,    
                                             PTY_COD_PERFILI,    
                                             PTY_ESTADOI, 
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                    PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                    PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                    PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                    PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                    PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                    PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                    PNB_RESULTADOO         OUT NUMBER,
                                    PVH_MENSAJEO           OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_USUARIO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_COD_USUARIOI,   
                                               PTY_DOCUMENTOI,     
                                               PTY_NOMBRE_USUARIOI,
                                               PTY_CONTRASENAI,    
                                               PTY_COD_PERFILI,    
                                               PTY_ESTADOI, 
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PRF_REGISTROO          OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
      ELSE
         AD_USUARIO_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                             PTY_COD_USUARIOI,
                                             PRF_REGISTROO,
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                PVH_MENSAJEO           OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
      ELSE
         VBO_EXISTE := AD_USUARIO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_USUARIOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_USUARIO_PKG;
/
CREATE OR REPLACE PACKAGE CA_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_VACANTES_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGO_CARGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_INICIALI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha inicial no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_FINALI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha final no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRI_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_HABILIDADES_REQI IS NULL
      THEN
         PVH_MENSAJEO := 'Las habilidades requeridas en la vacante no pueden ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ACTI_REALIZAI IS NULL
      THEN
         PVH_MENSAJEO := 'La actividad realizada en la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_JORNADA_LABORALI IS NULL
      THEN
         PVH_MENSAJEO := 'La jornada laboral en la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_EMPLEOI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo de empleo en la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_RANGO_SALARIALI IS NULL
      THEN
         PVH_MENSAJEO := 'El rango salarial de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CANTIDAD_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'La cantidad de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_EXPERIENCIA_MINIMAI IS NULL
      THEN
         PVH_MENSAJEO := 'La experiencia minima de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_IDIOMA_REQUERIDOI IS NULL
      THEN
         PVH_MENSAJEO := 'El idioma requerido de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NIVEL_ESTUDIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El nivel de estudio de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DISPONIBLE_VIAJEI IS NULL
      THEN
         PVH_MENSAJEO := 'La disponibilidad de viaje de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ACEPTA_DISCAPACIDADI IS NULL
      THEN
         PVH_MENSAJEO := 'La aceptacion de discapacidad de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_CIUDADI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la ciudad de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESTADOI IS NULL
      THEN
         PVH_MENSAJEO := 'El estado de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESIONI IS NULL
      THEN  
         PVH_MENSAJEO := 'La profecion de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESION_COMPLEMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'la profecion completa de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_VACANTES_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                              PTY_CODIGOI,     
                                              PTY_CODIGO_CARGOI         ,
                                              PTY_FECHA_INICIALI        ,
                                              PTY_FECHA_FINALI          ,
                                              PTY_DESCRI_VACANTEI       ,
                                              PTY_HABILIDADES_REQI      ,
                                              PTY_ACTI_REALIZAI         ,
                                              PTY_JORNADA_LABORALI      ,
                                              PTY_TIPO_EMPLEOI          ,
                                              PTY_RANGO_SALARIALI       ,
                                              PTY_CANTIDAD_VACANTEI     ,
                                              PTY_EXPERIENCIA_MINIMAI   ,
                                              PTY_IDIOMA_REQUERIDOI     ,
                                              PTY_NIVEL_ESTUDIOI        ,
                                              PTY_DISPONIBLE_VIAJEI     ,
                                              PTY_ACEPTA_DISCAPACIDADI  ,
                                              PTY_COD_CIUDADI           ,
                                              PTY_ESTADOI               ,
                                              PTY_PROFESIONI            ,
                                              PTY_PROFESION_COMPLEMENTOI,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_VACANTES_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_VACANTES_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                PTY_CODIGOI,     
                                                PTY_CODIGO_CARGOI         ,
                                                PTY_FECHA_INICIALI        ,
                                                PTY_FECHA_FINALI          ,
                                                PTY_DESCRI_VACANTEI       ,
                                                PTY_HABILIDADES_REQI      ,
                                                PTY_ACTI_REALIZAI         ,
                                                PTY_JORNADA_LABORALI      ,
                                                PTY_TIPO_EMPLEOI          ,
                                                PTY_RANGO_SALARIALI       ,
                                                PTY_CANTIDAD_VACANTEI     ,
                                                PTY_EXPERIENCIA_MINIMAI   ,
                                                PTY_IDIOMA_REQUERIDOI     ,
                                                PTY_NIVEL_ESTUDIOI        ,
                                                PTY_DISPONIBLE_VIAJEI     ,
                                                PTY_ACEPTA_DISCAPACIDADI  ,
                                                PTY_COD_CIUDADI           ,
                                                PTY_ESTADOI               ,
                                                PTY_PROFESIONI            ,
                                                PTY_PROFESION_COMPLEMENTOI,
                                                PNB_RESULTADOO,
                                                PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_VACANTES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante no puede ser null';
      ELSE
         AD_VACANTES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                              PTY_CODIGOI,
                                              PRF_REGISTROO,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_VACANTES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo dela vacante no puede ser null';
      ELSE
         VBO_EXISTE := AD_VACANTES_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_VACANTES_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_VACANTES_PKG;
/
CREATE OR REPLACE PACKAGE AD_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                               PTY_CODIGOI        IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_ASPIRANTE_ESTUDIOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO ASPIRANTE_ESTUDIOS VALUES (PTY_CODIGOI,PTY_DOCUMENTOI,PTY_UNIVERSIDADI,PTY_PROFESIONI,
                                             PTY_FECHA_INICIOI,PTY_FECHA_FINI,PTY_ESTADO_ESTUDIOI,PTY_IDIOMAI,
                                             PTY_NIVEL_IDIOMAI,PTY_COD_CIUDADI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_ASPIRANTE_ESTUDIOS_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
   IS

   BEGIN
      UPDATE ASPIRANTE_ESTUDIOS
         SET DOCUMENTO            = NVL (PTY_DOCUMENTOI          , DOCUMENTO         ),
             UNIVERSIDAD          = NVL (PTY_UNIVERSIDADI        , UNIVERSIDAD       ),
             PROFESION            = NVL (PTY_PROFESIONI          , PROFESION         ),
             FECHA_INICIO         = NVL (PTY_FECHA_INICIOI       , FECHA_INICIO      ),
             FECHA_FIN            = NVL (PTY_FECHA_FINI          , FECHA_FIN         ),
             ESTADO_ESTUDIO       = NVL (PTY_ESTADO_ESTUDIOI     , ESTADO_ESTUDIO    ),
             IDIOMA               = NVL (PTY_IDIOMAI             , IDIOMA            ),
             NIVEL_IDIOMA         = NVL (PTY_NIVEL_IDIOMAI       , NIVEL_IDIOMA      ),
             COD_CIUDAD           = NVL (PTY_COD_CIUDADI         , COD_CIUDAD        )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_ASPIRANTE_ESTUDIOS_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DOCUMENTO,      
           UNIVERSIDAD,    
           PROFESION,      
           FECHA_INICIO,   
           FECHA_FIN,      
           ESTADO_ESTUDIO, 
           IDIOMA,         
           NIVEL_IDIOMA,   
           COD_CIUDAD 
     FROM ASPIRANTE_ESTUDIOS
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_ASPIRANTE_ESTUDIOS_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                               PTY_CODIGOI        IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM ASPIRANTE_ESTUDIOS
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_ASPIRANTE_ESTUDIOS_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_ASPIRANTE_ESTUDIOS_PKG;
/
CREATE OR REPLACE PACKAGE AD_ASPIRANTE_EXPERIENCIA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                  PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                  PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                  PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                    PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                    PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                    PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                    PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                    PNB_RESULTADOO      OUT NUMBER,
                                    PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_ASPIRANTE_EXPERIENCIA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_ASPIRANTE_EXPERIENCIA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                  PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                  PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                  PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO ASPIRANTE_EXPERIENCIA VALUES (PTY_CODIGOI,PTY_DOCUMENTOI,PTY_EMPRESAI,PTY_CARGOI,
                                                PTY_FECHA_INICIOI,PTY_FECHA_FINI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_ASPIRANTE_EXPERIENCIA_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                    PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                    PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                    PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                    PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                    PNB_RESULTADOO      OUT NUMBER,
                                    PVH_MENSAJEO        OUT VARCHAR2)
   IS

   BEGIN
      UPDATE ASPIRANTE_EXPERIENCIA
         SET DOCUMENTO            = NVL (PTY_DOCUMENTOI        , DOCUMENTO         ),
             EMPRESA              = NVL (PTY_EMPRESAI          , EMPRESA           ),
             CARGO                = NVL (PTY_CARGOI            , CARGO             ),
             FECHA_INICIO         = NVL (PTY_FECHA_INICIOI     , FECHA_INICIO      ),
             FECHA_FIN            = NVL (PTY_FECHA_FINI        , FECHA_FIN         )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_ASPIRANTE_EXPERIENCIA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DOCUMENTO,      
           EMPRESA,    
           CARGO,      
           FECHA_INICIO,   
           FECHA_FIN 
     FROM ASPIRANTE_EXPERIENCIA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_ASPIRANTE_EXPERIENCIA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM ASPIRANTE_EXPERIENCIA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se presento un error en AD_ASPIRANTE_EXPERIENCIA_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_ASPIRANTE_EXPERIENCIA_PKG;
/
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
CREATE OR REPLACE PACKAGE AD_CARGOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN CARGOS.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN CARGOS.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_CARGOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_CARGOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN CARGOS.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO CARGOS VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_CARGOS_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN CARGOS.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE CARGOS
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_CARGOS_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM CARGOS
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_CARGOS_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CARGOS.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CARGOS.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM CARGOS
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_CARGOS_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_CARGOS_PKG;
/
CREATE OR REPLACE PACKAGE AD_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO CONTACTO VALUES (PTY_CODIGOI,PTY_COD_VACANTEI,PTY_CONTACTOI,PTY_CORREO_CONTACTOI,
                                   PTY_RECIBE_HV_CORREOI,PTY_TELEFONO_CONTACTOI,PTY_FECHA_ENTREVISTAI,
                                   PTY_LUGAR_ENTREVISTAI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_CONTACTO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
   IS

   BEGIN
      UPDATE CONTACTO
         SET COD_VACANTE            = NVL (PTY_COD_VACANTEI           , COD_VACANTE            ),
             CONTACTO               = NVL (PTY_CONTACTOI              , CONTACTO               ),
             CORREO_CONTACTO        = NVL (PTY_CORREO_CONTACTOI       , CORREO_CONTACTO        ),
             RECIBE_HV_CORREO       = NVL (PTY_RECIBE_HV_CORREOI      , RECIBE_HV_CORREO       ),
             TELEFONO_CONTACTO      = NVL (PTY_TELEFONO_CONTACTOI     , TELEFONO_CONTACTO      ),
             FECHA_ENTREVISTA       = NVL (PTY_FECHA_ENTREVISTAI      , FECHA_ENTREVISTA       ),
             LUGAR_ENTREVISTA       = NVL (PTY_LUGAR_ENTREVISTAI      , LUGAR_ENTREVISTA       )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_CONTACTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           COD_VACANTE,   
           CONTACTO,         
           CORREO_CONTACTO,  
           RECIBE_HV_CORREO, 
           TELEFONO_CONTACTO,
           FECHA_ENTREVISTA, 
           LUGAR_ENTREVISTA
     FROM CONTACTO
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_CONTACTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM CONTACTO
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_CONTACTO_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE AD_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2);
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2);
  /*************************************************************/
  FUNCTION EXISTE_REGISTRO_F(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                             PVH_MENSAJEO OUT VARCHAR2) RETURN BOOLEAN;
  /*************************************************************/
END AD_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2) IS
  BEGIN
  
    OPEN PRF_REGISTROO FOR
      SELECT CODIGO, DESCRIPCION, TIPO, COD_PADRE FROM DEPARTAMENTOS; /* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
    PNB_RESULTADOO := 1;
  
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se presento un error en AD_DEPARTAMENTOS_PKG.CONSULTAR_DEPARTAMENTO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_DEPARTAMENTO_P;
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2) IS
  BEGIN
  
    OPEN PRF_REGISTROO FOR
      SELECT CODIGO, DESCRIPCION, TIPO, COD_PADRE
        FROM DEPARTAMENTOS
       WHERE COD_PADRE = PTY_COD_PADREI;
    PNB_RESULTADOO := 1;
  
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se presento un error en AD_DEPARTAMENTOS_PKG.CONSULTAR_MUNICIPIO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_MUNICIPIO_P;
  /*************************************************************/
  FUNCTION EXISTE_REGISTRO_F(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                             PVH_MENSAJEO OUT VARCHAR2) RETURN BOOLEAN IS
  
    CURSOR CUR_EXISTE_REGISTRO IS
      SELECT COUNT(1) FROM DEPARTAMENTOS WHERE CODIGO = PTY_CODIGOI;
  
    VBO_EXISTE_REGISTRO BOOLEAN := TRUE;
    VNB_CONTEO          NUMBER;
  
  BEGIN
  
    OPEN CUR_EXISTE_REGISTRO;
    FETCH CUR_EXISTE_REGISTRO
      INTO VNB_CONTEO;
    IF VNB_CONTEO < 1 THEN
      VBO_EXISTE_REGISTRO := FALSE;
    END IF;
    CLOSE CUR_EXISTE_REGISTRO;
  
    RETURN VBO_EXISTE_REGISTRO;
  EXCEPTION
    WHEN OTHERS THEN
      PVH_MENSAJEO := 'Se present? un error en AD_DEPARTAMENTOS_PKG.EXISTE_REGISTRO_F ' ||
                      SQLCODE || ' - ' || SQLERRM;
  END EXISTE_REGISTRO_F;
  /*************************************************************/
END AD_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE AD_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2)RETURN BOOLEAN;
                               
   /*************************************************************/
END AD_EMPRESA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI IN EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI IN EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI      IN EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO EMPRESA VALUES (PTY_COD_EMPRESAI,PTY_NIT_EMPRESAI,PTY_NOM_EMPRESAI,PTY_ESTADOI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en AD_EMPRESA_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
/*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI IN EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI IN EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI      IN EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE EMPRESA
         SET NIT_EMPRESA = NVL (PTY_NIT_EMPRESAI, NIT_EMPRESA),
             NOMBRE_EMPRESA = NVL (PTY_NOM_EMPRESAI, NOMBRE_EMPRESA),
             ESTADO = NVL (PTY_ESTADOI, ESTADO)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en AD_EMPRESA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           NIT_EMPRESA, 
           NOMBRE_EMPRESA,
           ESTADO
     FROM EMPRESA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en AD_EMPRESA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN EMPRESA.COD_EMPRESA%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM EMPRESA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI;
   
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
               'Se presentó un error en AD_EMPRESA_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_EMPRESA_PKG;
/
CREATE OR REPLACE PACKAGE AD_ESCALA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN ESCALA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN ESCALA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_ESCALA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_ESCALA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN ESCALA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO ESCALA VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en AD_ESTADO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN ESCALA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE ESCALA
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en AD_ESTADO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM ESCALA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en AD_ESCALA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN ESCALA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN ESCALA.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM ESCALA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se presentï¿½ un error en AD_ESCALA_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_ESCALA_PKG;
/
CREATE OR REPLACE PACKAGE AD_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI       IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI  IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO    OUT NUMBER,
                                  PVH_MENSAJEO      OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI       IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI  IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO    OUT NUMBER,
                                    PVH_MENSAJEO      OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_FORMULARIO_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI       IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI  IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO    OUT NUMBER,
                                  PVH_MENSAJEO      OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO FORMULARIO_PRUEBA VALUES (PTY_CODIGOI,PTY_ESCALAI,PTY_TIPO_PRUEBAI,PTY_CALIFICACIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_FORMULARIO_PRUEBA_ASPIRANTE_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI       IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI  IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO    OUT NUMBER,
                                    PVH_MENSAJEO      OUT VARCHAR2)
   IS

   BEGIN
      UPDATE FORMULARIO_PRUEBA
         SET ESCALA         = NVL (PTY_ESCALAI      ,   ESCALA        ),
             TIPO_PRUEBA    = NVL (PTY_TIPO_PRUEBAI ,   TIPO_PRUEBA   ),
             CALIFICACION   = NVL (PTY_CALIFICACIONI,   CALIFICACION  )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_FORMULARIO_PRUEBA_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           ESCALA,      
           TIPO_PRUEBA, 
           CALIFICACION
     FROM FORMULARIO_PRUEBA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_FORMULARIO_PRUEBA_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI  IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                               PTY_CODIGOI       IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM FORMULARIO_PRUEBA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_FORMULARIO_PRUEBA_ASPIRANTE_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_FORMULARIO_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE AD_GENERO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN GENERO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN GENERO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_GENERO_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_GENERO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN GENERO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO GENERO VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_GENERO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN GENERO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE GENERO
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_GENERO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM GENERO
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_GENERO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN GENERO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN GENERO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM GENERO
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_GENERO_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_GENERO_PKG;
/
CREATE OR REPLACE PACKAGE AD_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI   IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI   IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI   IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI   IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_HABILIDADES_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI   IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI   IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO HABILIDADES_ASPIRANTE VALUES (PTY_CODIGOI,PTY_DOCUMENTOI,PTY_HABILIDADI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_HABILIDADES_ASPIRANTE_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI   IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI   IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE HABILIDADES_ASPIRANTE
         SET DOCUMENTO   = NVL (PTY_DOCUMENTOI,   DOCUMENTO  ),
             HABILIDAD   = NVL (PTY_HABILIDADI,   HABILIDAD  )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_HABILIDADES_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DOCUMENTO,
           HABILIDAD
     FROM HABILIDADES_ASPIRANTE
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_HABILIDADES_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM HABILIDADES_ASPIRANTE
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_HABILIDADES_ASPIRANTE_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_HABILIDADES_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE AD_HABILIDADES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN HABILIDADES.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN HABILIDADES.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_HABILIDADES_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_HABILIDADES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN HABILIDADES.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO HABILIDADES VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_HABILIDADES_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN HABILIDADES.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE HABILIDADES
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_HABILIDADES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM HABILIDADES
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_HABILIDADES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN HABILIDADES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN HABILIDADES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM HABILIDADES
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_HABILIDADES_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_HABILIDADES_PKG;
/
CREATE OR REPLACE PACKAGE AD_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI IN PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI IN PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI IN PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI IN PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                               PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_PERFIL_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI IN PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI IN PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO PERFIL VALUES (PTY_COD_PERFILI,PTY_TIPO_PERFILI, PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PERFIL_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI  IN PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI IN PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI IN PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE PERFIL
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION),
             TIPO_PERFIL = NVL (PTY_TIPO_PERFILI, TIPO_PERFIL)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   COD_PERFIL = PTY_COD_PERFILI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PERFIL_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI   IN PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_PERFIL,
           TIPO_PERFIL,
           DESCRIPCION
     FROM PERFIL
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_PERFIL = PTY_COD_PERFILI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PERFIL_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN PERFIL.COD_EMPRESA%TYPE,
                               PTY_COD_PERFILI   IN PERFIL.COD_PERFIL%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM PERFIL
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_PERFIL = PTY_COD_PERFILI;
   
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
               'Se present? un error en AD_PERFIL_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_PERFIL_PKG;
/
CREATE OR REPLACE PACKAGE AD_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI  IN PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN PROFESIONES.COD_EMPRESA%TYPE,
                               PTY_COD_PROFESIONI  IN PROFESIONES.COD_PROFESION%TYPE,
                               PVH_MENSAJEO        OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_PROFESIONES_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI  IN PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_PROFESION,
           DESCRIPCION
     FROM PROFESIONES
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_PROFESION = PTY_COD_PROFESIONI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PROFESIONES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN PROFESIONES.COD_EMPRESA%TYPE,
                               PTY_COD_PROFESIONI  IN PROFESIONES.COD_PROFESION%TYPE,
                               PVH_MENSAJEO        OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM PROFESIONES
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_PROFESION = PTY_COD_PROFESIONI;
   
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
               'Se present? un error en AD_PROFESIONES_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_PROFESIONES_PKG;
/
CREATE OR REPLACE PACKAGE AD_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI    IN PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN PROFESION_DETALLE.COD_EMPRESA%TYPE,
                               PTY_COD_PRODETAI  IN PROFESION_DETALLE.COD_PRODETA%TYPE,
                               PVH_MENSAJEO        OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_PROFESION_DETALLE_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI    IN PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_PRODETA,
           COD_PROFESION,
           DESCRIPCION
     FROM PROFESION_DETALLE
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_PRODETA = PTY_COD_PRODETAI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_PROFESION_DETALLE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI    IN PROFESION_DETALLE.COD_EMPRESA%TYPE,
                               PTY_COD_PRODETAI  IN PROFESION_DETALLE.COD_PRODETA%TYPE,
                               PVH_MENSAJEO        OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM PROFESION_DETALLE
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_PRODETA = PTY_COD_PRODETAI;
   
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
               'Se present? un error en AD_PROFESION_DETALLE_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_PROFESION_DETALLE_PKG;
/
CREATE OR REPLACE PACKAGE AD_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI IN TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI IN TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                               PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_TIPO_DE_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI IN TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO TIPO_DE_PRUEBA VALUES (PTY_COD_PRUEBAI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DE_PRUEBA_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI IN TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE TIPO_DE_PRUEBA
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   COD_PRUEBA = PTY_COD_PRUEBAI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DE_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_PRUEBA,
           DESCRIPCION
     FROM TIPO_DE_PRUEBA
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_PRUEBA = PTY_COD_PRUEBAI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                               PTY_COD_PRUEBAI  IN TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM TIPO_DE_PRUEBA
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_PRUEBA = PTY_COD_PRUEBAI;
   
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
               'Se present? un error en AD_TIPO_DE_PRUEBA_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_TIPO_DE_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE AD_TIPO_DOCUMENTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_TIPO_DOCUMENTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_TIPO_DOCUMENTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI IN TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO TIPO_DOCUMENTO VALUES (PTY_CODIGOI,PTY_DESCRIPCIONI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DOCUMENTO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI IN TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE TIPO_DOCUMENTO
         SET DESCRIPCION = NVL (PTY_DESCRIPCIONI, DESCRIPCION)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DOCUMENTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           DESCRIPCION
     FROM TIPO_DOCUMENTO
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_TIPO_DOCUMENTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN TIPO_DOCUMENTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM TIPO_DOCUMENTO
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_TIPO_DOCUMENTO_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_TIPO_DOCUMENTO_PKG;
/
CREATE OR REPLACE PACKAGE AD_USUARIO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                  PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                  PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                  PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                  PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                    PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                    PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                    PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                    PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                    PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                    PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                    PNB_RESULTADOO         OUT NUMBER,
                                    PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PRF_REGISTROO          OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN USUARIO.COD_EMPRESA%TYPE,
                               PTY_COD_USUARIOI   IN USUARIO.COD_USUARIO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_USUARIO_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_USUARIO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                  PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                  PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                  PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                  PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO USUARIO VALUES (PTY_COD_USUARIOI,PTY_DOCUMENTOI,PTY_NOMBRE_USUARIOI,
                                  PTY_CONTRASENAI,PTY_COD_PERFILI,PTY_ESTADOI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_USUARIO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                    PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                    PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                    PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                    PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                    PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                    PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                    PNB_RESULTADOO         OUT NUMBER,
                                    PVH_MENSAJEO           OUT VARCHAR2)
   IS

   BEGIN
      UPDATE USUARIO
         SET DOCUMENTO              = NVL (PTY_DOCUMENTOI            , DOCUMENTO           ),
             NOMBRE_USUARIO         = NVL (PTY_NOMBRE_USUARIOI       , NOMBRE_USUARIO      ),
             CONTRASENA             = NVL (PTY_CONTRASENAI           , CONTRASENA          ),
             COD_PERFIL             = NVL (PTY_COD_PERFILI           , COD_PERFIL          ),
             ESTADO                 = NVL (PTY_ESTADOI               , ESTADO              )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   COD_USUARIO = PTY_COD_USUARIOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_USUARIO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PRF_REGISTROO          OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           COD_USUARIO,
           DOCUMENTO,      
           NOMBRE_USUARIO, 
           CONTRASENA,     
           COD_PERFIL,     
           ESTADO
     FROM USUARIO
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   COD_USUARIO = PTY_COD_USUARIOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_USUARIO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI   IN USUARIO.COD_EMPRESA%TYPE,
                               PTY_COD_USUARIOI   IN USUARIO.COD_USUARIO%TYPE,
                               PVH_MENSAJEO       OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM USUARIO
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   COD_USUARIO = PTY_COD_USUARIOI;
   
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
               'Se present? un error en AD_USUARIO_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_USUARIO_PKG;
/
CREATE OR REPLACE PACKAGE AD_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_VACANTES_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO VACANTES VALUES (PTY_CODIGOI,PTY_CODIGO_CARGOI,PTY_FECHA_INICIALI,
                                   PTY_FECHA_FINALI,PTY_DESCRI_VACANTEI,PTY_HABILIDADES_REQI,PTY_ACTI_REALIZAI,
                                   PTY_JORNADA_LABORALI,PTY_TIPO_EMPLEOI,PTY_RANGO_SALARIALI,PTY_CANTIDAD_VACANTEI,
                                   PTY_EXPERIENCIA_MINIMAI,PTY_IDIOMA_REQUERIDOI,PTY_NIVEL_ESTUDIOI,PTY_DISPONIBLE_VIAJEI,
                                   PTY_ACEPTA_DISCAPACIDADI,PTY_COD_CIUDADI,PTY_ESTADOI,PTY_PROFESIONI,
                                   PTY_PROFESION_COMPLEMENTOI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
   END INSERTAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE VACANTES
         SET CODIGO_CARGO          = NVL (PTY_CODIGO_CARGOI         , CODIGO_CARGO         ),
             FECHA_INICIAL         = NVL (PTY_FECHA_INICIALI        , FECHA_INICIAL        ),
             FECHA_FINAL           = NVL (PTY_FECHA_FINALI          , FECHA_FINAL          ),
             DESCRI_VACANTE        = PTY_DESCRI_VACANTEI       ,
             HABILIDADES_REQ       = NVL (PTY_HABILIDADES_REQI      , HABILIDADES_REQ      ),
             ACTI_REALIZA          = NVL (PTY_ACTI_REALIZAI         , ACTI_REALIZA         ),
             JORNADA_LABORAL       = NVL (PTY_JORNADA_LABORALI      , JORNADA_LABORAL      ),
             TIPO_EMPLEO           = NVL (PTY_TIPO_EMPLEOI          , TIPO_EMPLEO          ),
             RANGO_SALARIAL        = NVL (PTY_RANGO_SALARIALI       , RANGO_SALARIAL       ),
             CANTIDAD_VACANTE      = NVL (PTY_CANTIDAD_VACANTEI     , CANTIDAD_VACANTE     ),
             EXPERIENCIA_MINIMA    = NVL (PTY_EXPERIENCIA_MINIMAI   , EXPERIENCIA_MINIMA   ),
             IDIOMA_REQUERIDO      = NVL (PTY_IDIOMA_REQUERIDOI     , IDIOMA_REQUERIDO     ),
             NIVEL_ESTUDIO         = NVL (PTY_NIVEL_ESTUDIOI        , NIVEL_ESTUDIO        ),
             DISPONIBLE_VIAJE      = NVL (PTY_DISPONIBLE_VIAJEI     , DISPONIBLE_VIAJE     ),
             ACEPTA_DISCAPACIDAD   = NVL (PTY_ACEPTA_DISCAPACIDADI  , ACEPTA_DISCAPACIDAD  ),
             COD_CIUDAD            = NVL (PTY_COD_CIUDADI           , COD_CIUDAD           ),
             ESTADO                = NVL (PTY_ESTADOI               , ESTADO               ),
             PROFESION             = NVL (PTY_PROFESIONI            , PROFESION            ),
             PROFESION_COMPLEMENTO = NVL (PTY_PROFESION_COMPLEMENTOI, PROFESION_COMPLEMENTO)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           CODIGO_CARGO,         
           FECHA_INICIAL,        
           FECHA_FINAL,          
           DESCRI_VACANTE,       
           HABILIDADES_REQ,      
           ACTI_REALIZA,         
           JORNADA_LABORAL,      
           TIPO_EMPLEO,          
           RANGO_SALARIAL,       
           CANTIDAD_VACANTE,     
           EXPERIENCIA_MINIMA,   
           IDIOMA_REQUERIDO,     
           NIVEL_ESTUDIO,        
           DISPONIBLE_VIAJE,     
           ACEPTA_DISCAPACIDAD,  
           COD_CIUDAD,          
           ESTADO,               
           PROFESION,            
           PROFESION_COMPLEMENTO
     FROM VACANTES
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM VACANTES
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
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
               'Se present? un error en AD_VACANTES_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_VACANTES_PKG;
/
CREATE OR REPLACE PACKAGE CA_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_ASPIRANTE_ESTUDIOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_CIUDADI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la ciudad del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_ESTUDIOS_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                        PTY_CODIGOI,
                                                        PTY_DOCUMENTOI,     
                                                        PTY_UNIVERSIDADI,   
                                                        PTY_PROFESIONI,     
                                                        PTY_FECHA_INICIOI,  
                                                        PTY_FECHA_FINI,     
                                                        PTY_ESTADO_ESTUDIOI,
                                                        PTY_IDIOMAI,        
                                                        PTY_NIVEL_IDIOMAI,  
                                                        PTY_COD_CIUDADI,
                                                        PNB_RESULTADOO,
                                                        PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_ESTUDIOS_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_ESTUDIOS_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                          PTY_CODIGOI,     
                                                          PTY_DOCUMENTOI,     
                                                          PTY_UNIVERSIDADI,   
                                                          PTY_PROFESIONI,     
                                                          PTY_FECHA_INICIOI,  
                                                          PTY_FECHA_FINI,     
                                                          PTY_ESTADO_ESTUDIOI,
                                                          PTY_IDIOMAI,        
                                                          PTY_NIVEL_IDIOMAI,  
                                                          PTY_COD_CIUDADI,
                                                          PNB_RESULTADOO,
                                                          PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_ESTUDIOS_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         AD_ASPIRANTE_ESTUDIOS_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                        PTY_CODIGOI,
                                                        PRF_REGISTROO,
                                                        PNB_RESULTADOO,
                                                        PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_ESTUDIOS_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         VBO_EXISTE := AD_ASPIRANTE_ESTUDIOS_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_ESTUDIOS_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ASPIRANTE_ESTUDIOS_PKG;
/
CREATE OR REPLACE PACKAGE CA_ASPIRANTE_EXPERIENCIA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                  PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                  PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                  PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                    PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                    PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                    PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                    PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                    PNB_RESULTADOO      OUT NUMBER,
                                    PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                PVH_MENSAJEO        OUT VARCHAR2);
                                
   /*************************************************************/
END CA_ASPIRANTE_EXPERIENCIA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ASPIRANTE_EXPERIENCIA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                  PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                  PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                  PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_EXPERIENCIA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PTY_DOCUMENTOI,     
                                                           PTY_EMPRESAI,   
                                                           PTY_CARGOI,     
                                                           PTY_FECHA_INICIOI,  
                                                           PTY_FECHA_FINI,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_EXPERIENCIA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                    PTY_DOCUMENTOI      IN ASPIRANTE_EXPERIENCIA.DOCUMENTO%TYPE,
                                    PTY_EMPRESAI        IN ASPIRANTE_EXPERIENCIA.EMPRESA%TYPE,
                                    PTY_CARGOI          IN ASPIRANTE_EXPERIENCIA.CARGO%TYPE,
                                    PTY_FECHA_INICIOI   IN ASPIRANTE_EXPERIENCIA.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI      IN ASPIRANTE_EXPERIENCIA.FECHA_FIN%TYPE,
                                    PNB_RESULTADOO      OUT NUMBER,
                                    PVH_MENSAJEO        OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_EXPERIENCIA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                             PTY_CODIGOI,     
                                                             PTY_DOCUMENTOI,     
                                                             PTY_EMPRESAI,   
                                                             PTY_CARGOI,      
                                                             PTY_FECHA_INICIOI,  
                                                             PTY_FECHA_FINI,
                                                             PNB_RESULTADOO,
                                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_EXPERIENCIA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         AD_ASPIRANTE_EXPERIENCIA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PRF_REGISTROO,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_EXPERIENCIA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                PVH_MENSAJEO        OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         VBO_EXISTE := AD_ASPIRANTE_EXPERIENCIA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_EXPERIENCIA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ASPIRANTE_EXPERIENCIA_PKG;
/
CREATE OR REPLACE PACKAGE CA_ASPIRANTE_PKG
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
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ASPIRANTE_PKG
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
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo de documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NOMBREI IS NULL
      THEN
         PVH_MENSAJEO := 'El nombre del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_APELLIDOI IS NULL
      THEN
         PVH_MENSAJEO := 'El apellido del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_GENEROI IS NULL
      THEN
         PVH_MENSAJEO := 'El genero del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_NACIMIENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha de nacimiento del aspirante no pueden ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DIRECCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La direccion del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TELEFONOI IS NULL
      THEN
         PVH_MENSAJEO := 'El telefono del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CELULARI IS NULL
      THEN
         PVH_MENSAJEO := 'El celular del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESTADO_CIVILI IS NULL
      THEN
         PVH_MENSAJEO := 'El estado civil del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CORREO_ELECTRONICOI IS NULL
      THEN
         PVH_MENSAJEO := 'El correo electronico del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DISCAPACIDADI IS NULL
      THEN
         PVH_MENSAJEO := 'La discapacidad del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_SALARIO_ASPIRAI IS NULL
      THEN
         PVH_MENSAJEO := 'El salario aspirado no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La profesion del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_VIAJAI IS NULL
      THEN
         PVH_MENSAJEO := 'La disponibilidad de viaje del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_INSCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha de inscripcion del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGO_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la de la vacante del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGO_FORMULARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESION_COMPLEMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'La profecion completa del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FORMULARIO_PRUEBA_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario prueba del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CIUD_NACII IS NULL
      THEN
         PVH_MENSAJEO := 'La ciudad de nacimiento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CIUD_ACTUALI IS NULL
      THEN
         PVH_MENSAJEO := 'La ciudad actual del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_DOCUMENTOI,                
                                               PTY_TIPO_DOCUMENTOI,           
                                               PTY_NOMBREI,                   
                                               PTY_APELLIDOI,                 
                                               PTY_GENEROI,                   
                                               PTY_FECHA_NACIMIENTOI,         
                                               PTY_DIRECCIONI,                
                                               PTY_TELEFONOI,                 
                                               PTY_CELULARI,                  
                                               PTY_ESTADO_CIVILI,             
                                               PTY_CORREO_ELECTRONICOI,       
                                               PTY_DISCAPACIDADI,             
                                               PTY_SALARIO_ASPIRAI,           
                                               PTY_PROFESIONI,                
                                               PTY_VIAJAI,                    
                                               PTY_FECHA_INSCRIPCIONI,        
                                               PTY_CODIGO_VACANTEI,           
                                               PTY_CODIGO_FORMULARIOI,        
                                               PTY_PROFESION_COMPLEMENTOI,    
                                               PTY_FORMULARIO_PRUEBA_CODIGOI, 
                                               PTY_CIUD_NACII,                
                                               PTY_CIUD_ACTUALI,              
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
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
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                PTY_DOCUMENTOI,               
                                                PTY_TIPO_DOCUMENTOI,          
                                                PTY_NOMBREI,                  
                                                PTY_APELLIDOI,                
                                                PTY_GENEROI,                  
                                                PTY_FECHA_NACIMIENTOI,        
                                                PTY_DIRECCIONI,               
                                                PTY_TELEFONOI,                
                                                PTY_CELULARI,                 
                                                PTY_ESTADO_CIVILI,            
                                                PTY_CORREO_ELECTRONICOI,      
                                                PTY_DISCAPACIDADI,            
                                                PTY_SALARIO_ASPIRAI,          
                                                PTY_PROFESIONI,               
                                                PTY_VIAJAI,                   
                                                PTY_FECHA_INSCRIPCIONI,       
                                                PTY_CODIGO_VACANTEI,          
                                                PTY_CODIGO_FORMULARIOI,       
                                                PTY_PROFESION_COMPLEMENTOI,   
                                                PTY_FORMULARIO_PRUEBA_CODIGOI,
                                                PTY_CIUD_NACII,               
                                                PTY_CIUD_ACTUALI,             
                                                PNB_RESULTADOO,
                                                PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
      ELSE
         AD_VACANTES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                              PTY_DOCUMENTOI,
                                              PRF_REGISTROO,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
      ELSE
         VBO_EXISTE := AD_ASPIRANTE_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_DOCUMENTOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE CA_CARGOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     CARGOS.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     CARGOS.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_CARGOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_CARGOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     CARGOS.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion del cargo no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CARGOS_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_CARGOS_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     CARGOS.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CARGOS_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_CARGOS_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
      ELSE
         AD_CARGOS_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_CARGOS_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     CARGOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     CARGOS.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
      ELSE
         VBO_EXISTE := AD_CARGOS_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_CARGOS_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_CARGOS_PKG;
/
CREATE OR REPLACE PACKAGE CA_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante del contacto no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CONTACTO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,      
                                              PTY_CODIGOI,           
                                              PTY_COD_VACANTEI,      
                                              PTY_CONTACTOI,         
                                              PTY_CORREO_CONTACTOI,  
                                              PTY_RECIBE_HV_CORREOI, 
                                              PTY_TELEFONO_CONTACTOI,
                                              PTY_FECHA_ENTREVISTAI, 
                                              PTY_LUGAR_ENTREVISTAI,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_CONTACTO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CONTACTO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,      
                                                PTY_CODIGOI,           
                                                PTY_COD_VACANTEI,      
                                                PTY_CONTACTOI,         
                                                PTY_CORREO_CONTACTOI,  
                                                PTY_RECIBE_HV_CORREOI, 
                                                PTY_TELEFONO_CONTACTOI,
                                                PTY_FECHA_ENTREVISTAI, 
                                                PTY_LUGAR_ENTREVISTAI, 
                                                PNB_RESULTADOO,
                                                PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_CONTACTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
      ELSE
         AD_VACANTES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                              PTY_CODIGOI,
                                              PRF_REGISTROO,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_CONTACTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
      ELSE
         VBO_EXISTE := AD_CONTACTO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_CONTACTO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE CA_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2);

  /*************************************************************/
  PROCEDURE EXISTE_REGISTRO_P(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                              PVH_MENSAJEO OUT VARCHAR2);
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2);
  /*************************************************************/

END CA_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2)
  
   IS
  
  BEGIN
  
    AD_DEPARTAMENTOS_PKG.CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO,
                                                  PNB_RESULTADOO,
                                                  PVH_MENSAJEO);
  
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se present? un error en CA_DEPARTAMENTOS_PKG.CONSULTAR_DEPARTAMENTO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_DEPARTAMENTO_P;
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2) IS
  
  BEGIN
  
    IF PTY_COD_PADREI IS NULL THEN
      PVH_MENSAJEO := 'El codigo del departamento no puede ser null';
    ELSE
      AD_DEPARTAMENTOS_PKG.CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI,
                                                 PRF_REGISTROO,
                                                 PNB_RESULTADOO,
                                                 PVH_MENSAJEO);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se present? un error en CA_DEPARTAMENTOS_PKG.CONSULTAR_MUNICIPIO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_MUNICIPIO_P;
  /*************************************************************/
  PROCEDURE EXISTE_REGISTRO_P(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                              PVH_MENSAJEO OUT VARCHAR2) IS
    VBO_EXISTE BOOLEAN := FALSE;
  BEGIN
    IF PTY_CODIGOI IS NULL THEN
      PVH_MENSAJEO := 'El codigo del departamento no puede ser null';
    ELSE
      VBO_EXISTE := AD_DEPARTAMENTOS_PKG.EXISTE_REGISTRO_F(PTY_CODIGOI,
                                                           PVH_MENSAJEO);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      PVH_MENSAJEO := 'Se present? un error en CA_DEPARTAMENTOS_PKG.EXISTE_REGISTRO_P ' ||
                      SQLCODE || ' - ' || SQLERRM;
  END EXISTE_REGISTRO_P;
  /*************************************************************/
END CA_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE CA_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_EMPRESA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NIT_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El nit de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NOM_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El nombre de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESTADOI IS NULL
      THEN
         PVH_MENSAJEO := 'El estado de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_EMPRESA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                             PTY_NIT_EMPRESAI,
                                             PTY_NOM_EMPRESAI,
                                             PTY_ESTADOI,
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_EMPRESA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_NIT_EMPRESAI,
                                               PTY_NOM_EMPRESAI,
                                               PTY_ESTADOI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
      ELSE
         AD_EMPRESA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                             PRF_REGISTROO,
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
      ELSE
         VBO_EXISTE := AD_EMPRESA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
/*************************************************************/
END CA_EMPRESA_PKG;
/
CREATE OR REPLACE PACKAGE CA_ESCALA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     ESCALA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     ESCALA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_ESCALA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ESCALA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     ESCALA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la escala no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la escala no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ESCALA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_ESCALA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     ESCALA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la escala no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ESCALA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_ESCALA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del estado no puede ser null';
      ELSE
         AD_ESCALA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_ESCALA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     ESCALA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     ESCALA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del estado no puede ser null';
      ELSE
         VBO_EXISTE := AD_ESCALA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_ESCALA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ESCALA_PKG;
/
CREATE OR REPLACE PACKAGE CA_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_FORMULARIO_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESCALAI IS NULL
      THEN
         PVH_MENSAJEO := 'La escala del formulario de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo de la prueba del formulario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_FORMULARIO_PRUEBA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                       PTY_CODIGOI,
                                                       PTY_ESCALAI,      
                                                       PTY_TIPO_PRUEBAI, 
                                                       PTY_CALIFICACIONI,
                                                       PNB_RESULTADOO,
                                                       PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_FORMULARIO_PRUEBA_ASPIRANTE_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_FORMULARIO_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                         PTY_CODIGOI,
                                                         PTY_ESCALAI,      
                                                         PTY_TIPO_PRUEBAI, 
                                                         PTY_CALIFICACIONI,
                                                         PNB_RESULTADOO,
                                                         PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_FORMULARIO_PRUEBA_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
      ELSE
         AD_FORMULARIO_PRUEBA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                       PTY_CODIGOI,
                                                       PRF_REGISTROO,
                                                       PNB_RESULTADOO,
                                                       PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_FORMULARIO_PRUEBA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
      ELSE
         VBO_EXISTE := AD_FORMULARIO_PRUEBA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_FORMULARIO_PRUEBA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_FORMULARIO_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE CA_GENERO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     GENERO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     GENERO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_GENERO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_GENERO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     GENERO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del genero no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion del genero no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_GENERO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_GENERO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     GENERO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del genero no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_GENERO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_GENERO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del genero no puede ser null';
      ELSE
         AD_GENERO_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_GENERO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     GENERO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     GENERO.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del genero no puede ser null';
      ELSE
         VBO_EXISTE := AD_GENERO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_GENERO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_GENERO_PKG;
/
CREATE OR REPLACE PACKAGE CA_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN  HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_HABILIDADES_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento de las habilidades del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_HABILIDADI IS NULL
      THEN
         PVH_MENSAJEO := 'La habilidad del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_ASPIRANTE_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PTY_DOCUMENTOI,
                                                           PTY_HABILIDADI,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_HABILIDADES_ASPIRANTE_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                             PTY_CODIGOI,
                                                             PTY_DOCUMENTOI,
                                                             PTY_HABILIDADI,
                                                             PNB_RESULTADOO,
                                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_HABILIDADES_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         AD_HABILIDADES_ASPIRANTE_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PRF_REGISTROO,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_HABILIDADES_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN  HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         VBO_EXISTE := AD_HABILIDADES_ASPIRANTE_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_HABILIDADES_ASPIRANTE_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_HABILIDADES_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE CA_HABILIDADES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     HABILIDADES.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     HABILIDADES.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_HABILIDADES_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_HABILIDADES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     HABILIDADES.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_HABILIDADES_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     HABILIDADES.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_HABILIDADES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         AD_HABILIDADES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_HABILIDADES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     HABILIDADES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     HABILIDADES.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         VBO_EXISTE := AD_HABILIDADES_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_HABILIDADES_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_HABILIDADES_PKG;
/
CREATE OR REPLACE PACKAGE CA_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_PERFIL_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI     IN     PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo del perfil no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la escala no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_PERFIL_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PERFILI,
                                            PTY_TIPO_PERFILI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PERFIL_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_PERFIL_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_COD_PERFILI,
                                               PTY_TIPO_PERFILI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_PERFIL_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
      ELSE
         AD_PERFIL_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PERFILI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PERFIL_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                PTY_COD_PERFILI     IN     PERFIL.COD_PERFIL%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
      ELSE
         VBO_EXISTE := AD_PERFIL_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PERFILI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_PERFIL_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_PERFIL_PKG;
/
CREATE OR REPLACE PACKAGE CA_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_PROFESIONES_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_PROFESIONI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la profesion no puede ser null';
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                    PTY_COD_PROFESIONI,
                                                    PRF_REGISTROO,
                                                    PNB_RESULTADOO,
                                                    PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESIONES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_COD_PROFESIONI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la profesion no puede ser null';
      ELSE
         VBO_EXISTE := AD_PROFESIONES_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PROFESIONI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESIONES_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_PROFESIONES_PKG;
/
CREATE OR REPLACE PACKAGE CA_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI   IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                PTY_COD_PRODETAI IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_PROFESION_DETALLE_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI   IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_PRODETAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del detalle de la profesion no puede ser null';
      ELSE
         AD_PROFESION_DETALLE_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                    PTY_COD_PRODETAI,
                                                    PRF_REGISTROO,
                                                    PNB_RESULTADOO,
                                                    PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESION_DETALLE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                PTY_COD_PRODETAI IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_PRODETAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del detalle de la profesion no puede ser null';
      ELSE
         VBO_EXISTE := AD_PROFESION_DETALLE_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PRODETAI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESION_DETALLE_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_PROFESION_DETALLE_PKG;
/
CREATE OR REPLACE PACKAGE CA_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_TIPO_DE_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion del tipo de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PRUEBAI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DE_PRUEBA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_COD_PRUEBAI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DE_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PRUEBAI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
      ELSE
         VBO_EXISTE := AD_TIPO_DE_PRUEBA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PRUEBAI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DE_PRUEBA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_TIPO_DE_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE CA_TIPO_DOCUMENTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/
END CA_TIPO_DOCUMENTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_TIPO_DOCUMENTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de documento no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion del tipo de documento no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DOCUMENTO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DOCUMENTO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DOCUMENTO.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de documento no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DOCUMENTO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_CODIGOI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DOCUMENTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de documento no puede ser null';
      ELSE
         AD_TIPO_DOCUMENTO_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_CODIGOI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DOCUMENTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DOCUMENTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN     TIPO_DOCUMENTO.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El cï¿½digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de documento no puede ser null';
      ELSE
         VBO_EXISTE := AD_TIPO_DOCUMENTO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentï¿½ un error en CA_TIPO_DOCUMENTO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_TIPO_DOCUMENTO_PKG;
/
CREATE OR REPLACE PACKAGE CA_USUARIO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                  PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                  PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                  PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                  PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                    PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                    PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                    PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                    PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                    PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                    PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                    PNB_RESULTADOO         OUT NUMBER,
                                    PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PRF_REGISTROO          OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                PVH_MENSAJEO           OUT VARCHAR2);
                                
   /*************************************************************/
END CA_USUARIO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_USUARIO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                  PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                  PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                  PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                  PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_USUARIO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                             PTY_COD_USUARIOI,   
                                             PTY_DOCUMENTOI,     
                                             PTY_NOMBRE_USUARIOI,
                                             PTY_CONTRASENAI,    
                                             PTY_COD_PERFILI,    
                                             PTY_ESTADOI, 
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                    PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                    PTY_DOCUMENTOI         IN USUARIO.DOCUMENTO%TYPE,
                                    PTY_NOMBRE_USUARIOI    IN USUARIO.NOMBRE_USUARIO%TYPE,
                                    PTY_CONTRASENAI        IN USUARIO.CONTRASENA%TYPE,
                                    PTY_COD_PERFILI        IN USUARIO.COD_PERFIL%TYPE,
                                    PTY_ESTADOI            IN USUARIO.ESTADO%TYPE,
                                    PNB_RESULTADOO         OUT NUMBER,
                                    PVH_MENSAJEO           OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_USUARIO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_COD_USUARIOI,   
                                               PTY_DOCUMENTOI,     
                                               PTY_NOMBRE_USUARIOI,
                                               PTY_CONTRASENAI,    
                                               PTY_COD_PERFILI,    
                                               PTY_ESTADOI, 
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PRF_REGISTROO          OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
      ELSE
         AD_USUARIO_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                             PTY_COD_USUARIOI,
                                             PRF_REGISTROO,
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                PVH_MENSAJEO           OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
      ELSE
         VBO_EXISTE := AD_USUARIO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_USUARIOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_USUARIO_PKG;
/
CREATE OR REPLACE PACKAGE CA_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_VACANTES_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGO_CARGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_INICIALI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha inicial no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_FINALI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha final no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRI_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_HABILIDADES_REQI IS NULL
      THEN
         PVH_MENSAJEO := 'Las habilidades requeridas en la vacante no pueden ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ACTI_REALIZAI IS NULL
      THEN
         PVH_MENSAJEO := 'La actividad realizada en la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_JORNADA_LABORALI IS NULL
      THEN
         PVH_MENSAJEO := 'La jornada laboral en la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_EMPLEOI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo de empleo en la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_RANGO_SALARIALI IS NULL
      THEN
         PVH_MENSAJEO := 'El rango salarial de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CANTIDAD_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'La cantidad de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_EXPERIENCIA_MINIMAI IS NULL
      THEN
         PVH_MENSAJEO := 'La experiencia minima de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_IDIOMA_REQUERIDOI IS NULL
      THEN
         PVH_MENSAJEO := 'El idioma requerido de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NIVEL_ESTUDIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El nivel de estudio de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DISPONIBLE_VIAJEI IS NULL
      THEN
         PVH_MENSAJEO := 'La disponibilidad de viaje de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ACEPTA_DISCAPACIDADI IS NULL
      THEN
         PVH_MENSAJEO := 'La aceptacion de discapacidad de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_CIUDADI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la ciudad de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESTADOI IS NULL
      THEN
         PVH_MENSAJEO := 'El estado de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESIONI IS NULL
      THEN  
         PVH_MENSAJEO := 'La profecion de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESION_COMPLEMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'la profecion completa de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_VACANTES_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                              PTY_CODIGOI,     
                                              PTY_CODIGO_CARGOI         ,
                                              PTY_FECHA_INICIALI        ,
                                              PTY_FECHA_FINALI          ,
                                              PTY_DESCRI_VACANTEI       ,
                                              PTY_HABILIDADES_REQI      ,
                                              PTY_ACTI_REALIZAI         ,
                                              PTY_JORNADA_LABORALI      ,
                                              PTY_TIPO_EMPLEOI          ,
                                              PTY_RANGO_SALARIALI       ,
                                              PTY_CANTIDAD_VACANTEI     ,
                                              PTY_EXPERIENCIA_MINIMAI   ,
                                              PTY_IDIOMA_REQUERIDOI     ,
                                              PTY_NIVEL_ESTUDIOI        ,
                                              PTY_DISPONIBLE_VIAJEI     ,
                                              PTY_ACEPTA_DISCAPACIDADI  ,
                                              PTY_COD_CIUDADI           ,
                                              PTY_ESTADOI               ,
                                              PTY_PROFESIONI            ,
                                              PTY_PROFESION_COMPLEMENTOI,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_VACANTES_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_VACANTES_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                PTY_CODIGOI,     
                                                PTY_CODIGO_CARGOI         ,
                                                PTY_FECHA_INICIALI        ,
                                                PTY_FECHA_FINALI          ,
                                                PTY_DESCRI_VACANTEI       ,
                                                PTY_HABILIDADES_REQI      ,
                                                PTY_ACTI_REALIZAI         ,
                                                PTY_JORNADA_LABORALI      ,
                                                PTY_TIPO_EMPLEOI          ,
                                                PTY_RANGO_SALARIALI       ,
                                                PTY_CANTIDAD_VACANTEI     ,
                                                PTY_EXPERIENCIA_MINIMAI   ,
                                                PTY_IDIOMA_REQUERIDOI     ,
                                                PTY_NIVEL_ESTUDIOI        ,
                                                PTY_DISPONIBLE_VIAJEI     ,
                                                PTY_ACEPTA_DISCAPACIDADI  ,
                                                PTY_COD_CIUDADI           ,
                                                PTY_ESTADOI               ,
                                                PTY_PROFESIONI            ,
                                                PTY_PROFESION_COMPLEMENTOI,
                                                PNB_RESULTADOO,
                                                PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_VACANTES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante no puede ser null';
      ELSE
         AD_VACANTES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                              PTY_CODIGOI,
                                              PRF_REGISTROO,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_VACANTES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo dela vacante no puede ser null';
      ELSE
         VBO_EXISTE := AD_VACANTES_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_VACANTES_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_VACANTES_PKG;
/