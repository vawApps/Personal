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
