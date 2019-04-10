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
