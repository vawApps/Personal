CREATE OR REPLACE PACKAGE CA_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI   IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                PTY_COD_PRODETAI IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_PROFESION_DETALLE_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_PROFESION_DETALLE_PKG
AS
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                  PTY_COD_PRODETAI   IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_PRODETAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del detalle de la profesion no puede ser null';
      ELSE
         AD_PROFESION_DETALLE_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                                    PTY_COD_PRODETAI,
                                                    PRF_REGISTROO,
                                                    PNB_RESULTADOO,
                                                    PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESION_DETALLE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN  PROFESION_DETALLE.COD_EMPRESA%TYPE,
                                PTY_COD_PRODETAI IN  PROFESION_DETALLE.COD_PRODETA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_COD_PRODETAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del detalle de la profesion no puede ser null';
      ELSE
         VBO_EXISTE := AD_PROFESION_DETALLE_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PRODETAI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_PROFESION_DETALLE_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_PROFESION_DETALLE_PKG;
/
