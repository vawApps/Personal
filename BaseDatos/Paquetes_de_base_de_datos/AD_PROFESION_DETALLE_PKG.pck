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
