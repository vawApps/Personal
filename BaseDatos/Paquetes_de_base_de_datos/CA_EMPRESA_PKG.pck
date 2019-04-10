CREATE OR REPLACE PACKAGE CA_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_EMPRESA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_EMPRESA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                  PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                  PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NIT_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El nit de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NOM_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El nombre de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESTADOI IS NULL
      THEN
         PVH_MENSAJEO := 'El estado de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_EMPRESA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                             PTY_NIT_EMPRESAI,
                                             PTY_NOM_EMPRESAI,
                                             PTY_ESTADOI,
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                    PTY_NIT_EMPRESAI   IN     EMPRESA.NIT_EMPRESA%TYPE,
                                    PTY_NOM_EMPRESAI   IN     EMPRESA.NOMBRE_EMPRESA%TYPE,
                                    PTY_ESTADOI        IN     EMPRESA.ESTADO%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_EMPRESA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_NIT_EMPRESAI,
                                               PTY_NOM_EMPRESAI,
                                               PTY_ESTADOI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
      ELSE
         AD_EMPRESA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                             PRF_REGISTROO,
                                             PNB_RESULTADOO,
                                             PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     EMPRESA.COD_EMPRESA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El código de la empresa no puede ser null';
      ELSE
         VBO_EXISTE := AD_EMPRESA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presentó un error en CA_EMPRESA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
/*************************************************************/
END CA_EMPRESA_PKG;
/
