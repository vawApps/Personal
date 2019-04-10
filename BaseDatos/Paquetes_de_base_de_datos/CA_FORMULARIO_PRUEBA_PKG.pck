CREATE OR REPLACE PACKAGE CA_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2);
                                
   /*************************************************************/

END CA_FORMULARIO_PRUEBA_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_FORMULARIO_PRUEBA_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                  PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                  PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESCALAI IS NULL
      THEN
         PVH_MENSAJEO := 'La escala del formulario de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_PRUEBAI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo de la prueba del formulario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_FORMULARIO_PRUEBA_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                       PTY_CODIGOI,
                                                       PTY_ESCALAI,      
                                                       PTY_TIPO_PRUEBAI, 
                                                       PTY_CALIFICACIONI,
                                                       PNB_RESULTADOO,
                                                       PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_FORMULARIO_PRUEBA_ASPIRANTE_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                    PTY_ESCALAI        IN FORMULARIO_PRUEBA.ESCALA%TYPE,
                                    PTY_TIPO_PRUEBAI   IN FORMULARIO_PRUEBA.TIPO_PRUEBA%TYPE,
                                    PTY_CALIFICACIONI  IN FORMULARIO_PRUEBA.CALIFICACION%TYPE,
                                    PNB_RESULTADOO     OUT NUMBER,
                                    PVH_MENSAJEO       OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_FORMULARIO_PRUEBA_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                         PTY_CODIGOI,
                                                         PTY_ESCALAI,      
                                                         PTY_TIPO_PRUEBAI, 
                                                         PTY_CALIFICACIONI,
                                                         PNB_RESULTADOO,
                                                         PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_FORMULARIO_PRUEBA_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                  PRF_REGISTROO      OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO     OUT NUMBER,
                                  PVH_MENSAJEO       OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
      ELSE
         AD_FORMULARIO_PRUEBA_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
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
               'Se presento un error en CA_FORMULARIO_PRUEBA_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI   IN FORMULARIO_PRUEBA.COD_EMPRESA%TYPE,
                                PTY_CODIGOI        IN FORMULARIO_PRUEBA.CODIGO%TYPE,
                                PVH_MENSAJEO       OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario de la prueba no puede ser null';
      ELSE
         VBO_EXISTE := AD_FORMULARIO_PRUEBA_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_FORMULARIO_PRUEBA_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_FORMULARIO_PRUEBA_PKG;
/
