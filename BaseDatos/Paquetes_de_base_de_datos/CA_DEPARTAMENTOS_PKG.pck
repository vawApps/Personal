CREATE OR REPLACE PACKAGE CA_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2);

  /*************************************************************/
  PROCEDURE EXISTE_REGISTRO_P(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                              PVH_MENSAJEO OUT VARCHAR2);
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2);
  /*************************************************************/

END CA_DEPARTAMENTOS_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_DEPARTAMENTOS_PKG AS
  /*************************************************************/
  PROCEDURE CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO  OUT SYS_REFCURSOR,
                                     PNB_RESULTADOO OUT NUMBER,
                                     PVH_MENSAJEO   OUT VARCHAR2)
  
   IS
  
  BEGIN
  
    AD_DEPARTAMENTOS_PKG.CONSULTAR_DEPARTAMENTO_P(PRF_REGISTROO,
                                                  PNB_RESULTADOO,
                                                  PVH_MENSAJEO);
  
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se present? un error en CA_DEPARTAMENTOS_PKG.CONSULTAR_DEPARTAMENTO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_DEPARTAMENTO_P;
  /*************************************************************/
  PROCEDURE CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI IN DEPARTAMENTOS.COD_PADRE%TYPE,
                                  PRF_REGISTROO  OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO OUT NUMBER,
                                  PVH_MENSAJEO   OUT VARCHAR2) IS
  
  BEGIN
  
    IF PTY_COD_PADREI IS NULL THEN
      PVH_MENSAJEO := 'El codigo del departamento no puede ser null';
    ELSE
      AD_DEPARTAMENTOS_PKG.CONSULTAR_MUNICIPIO_P(PTY_COD_PADREI,
                                                 PRF_REGISTROO,
                                                 PNB_RESULTADOO,
                                                 PVH_MENSAJEO);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      PNB_RESULTADOO := 0;
      PVH_MENSAJEO   := 'Se present? un error en CA_DEPARTAMENTOS_PKG.CONSULTAR_MUNICIPIO_P ' ||
                        SQLCODE || ' - ' || SQLERRM;
  END CONSULTAR_MUNICIPIO_P;
  /*************************************************************/
  PROCEDURE EXISTE_REGISTRO_P(PTY_CODIGOI  IN DEPARTAMENTOS.CODIGO%TYPE,
                              PVH_MENSAJEO OUT VARCHAR2) IS
    VBO_EXISTE BOOLEAN := FALSE;
  BEGIN
    IF PTY_CODIGOI IS NULL THEN
      PVH_MENSAJEO := 'El codigo del departamento no puede ser null';
    ELSE
      VBO_EXISTE := AD_DEPARTAMENTOS_PKG.EXISTE_REGISTRO_F(PTY_CODIGOI,
                                                           PVH_MENSAJEO);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      PVH_MENSAJEO := 'Se present? un error en CA_DEPARTAMENTOS_PKG.EXISTE_REGISTRO_P ' ||
                      SQLCODE || ' - ' || SQLERRM;
  END EXISTE_REGISTRO_P;
  /*************************************************************/
END CA_DEPARTAMENTOS_PKG;
/
