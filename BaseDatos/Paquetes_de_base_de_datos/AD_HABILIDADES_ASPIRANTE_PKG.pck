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
