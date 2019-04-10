CREATE OR REPLACE PACKAGE CA_USUARIO_PKG
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
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                PVH_MENSAJEO           OUT VARCHAR2);
                                
   /*************************************************************/
END CA_USUARIO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_USUARIO_PKG
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
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_USUARIO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                             PTY_COD_USUARIOI,   
                                             PTY_DOCUMENTOI,     
                                             PTY_NOMBRE_USUARIOI,
                                             PTY_CONTRASENAI,    
                                             PTY_COD_PERFILI,    
                                             PTY_ESTADOI, 
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
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
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_USUARIO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_COD_USUARIOI,   
                                               PTY_DOCUMENTOI,     
                                               PTY_NOMBRE_USUARIOI,
                                               PTY_CONTRASENAI,    
                                               PTY_COD_PERFILI,    
                                               PTY_ESTADOI, 
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                  PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                  PRF_REGISTROO          OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO         OUT NUMBER,
                                  PVH_MENSAJEO           OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
      ELSE
         AD_USUARIO_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                             PTY_COD_USUARIOI,
                                             PRF_REGISTROO,
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI       IN USUARIO.COD_EMPRESA%TYPE,
                                PTY_COD_USUARIOI       IN USUARIO.COD_USUARIO%TYPE,
                                PVH_MENSAJEO           OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_USUARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del usuario no puede ser null';
      ELSE
         VBO_EXISTE := AD_USUARIO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_USUARIOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_USUARIO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_USUARIO_PKG;
/
