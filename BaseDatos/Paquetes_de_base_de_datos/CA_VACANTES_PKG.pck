CREATE OR REPLACE PACKAGE CA_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_VACANTES_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_VACANTES_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                  PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                  PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                  PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                  PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                  PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                  PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                  PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                  PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                  PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                  PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                  PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                  PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                  PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                  PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                  PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                  PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                  PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
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
         PVH_MENSAJEO := 'El codigo de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGO_CARGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del cargo no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_INICIALI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha inicial no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_FINALI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha final no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DESCRI_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'La descripcion de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_HABILIDADES_REQI IS NULL
      THEN
         PVH_MENSAJEO := 'Las habilidades requeridas en la vacante no pueden ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ACTI_REALIZAI IS NULL
      THEN
         PVH_MENSAJEO := 'La actividad realizada en la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_JORNADA_LABORALI IS NULL
      THEN
         PVH_MENSAJEO := 'La jornada laboral en la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_EMPLEOI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo de empleo en la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_RANGO_SALARIALI IS NULL
      THEN
         PVH_MENSAJEO := 'El rango salarial de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CANTIDAD_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'La cantidad de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_EXPERIENCIA_MINIMAI IS NULL
      THEN
         PVH_MENSAJEO := 'La experiencia minima de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_IDIOMA_REQUERIDOI IS NULL
      THEN
         PVH_MENSAJEO := 'El idioma requerido de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NIVEL_ESTUDIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El nivel de estudio de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DISPONIBLE_VIAJEI IS NULL
      THEN
         PVH_MENSAJEO := 'La disponibilidad de viaje de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ACEPTA_DISCAPACIDADI IS NULL
      THEN
         PVH_MENSAJEO := 'La aceptacion de discapacidad de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_COD_CIUDADI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la ciudad de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESTADOI IS NULL
      THEN
         PVH_MENSAJEO := 'El estado de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESIONI IS NULL
      THEN  
         PVH_MENSAJEO := 'La profecion de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESION_COMPLEMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'la profecion completa de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_VACANTES_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                              PTY_CODIGOI,     
                                              PTY_CODIGO_CARGOI         ,
                                              PTY_FECHA_INICIALI        ,
                                              PTY_FECHA_FINALI          ,
                                              PTY_DESCRI_VACANTEI       ,
                                              PTY_HABILIDADES_REQI      ,
                                              PTY_ACTI_REALIZAI         ,
                                              PTY_JORNADA_LABORALI      ,
                                              PTY_TIPO_EMPLEOI          ,
                                              PTY_RANGO_SALARIALI       ,
                                              PTY_CANTIDAD_VACANTEI     ,
                                              PTY_EXPERIENCIA_MINIMAI   ,
                                              PTY_IDIOMA_REQUERIDOI     ,
                                              PTY_NIVEL_ESTUDIOI        ,
                                              PTY_DISPONIBLE_VIAJEI     ,
                                              PTY_ACEPTA_DISCAPACIDADI  ,
                                              PTY_COD_CIUDADI           ,
                                              PTY_ESTADOI               ,
                                              PTY_PROFESIONI            ,
                                              PTY_PROFESION_COMPLEMENTOI,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_VACANTES_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                    PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                    PTY_CODIGO_CARGOI           IN VACANTES.CODIGO_CARGO%TYPE,
                                    PTY_FECHA_INICIALI          IN VACANTES.FECHA_INICIAL%TYPE,
                                    PTY_FECHA_FINALI            IN VACANTES.FECHA_FINAL%TYPE,
                                    PTY_DESCRI_VACANTEI         IN VACANTES.DESCRI_VACANTE%TYPE,
                                    PTY_HABILIDADES_REQI        IN VACANTES.HABILIDADES_REQ%TYPE,
                                    PTY_ACTI_REALIZAI           IN VACANTES.ACTI_REALIZA%TYPE,
                                    PTY_JORNADA_LABORALI        IN VACANTES.JORNADA_LABORAL%TYPE,
                                    PTY_TIPO_EMPLEOI            IN VACANTES.TIPO_EMPLEO%TYPE,
                                    PTY_RANGO_SALARIALI         IN VACANTES.RANGO_SALARIAL%TYPE,
                                    PTY_CANTIDAD_VACANTEI       IN VACANTES.CANTIDAD_VACANTE%TYPE,
                                    PTY_EXPERIENCIA_MINIMAI     IN VACANTES.EXPERIENCIA_MINIMA%TYPE,
                                    PTY_IDIOMA_REQUERIDOI       IN VACANTES.IDIOMA_REQUERIDO%TYPE,
                                    PTY_NIVEL_ESTUDIOI          IN VACANTES.NIVEL_ESTUDIO%TYPE,
                                    PTY_DISPONIBLE_VIAJEI       IN VACANTES.DISPONIBLE_VIAJE%TYPE,
                                    PTY_ACEPTA_DISCAPACIDADI    IN VACANTES.ACEPTA_DISCAPACIDAD%TYPE,
                                    PTY_COD_CIUDADI             IN VACANTES.COD_CIUDAD%TYPE,
                                    PTY_ESTADOI                 IN VACANTES.ESTADO%TYPE,
                                    PTY_PROFESIONI              IN VACANTES.PROFESION%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI  IN VACANTES.PROFESION_COMPLEMENTO%TYPE,
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
         PVH_MENSAJEO := 'El codigo de la vacante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_VACANTES_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                PTY_CODIGOI,     
                                                PTY_CODIGO_CARGOI         ,
                                                PTY_FECHA_INICIALI        ,
                                                PTY_FECHA_FINALI          ,
                                                PTY_DESCRI_VACANTEI       ,
                                                PTY_HABILIDADES_REQI      ,
                                                PTY_ACTI_REALIZAI         ,
                                                PTY_JORNADA_LABORALI      ,
                                                PTY_TIPO_EMPLEOI          ,
                                                PTY_RANGO_SALARIALI       ,
                                                PTY_CANTIDAD_VACANTEI     ,
                                                PTY_EXPERIENCIA_MINIMAI   ,
                                                PTY_IDIOMA_REQUERIDOI     ,
                                                PTY_NIVEL_ESTUDIOI        ,
                                                PTY_DISPONIBLE_VIAJEI     ,
                                                PTY_ACEPTA_DISCAPACIDADI  ,
                                                PTY_COD_CIUDADI           ,
                                                PTY_ESTADOI               ,
                                                PTY_PROFESIONI            ,
                                                PTY_PROFESION_COMPLEMENTOI,
                                                PNB_RESULTADOO,
                                                PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_VACANTES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la vacante no puede ser null';
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
               'Se present? un error en CA_VACANTES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN VACANTES.COD_EMPRESA%TYPE,
                                PTY_CODIGOI                 IN VACANTES.CODIGO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El c?digo de la empresa no puede ser null';
         ELSIF PTY_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo dela vacante no puede ser null';
      ELSE
         VBO_EXISTE := AD_VACANTES_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_CODIGOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_VACANTES_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_VACANTES_PKG;
/
