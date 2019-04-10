CREATE OR REPLACE PACKAGE CA_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_CONTACTO_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                  PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                  PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                  PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                  PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                  PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                  PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                  PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
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
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante del contacto no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CONTACTO_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,      
                                              PTY_CODIGOI,           
                                              PTY_COD_VACANTEI,      
                                              PTY_CONTACTOI,         
                                              PTY_CORREO_CONTACTOI,  
                                              PTY_RECIBE_HV_CORREOI, 
                                              PTY_TELEFONO_CONTACTOI,
                                              PTY_FECHA_ENTREVISTAI, 
                                              PTY_LUGAR_ENTREVISTAI,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en CA_CONTACTO_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                    PTY_COD_VACANTEI            IN CONTACTO.COD_VACANTE%TYPE,
                                    PTY_CONTACTOI               IN CONTACTO.CONTACTO%TYPE,
                                    PTY_CORREO_CONTACTOI        IN CONTACTO.CORREO_CONTACTO%TYPE,
                                    PTY_RECIBE_HV_CORREOI       IN CONTACTO.RECIBE_HV_CORREO%TYPE,
                                    PTY_TELEFONO_CONTACTOI      IN CONTACTO.TELEFONO_CONTACTO%TYPE,
                                    PTY_FECHA_ENTREVISTAI       IN CONTACTO.FECHA_ENTREVISTA%TYPE,
                                    PTY_LUGAR_ENTREVISTAI       IN CONTACTO.LUGAR_ENTREVISTA%TYPE,
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
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_CONTACTO_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,      
                                                PTY_CODIGOI,           
                                                PTY_COD_VACANTEI,      
                                                PTY_CONTACTOI,         
                                                PTY_CORREO_CONTACTOI,  
                                                PTY_RECIBE_HV_CORREOI, 
                                                PTY_TELEFONO_CONTACTOI,
                                                PTY_FECHA_ENTREVISTAI, 
                                                PTY_LUGAR_ENTREVISTAI, 
                                                PNB_RESULTADOO,
                                                PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_CONTACTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
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
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
      ELSE
         AD_VACANTES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
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
               'Se presento un error en CA_CONTACTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN CONTACTO.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN CONTACTO.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del contacto no puede ser null';
      ELSE
         VBO_EXISTE := AD_CONTACTO_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI,PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_CONTACTO_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_CONTACTO_PKG;
/
