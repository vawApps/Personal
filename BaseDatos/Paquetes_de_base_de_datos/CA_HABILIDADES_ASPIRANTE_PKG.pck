CREATE OR REPLACE PACKAGE CA_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN  HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_HABILIDADES_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_HABILIDADES_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento de las habilidades del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_HABILIDADI IS NULL
      THEN
         PVH_MENSAJEO := 'La habilidad del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_ASPIRANTE_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                           PTY_CODIGOI,
                                                           PTY_DOCUMENTOI,
                                                           PTY_HABILIDADI,
                                                           PNB_RESULTADOO,
                                                           PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_HABILIDADES_ASPIRANTE_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                    PTY_DOCUMENTOI     IN HABILIDADES_ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_HABILIDADI     IN HABILIDADES_ASPIRANTE.HABILIDAD%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_HABILIDADES_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                             PTY_CODIGOI,
                                                             PTY_DOCUMENTOI,
                                                             PTY_HABILIDADI,
                                                             PNB_RESULTADOO,
                                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_HABILIDADES_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         AD_HABILIDADES_ASPIRANTE_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
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
               'Se presento un error en CA_HABILIDADES_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  HABILIDADES_ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN  HABILIDADES_ASPIRANTE.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la habilidad no puede ser null';
      ELSE
         VBO_EXISTE := AD_HABILIDADES_ASPIRANTE_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_HABILIDADES_ASPIRANTE_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_HABILIDADES_ASPIRANTE_PKG;
/
