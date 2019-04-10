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
