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
