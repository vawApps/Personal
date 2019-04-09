CREATE OR REPLACE PACKAGE AD_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2);
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2);
  /*************************************************************/
  FUNCTION EXISTE_REGISTRO_F(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                             PVH_MENSAJEO OUT VARCHAR2) RETURN BOOLEAN;
  /*************************************************************/
END AD_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY AD_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2) IS
  BEGIN
  
    OPEN PRF_REGISTROO FOR
      SELECT CODIGO, DESCRIPCION, TIPO, COD_PADRE FROM DEPARTAMENTOS; /* Formatted on 06/09/2018 12:04:37 (QP5 v5.252.13127.32847) */
    PNB_RESULTADOO := 1;
  
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se presento un error en AD_DEPARTAMENTOS_PKG.CONSULTAR_DEPARTAMENTO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_DEPARTAMENTO_P;
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2) IS
  BEGIN
  
    OPEN PRF_REGISTROO FOR
      SELECT CODIGO, DESCRIPCION, TIPO, COD_PADRE
        FROM DEPARTAMENTOS
       WHERE COD_PADRE = PTY_COD_PADREI;
    PNB_RESULTADOO := 1;
  
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se presento un error en AD_DEPARTAMENTOS_PKG.CONSULTAR_MUNICIPIO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_MUNICIPIO_P;
  /*************************************************************/
  FUNCTION EXISTE_REGISTRO_F(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                             PVH_MENSAJEO OUT VARCHAR2) RETURN BOOLEAN IS
  
    CURSOR CUR_EXISTE_REGISTRO IS
      SELECT COUNT(1) FROM DEPARTAMENTOS WHERE CODIGO = PTY_CODIGOI;
  
    VBO_EXISTE_REGISTRO BOOLEAN := TRUE;
    VNB_CONTEO          NUMBER;
  
  BEGIN
  
    OPEN CUR_EXISTE_REGISTRO;
    FETCH CUR_EXISTE_REGISTRO
      INTO VNB_CONTEO;
    IF VNB_CONTEO < 1 THEN
      VBO_EXISTE_REGISTRO := FALSE;
    END IF;
    CLOSE CUR_EXISTE_REGISTRO;
  
    RETURN VBO_EXISTE_REGISTRO;
  EXCEPTION
    WHEN OTHERS THEN
      PVH_MENSAJEO := 'Se present? un error en AD_DEPARTAMENTOS_PKG.EXISTE_REGISTRO_F ' ||
                      SQLCODE || ' - ' || SQLERRM;
  END EXISTE_REGISTRO_F;
  /*************************************************************/
END AD_DEPARTAMENTOS_PKG;
/
