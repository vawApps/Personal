CREATE OR REPLACE PACKAGE CA_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_PERFIL_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_PERFIL_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI     IN     PERFIL.COD_PERFIL%TYPE,
                                  PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                  PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo del perfil no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la escala no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_PERFIL_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PERFILI,
                                            PTY_TIPO_PERFILI,
                                            PTY_DESCRIPCIONI,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PERFIL_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                    PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                    PTY_TIPO_PERFILI   IN     PERFIL.TIPO_PERFIL%TYPE,
                                    PTY_DESCRIPCIONI   IN     PERFIL.DESCRIPCION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_PERFIL_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_COD_PERFILI,
                                               PTY_TIPO_PERFILI,
                                               PTY_DESCRIPCIONI,
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_PERFIL_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                  PTY_COD_PERFILI    IN     PERFIL.COD_PERFIL%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
      ELSE
         AD_PERFIL_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                            PTY_COD_PERFILI,
                                            PRF_REGISTROO,
                                            PNB_RESULTADOO,
                                            PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_PERFIL_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN     PERFIL.COD_EMPRESA%TYPE,
                                PTY_COD_PERFILI     IN     PERFIL.COD_PERFIL%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_COD_PERFILI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del perfil no puede ser null';
      ELSE
         VBO_EXISTE := AD_PERFIL_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_COD_PERFILI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_PERFIL_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_PERFIL_PKG;
/
