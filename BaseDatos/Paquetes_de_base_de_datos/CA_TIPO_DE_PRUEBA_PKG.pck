CREATE OR REPLACE PACKAGE CA_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_TIPO_DE_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_TIPO_DE_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c�digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion del tipo de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PRUEBAI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present� un error en CA_TIPO_DE_PRUEBA_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                    PTY_DESCRIPCIONI   IN     TIPO_DE_PRUEBA.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c�digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_COD_PRUEBAI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present� un error en CA_TIPO_DE_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c�digo de la empresa no puede ser null';
         ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
      ELSE
         AD_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PRUEBAI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present� un error en CA_TIPO_DE_PRUEBA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     TIPO_DE_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_COD_PRUEBAI    IN     TIPO_DE_PRUEBA.COD_PRUEBA%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c�digo de la empresa no puede ser null';
         ELSIF PTY_COD_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del tipo de prueba no puede ser null';
      ELSE
         VBO_EXISTE := AD_TIPO_DE_PRUEBA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PRUEBAI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present� un error en CA_TIPO_DE_PRUEBA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_TIPO_DE_PRUEBA_PKG;
/
