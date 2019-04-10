CREATE OR REPLACE PACKAGE CA_ASPIRANTE_EXPERIENCIA_PKG
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
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                PVH_MENSAJEO        OUT VARCHAR2);
                                
   /*************************************************************/
END CA_ASPIRANTE_EXPERIENCIA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ASPIRANTE_EXPERIENCIA_PKG
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
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_EXPERIENCIA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PTY_DOCUMENTOI,     
                                                           PTY_EMPRESAI,   
                                                           PTY_CARGOI,     
                                                           PTY_FECHA_INICIOI,  
                                                           PTY_FECHA_FINI,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_EXPERIENCIA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
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
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_EXPERIENCIA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                             PTY_CODIGOI,     
                                                             PTY_DOCUMENTOI,     
                                                             PTY_EMPRESAI,   
                                                             PTY_CARGOI,      
                                                             PTY_FECHA_INICIOI,  
                                                             PTY_FECHA_FINI,
                                                             PNB_RESULTADOO,
                                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_EXPERIENCIA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                  PRF_REGISTROO       OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO      OUT NUMBER,
                                  PVH_MENSAJEO        OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         AD_ASPIRANTE_EXPERIENCIA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PRF_REGISTROO,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_EXPERIENCIA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI    IN ASPIRANTE_EXPERIENCIA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI         IN ASPIRANTE_EXPERIENCIA.CODIGO%TYPE,
                                PVH_MENSAJEO        OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         VBO_EXISTE := AD_ASPIRANTE_EXPERIENCIA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_EXPERIENCIA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ASPIRANTE_EXPERIENCIA_PKG;
/
