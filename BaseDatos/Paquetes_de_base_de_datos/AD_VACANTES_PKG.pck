CREATE OR REPLACE PACKAGE AD_VACANTES_PKG
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
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

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
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_VACANTES_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_VACANTES_PKG
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
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      INSERT INTO VACANTES VALUES (PTY_CODIGOI,PTY_CODIGO_CARGOI,PTY_FECHA_INICIALI,
                                   PTY_FECHA_FINALI,PTY_DESCRI_VACANTEI,PTY_HABILIDADES_REQI,PTY_ACTI_REALIZAI,
                                   PTY_JORNADA_LABORALI,PTY_TIPO_EMPLEOI,PTY_RANGO_SALARIALI,PTY_CANTIDAD_VACANTEI,
                                   PTY_EXPERIENCIA_MINIMAI,PTY_IDIOMA_REQUERIDOI,PTY_NIVEL_ESTUDIOI,PTY_DISPONIBLE_VIAJEI,
                                   PTY_ACEPTA_DISCAPACIDADI,PTY_COD_CIUDADI,PTY_ESTADOI,PTY_PROFESIONI,
                                   PTY_PROFESION_COMPLEMENTOI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
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
                                    PNB_RESULTADOO   OUT NUMBER,
                                    PVH_MENSAJEO     OUT VARCHAR2)
   IS

   BEGIN
      UPDATE VACANTES
         SET CODIGO_CARGO          = NVL (PTY_CODIGO_CARGOI         , CODIGO_CARGO         ),
             FECHA_INICIAL         = NVL (PTY_FECHA_INICIALI        , FECHA_INICIAL        ),
             FECHA_FINAL           = NVL (PTY_FECHA_FINALI          , FECHA_FINAL          ),
             DESCRI_VACANTE        = PTY_DESCRI_VACANTEI       ,
             HABILIDADES_REQ       = NVL (PTY_HABILIDADES_REQI      , HABILIDADES_REQ      ),
             ACTI_REALIZA          = NVL (PTY_ACTI_REALIZAI         , ACTI_REALIZA         ),
             JORNADA_LABORAL       = NVL (PTY_JORNADA_LABORALI      , JORNADA_LABORAL      ),
             TIPO_EMPLEO           = NVL (PTY_TIPO_EMPLEOI          , TIPO_EMPLEO          ),
             RANGO_SALARIAL        = NVL (PTY_RANGO_SALARIALI       , RANGO_SALARIAL       ),
             CANTIDAD_VACANTE      = NVL (PTY_CANTIDAD_VACANTEI     , CANTIDAD_VACANTE     ),
             EXPERIENCIA_MINIMA    = NVL (PTY_EXPERIENCIA_MINIMAI   , EXPERIENCIA_MINIMA   ),
             IDIOMA_REQUERIDO      = NVL (PTY_IDIOMA_REQUERIDOI     , IDIOMA_REQUERIDO     ),
             NIVEL_ESTUDIO         = NVL (PTY_NIVEL_ESTUDIOI        , NIVEL_ESTUDIO        ),
             DISPONIBLE_VIAJE      = NVL (PTY_DISPONIBLE_VIAJEI     , DISPONIBLE_VIAJE     ),
             ACEPTA_DISCAPACIDAD   = NVL (PTY_ACEPTA_DISCAPACIDADI  , ACEPTA_DISCAPACIDAD  ),
             COD_CIUDAD            = NVL (PTY_COD_CIUDADI           , COD_CIUDAD           ),
             ESTADO                = NVL (PTY_ESTADOI               , ESTADO               ),
             PROFESION             = NVL (PTY_PROFESIONI            , PROFESION            ),
             PROFESION_COMPLEMENTO = NVL (PTY_PROFESION_COMPLEMENTOI, PROFESION_COMPLEMENTO)
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           CODIGO_CARGO,         
           FECHA_INICIAL,        
           FECHA_FINAL,          
           DESCRI_VACANTE,       
           HABILIDADES_REQ,      
           ACTI_REALIZA,         
           JORNADA_LABORAL,      
           TIPO_EMPLEO,          
           RANGO_SALARIAL,       
           CANTIDAD_VACANTE,     
           EXPERIENCIA_MINIMA,   
           IDIOMA_REQUERIDO,     
           NIVEL_ESTUDIO,        
           DISPONIBLE_VIAJE,     
           ACEPTA_DISCAPACIDAD,  
           COD_CIUDAD,          
           ESTADO,               
           PROFESION,            
           PROFESION_COMPLEMENTO
     FROM VACANTES
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN VACANTES.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN VACANTES.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM VACANTES
   WHERE COD_EMPRESA = PTY_COD_EMPRESAI
   AND   CODIGO = PTY_CODIGOI;
   
   VBO_EXISTE_REGISTRO BOOLEAN := TRUE;
   VNB_CONTEO NUMBER;
   
   BEGIN
              
   OPEN CUR_EXISTE_REGISTRO;
    FETCH CUR_EXISTE_REGISTRO INTO VNB_CONTEO;
     IF VNB_CONTEO < 1 THEN
        VBO_EXISTE_REGISTRO := FALSE;
     END IF;
     CLOSE CUR_EXISTE_REGISTRO;
        
   
   RETURN VBO_EXISTE_REGISTRO;
      EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en AD_VACANTES_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_VACANTES_PKG;
/
