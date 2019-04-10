CREATE OR REPLACE PACKAGE AD_CONTACTO_PKG
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
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2);

   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN;
/*************************************************************/
END AD_CONTACTO_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_CONTACTO_PKG
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
      INSERT INTO CONTACTO VALUES (PTY_CODIGOI,PTY_COD_VACANTEI,PTY_CONTACTOI,PTY_CORREO_CONTACTOI,
                                   PTY_RECIBE_HV_CORREOI,PTY_TELEFONO_CONTACTOI,PTY_FECHA_ENTREVISTAI,
                                   PTY_LUGAR_ENTREVISTAI,PTY_COD_EMPRESAI);
      COMMIT;
      PNB_RESULTADOO := 1;
   
   EXCEPTION WHEN OTHERS THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_CONTACTO_PKG.INSERTAR_REGISTRO_P ' || SQLCODE || ' - ' || SQLERRM;
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
      UPDATE CONTACTO
         SET COD_VACANTE            = NVL (PTY_COD_VACANTEI           , COD_VACANTE            ),
             CONTACTO               = NVL (PTY_CONTACTOI              , CONTACTO               ),
             CORREO_CONTACTO        = NVL (PTY_CORREO_CONTACTOI       , CORREO_CONTACTO        ),
             RECIBE_HV_CORREO       = NVL (PTY_RECIBE_HV_CORREOI      , RECIBE_HV_CORREO       ),
             TELEFONO_CONTACTO      = NVL (PTY_TELEFONO_CONTACTOI     , TELEFONO_CONTACTO      ),
             FECHA_ENTREVISTA       = NVL (PTY_FECHA_ENTREVISTAI      , FECHA_ENTREVISTA       ),
             LUGAR_ENTREVISTA       = NVL (PTY_LUGAR_ENTREVISTAI      , LUGAR_ENTREVISTA       )
       WHERE COD_EMPRESA = PTY_COD_EMPRESAI
       AND   CODIGO = PTY_CODIGOI;

      COMMIT;
      PNB_RESULTADOO := 1;
      
   EXCEPTION
      WHEN OTHERS
      THEN
      PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se presento un error en AD_CONTACTO_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;
   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                                  PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                                  PRF_REGISTROO    OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO   OUT NUMBER,
                                  PVH_MENSAJEO     OUT VARCHAR2) IS
   BEGIN
   
    OPEN PRF_REGISTROO FOR 
    SELECT COD_EMPRESA,
           CODIGO,
           COD_VACANTE,   
           CONTACTO,         
           CORREO_CONTACTO,  
           RECIBE_HV_CORREO, 
           TELEFONO_CONTACTO,
           FECHA_ENTREVISTA, 
           LUGAR_ENTREVISTA
     FROM CONTACTO
     WHERE COD_EMPRESA = PTY_COD_EMPRESAI
     AND   CODIGO = PTY_CODIGOI;/* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
     PNB_RESULTADOO := 1;
   
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en AD_CONTACTO_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM; 
   END CONSULTAR_REGISTO_P;           
   /*************************************************************/
   FUNCTION EXISTE_REGISTRO_F (PTY_COD_EMPRESAI IN CONTACTO.COD_EMPRESA%TYPE,
                               PTY_CODIGOI      IN CONTACTO.CODIGO%TYPE,
                               PVH_MENSAJEO     OUT VARCHAR2) RETURN BOOLEAN IS 
  
   CURSOR CUR_EXISTE_REGISTRO IS
   SELECT COUNT(1)
   FROM CONTACTO
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
               'Se present? un error en AD_CONTACTO_PKG.EXISTE_REGISTRO_F '
            || SQLCODE
            || ' - '
            || SQLERRM;                     
   END EXISTE_REGISTRO_F;
   /*************************************************************/
END AD_CONTACTO_PKG;
/
