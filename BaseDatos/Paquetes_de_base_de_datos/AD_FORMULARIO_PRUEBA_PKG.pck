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
