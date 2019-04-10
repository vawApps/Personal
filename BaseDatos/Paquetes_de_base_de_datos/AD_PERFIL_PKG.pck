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
