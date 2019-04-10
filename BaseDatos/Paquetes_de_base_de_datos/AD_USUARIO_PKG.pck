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
