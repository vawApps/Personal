CREATE OR REPLACE PACKAGE CA_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_ASPIRANTE_ESTUDIOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ASPIRANTE_ESTUDIOS_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                  PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                  PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                  PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                  PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                  PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                  PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                  PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                  PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
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
      ELSIF PTY_COD_CIUDADI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la ciudad del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_ESTUDIOS_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                        PTY_CODIGOI,
                                                        PTY_DOCUMENTOI,     
                                                        PTY_UNIVERSIDADI,   
                                                        PTY_PROFESIONI,     
                                                        PTY_FECHA_INICIOI,  
                                                        PTY_FECHA_FINI,     
                                                        PTY_ESTADO_ESTUDIOI,
                                                        PTY_IDIOMAI,        
                                                        PTY_NIVEL_IDIOMAI,  
                                                        PTY_COD_CIUDADI,
                                                        PNB_RESULTADOO,
                                                        PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_ESTUDIOS_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                    PTY_DOCUMENTOI              IN ASPIRANTE_ESTUDIOS.DOCUMENTO%TYPE,
                                    PTY_UNIVERSIDADI            IN ASPIRANTE_ESTUDIOS.UNIVERSIDAD%TYPE,
                                    PTY_PROFESIONI              IN ASPIRANTE_ESTUDIOS.PROFESION%TYPE,
                                    PTY_FECHA_INICIOI           IN ASPIRANTE_ESTUDIOS.FECHA_INICIO%TYPE,
                                    PTY_FECHA_FINI              IN ASPIRANTE_ESTUDIOS.FECHA_FIN%TYPE,
                                    PTY_ESTADO_ESTUDIOI         IN ASPIRANTE_ESTUDIOS.ESTADO_ESTUDIO%TYPE,
                                    PTY_IDIOMAI                 IN ASPIRANTE_ESTUDIOS.IDIOMA%TYPE,
                                    PTY_NIVEL_IDIOMAI           IN ASPIRANTE_ESTUDIOS.NIVEL_IDIOMA%TYPE,
                                    PTY_COD_CIUDADI             IN ASPIRANTE_ESTUDIOS.COD_CIUDAD%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
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
         AD_ASPIRANTE_ESTUDIOS_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                          PTY_CODIGOI,     
                                                          PTY_DOCUMENTOI,     
                                                          PTY_UNIVERSIDADI,   
                                                          PTY_PROFESIONI,     
                                                          PTY_FECHA_INICIOI,  
                                                          PTY_FECHA_FINI,     
                                                          PTY_ESTADO_ESTUDIOI,
                                                          PTY_IDIOMAI,        
                                                          PTY_NIVEL_IDIOMAI,  
                                                          PTY_COD_CIUDADI,
                                                          PNB_RESULTADOO,
                                                          PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_ESTUDIOS_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del aspirante no puede ser null';
      ELSE
         AD_ASPIRANTE_ESTUDIOS_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
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
               'Se presento un error en CA_ASPIRANTE_ESTUDIOS_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE_ESTUDIOS.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN ASPIRANTE_ESTUDIOS.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
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
         VBO_EXISTE := AD_ASPIRANTE_ESTUDIOS_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_ESTUDIOS_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ASPIRANTE_ESTUDIOS_PKG;
/
