CREATE OR REPLACE PACKAGE CA_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_PROFESIONES_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_PROFESIONES_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                  PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_PROFESIONI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la profesion no puede ser null';
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                    PTY_COD_PROFESIONI,
                                                    PRF_REGISTROO,
                                                    PNB_RESULTADOO,
                                                    PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESIONES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESIONES.COD_EMPRESA%TYPE,
                                PTY_COD_PROFESIONI IN  PROFESIONES.COD_PROFESION%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_COD_PROFESIONI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la profesion no puede ser null';
      ELSE
         VBO_EXISTE := AD_PROFESIONES_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PROFESIONI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESIONES_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_PROFESIONES_PKG;
/
