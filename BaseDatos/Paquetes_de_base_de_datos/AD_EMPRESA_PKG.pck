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
