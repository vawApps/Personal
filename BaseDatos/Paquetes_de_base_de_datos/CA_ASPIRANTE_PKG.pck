CREATE OR REPLACE PACKAGE CA_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI               IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI                 IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_TIPO_DOCUMENTOI            IN ASPIRANTE.TIPO_DOCUMENTO%TYPE,
                                  PTY_NOMBREI                    IN ASPIRANTE.NOMBRE%TYPE,
                                  PTY_APELLIDOI                  IN ASPIRANTE.APELLIDO%TYPE,
                                  PTY_GENEROI                    IN ASPIRANTE.GENERO%TYPE,
                                  PTY_FECHA_NACIMIENTOI          IN ASPIRANTE.FECHA_NACIMIENTO%TYPE,
                                  PTY_DIRECCIONI                 IN ASPIRANTE.DIRECCION%TYPE,
                                  PTY_TELEFONOI                  IN ASPIRANTE.TELEFONO%TYPE,
                                  PTY_CELULARI                   IN ASPIRANTE.CELULAR%TYPE,
                                  PTY_ESTADO_CIVILI              IN ASPIRANTE.ESTADO_CIVIL%TYPE,
                                  PTY_CORREO_ELECTRONICOI        IN ASPIRANTE.CORREO_ELECTRONICO%TYPE,
                                  PTY_DISCAPACIDADI              IN ASPIRANTE.DISCAPACIDAD%TYPE,
                                  PTY_SALARIO_ASPIRAI            IN ASPIRANTE.SALARIO_ASPIRA%TYPE,
                                  PTY_PROFESIONI                 IN ASPIRANTE.PROFESION%TYPE,
                                  PTY_VIAJAI                     IN ASPIRANTE.VIAJA%TYPE,
                                  PTY_FECHA_INSCRIPCIONI         IN ASPIRANTE.FECHA_INSCRIPCION%TYPE,
                                  PTY_CODIGO_VACANTEI            IN ASPIRANTE.CODIGO_VACANTE%TYPE,
                                  PTY_CODIGO_FORMULARIOI         IN ASPIRANTE.CODIGO_FORMULARIO%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI     IN ASPIRANTE.PROFESION_COMPLEMENTO%TYPE,
                                  PTY_FORMULARIO_PRUEBA_CODIGOI  IN ASPIRANTE.FORMULARIO_PRUEBA_CODIGO%TYPE,
                                  PTY_CIUD_NACII                 IN ASPIRANTE.CIUD_NACI%TYPE,
                                  PTY_CIUD_ACTUALI               IN ASPIRANTE.CIUD_ACTUAL%TYPE,
                                  PNB_RESULTADOO                 OUT NUMBER,
                                  PVH_MENSAJEO                   OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI               IN ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_DOCUMENTOI                 IN ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_TIPO_DOCUMENTOI            IN ASPIRANTE.TIPO_DOCUMENTO%TYPE,
                                    PTY_NOMBREI                    IN ASPIRANTE.NOMBRE%TYPE,
                                    PTY_APELLIDOI                  IN ASPIRANTE.APELLIDO%TYPE,
                                    PTY_GENEROI                    IN ASPIRANTE.GENERO%TYPE,
                                    PTY_FECHA_NACIMIENTOI          IN ASPIRANTE.FECHA_NACIMIENTO%TYPE,
                                    PTY_DIRECCIONI                 IN ASPIRANTE.DIRECCION%TYPE,
                                    PTY_TELEFONOI                  IN ASPIRANTE.TELEFONO%TYPE,
                                    PTY_CELULARI                   IN ASPIRANTE.CELULAR%TYPE,
                                    PTY_ESTADO_CIVILI              IN ASPIRANTE.ESTADO_CIVIL%TYPE,
                                    PTY_CORREO_ELECTRONICOI        IN ASPIRANTE.CORREO_ELECTRONICO%TYPE,
                                    PTY_DISCAPACIDADI              IN ASPIRANTE.DISCAPACIDAD%TYPE,
                                    PTY_SALARIO_ASPIRAI            IN ASPIRANTE.SALARIO_ASPIRA%TYPE,
                                    PTY_PROFESIONI                 IN ASPIRANTE.PROFESION%TYPE,
                                    PTY_VIAJAI                     IN ASPIRANTE.VIAJA%TYPE,
                                    PTY_FECHA_INSCRIPCIONI         IN ASPIRANTE.FECHA_INSCRIPCION%TYPE,
                                    PTY_CODIGO_VACANTEI            IN ASPIRANTE.CODIGO_VACANTE%TYPE,
                                    PTY_CODIGO_FORMULARIOI         IN ASPIRANTE.CODIGO_FORMULARIO%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI     IN ASPIRANTE.PROFESION_COMPLEMENTO%TYPE,
                                    PTY_FORMULARIO_PRUEBA_CODIGOI  IN ASPIRANTE.FORMULARIO_PRUEBA_CODIGO%TYPE,
                                    PTY_CIUD_NACII                 IN ASPIRANTE.CIUD_NACI%TYPE,
                                    PTY_CIUD_ACTUALI               IN ASPIRANTE.CIUD_ACTUAL%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2);

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2);
                                
   /*************************************************************/
END CA_ASPIRANTE_PKG;
/
CREATE OR REPLACE PACKAGE BODY CA_ASPIRANTE_PKG
AS
   /*************************************************************/
   PROCEDURE INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI               IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI                 IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PTY_TIPO_DOCUMENTOI            IN ASPIRANTE.TIPO_DOCUMENTO%TYPE,
                                  PTY_NOMBREI                    IN ASPIRANTE.NOMBRE%TYPE,
                                  PTY_APELLIDOI                  IN ASPIRANTE.APELLIDO%TYPE,
                                  PTY_GENEROI                    IN ASPIRANTE.GENERO%TYPE,
                                  PTY_FECHA_NACIMIENTOI          IN ASPIRANTE.FECHA_NACIMIENTO%TYPE,
                                  PTY_DIRECCIONI                 IN ASPIRANTE.DIRECCION%TYPE,
                                  PTY_TELEFONOI                  IN ASPIRANTE.TELEFONO%TYPE,
                                  PTY_CELULARI                   IN ASPIRANTE.CELULAR%TYPE,
                                  PTY_ESTADO_CIVILI              IN ASPIRANTE.ESTADO_CIVIL%TYPE,
                                  PTY_CORREO_ELECTRONICOI        IN ASPIRANTE.CORREO_ELECTRONICO%TYPE,
                                  PTY_DISCAPACIDADI              IN ASPIRANTE.DISCAPACIDAD%TYPE,
                                  PTY_SALARIO_ASPIRAI            IN ASPIRANTE.SALARIO_ASPIRA%TYPE,
                                  PTY_PROFESIONI                 IN ASPIRANTE.PROFESION%TYPE,
                                  PTY_VIAJAI                     IN ASPIRANTE.VIAJA%TYPE,
                                  PTY_FECHA_INSCRIPCIONI         IN ASPIRANTE.FECHA_INSCRIPCION%TYPE,
                                  PTY_CODIGO_VACANTEI            IN ASPIRANTE.CODIGO_VACANTE%TYPE,
                                  PTY_CODIGO_FORMULARIOI         IN ASPIRANTE.CODIGO_FORMULARIO%TYPE,
                                  PTY_PROFESION_COMPLEMENTOI     IN ASPIRANTE.PROFESION_COMPLEMENTO%TYPE,
                                  PTY_FORMULARIO_PRUEBA_CODIGOI  IN ASPIRANTE.FORMULARIO_PRUEBA_CODIGO%TYPE,
                                  PTY_CIUD_NACII                 IN ASPIRANTE.CIUD_NACI%TYPE,
                                  PTY_CIUD_ACTUALI               IN ASPIRANTE.CIUD_ACTUAL%TYPE,
                                  PNB_RESULTADOO                 OUT NUMBER,
                                  PVH_MENSAJEO                   OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TIPO_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El tipo de documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_NOMBREI IS NULL
      THEN
         PVH_MENSAJEO := 'El nombre del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_APELLIDOI IS NULL
      THEN
         PVH_MENSAJEO := 'El apellido del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_GENEROI IS NULL
      THEN
         PVH_MENSAJEO := 'El genero del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_NACIMIENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha de nacimiento del aspirante no pueden ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DIRECCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La direccion del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_TELEFONOI IS NULL
      THEN
         PVH_MENSAJEO := 'El telefono del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CELULARI IS NULL
      THEN
         PVH_MENSAJEO := 'El celular del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_ESTADO_CIVILI IS NULL
      THEN
         PVH_MENSAJEO := 'El estado civil del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CORREO_ELECTRONICOI IS NULL
      THEN
         PVH_MENSAJEO := 'El correo electronico del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DISCAPACIDADI IS NULL
      THEN
         PVH_MENSAJEO := 'La discapacidad del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_SALARIO_ASPIRAI IS NULL
      THEN
         PVH_MENSAJEO := 'El salario aspirado no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La profesion del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_VIAJAI IS NULL
      THEN
         PVH_MENSAJEO := 'La disponibilidad de viaje del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FECHA_INSCRIPCIONI IS NULL
      THEN
         PVH_MENSAJEO := 'La fecha de inscripcion del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGO_VACANTEI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la de la vacante del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CODIGO_FORMULARIOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_PROFESION_COMPLEMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'La profecion completa del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_FORMULARIO_PRUEBA_CODIGOI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo del formulario prueba del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CIUD_NACII IS NULL
      THEN
         PVH_MENSAJEO := 'La ciudad de nacimiento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_CIUD_ACTUALI IS NULL
      THEN
         PVH_MENSAJEO := 'La ciudad actual del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_PKG.INSERTAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                               PTY_DOCUMENTOI,                
                                               PTY_TIPO_DOCUMENTOI,           
                                               PTY_NOMBREI,                   
                                               PTY_APELLIDOI,                 
                                               PTY_GENEROI,                   
                                               PTY_FECHA_NACIMIENTOI,         
                                               PTY_DIRECCIONI,                
                                               PTY_TELEFONOI,                 
                                               PTY_CELULARI,                  
                                               PTY_ESTADO_CIVILI,             
                                               PTY_CORREO_ELECTRONICOI,       
                                               PTY_DISCAPACIDADI,             
                                               PTY_SALARIO_ASPIRAI,           
                                               PTY_PROFESIONI,                
                                               PTY_VIAJAI,                    
                                               PTY_FECHA_INSCRIPCIONI,        
                                               PTY_CODIGO_VACANTEI,           
                                               PTY_CODIGO_FORMULARIOI,        
                                               PTY_PROFESION_COMPLEMENTOI,    
                                               PTY_FORMULARIO_PRUEBA_CODIGOI, 
                                               PTY_CIUD_NACII,                
                                               PTY_CIUD_ACTUALI,              
                                               PNB_RESULTADOO,
                                               PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_PKG.INSERTAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END INSERTAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI               IN ASPIRANTE.COD_EMPRESA%TYPE,
                                    PTY_DOCUMENTOI                 IN ASPIRANTE.DOCUMENTO%TYPE,
                                    PTY_TIPO_DOCUMENTOI            IN ASPIRANTE.TIPO_DOCUMENTO%TYPE,
                                    PTY_NOMBREI                    IN ASPIRANTE.NOMBRE%TYPE,
                                    PTY_APELLIDOI                  IN ASPIRANTE.APELLIDO%TYPE,
                                    PTY_GENEROI                    IN ASPIRANTE.GENERO%TYPE,
                                    PTY_FECHA_NACIMIENTOI          IN ASPIRANTE.FECHA_NACIMIENTO%TYPE,
                                    PTY_DIRECCIONI                 IN ASPIRANTE.DIRECCION%TYPE,
                                    PTY_TELEFONOI                  IN ASPIRANTE.TELEFONO%TYPE,
                                    PTY_CELULARI                   IN ASPIRANTE.CELULAR%TYPE,
                                    PTY_ESTADO_CIVILI              IN ASPIRANTE.ESTADO_CIVIL%TYPE,
                                    PTY_CORREO_ELECTRONICOI        IN ASPIRANTE.CORREO_ELECTRONICO%TYPE,
                                    PTY_DISCAPACIDADI              IN ASPIRANTE.DISCAPACIDAD%TYPE,
                                    PTY_SALARIO_ASPIRAI            IN ASPIRANTE.SALARIO_ASPIRA%TYPE,
                                    PTY_PROFESIONI                 IN ASPIRANTE.PROFESION%TYPE,
                                    PTY_VIAJAI                     IN ASPIRANTE.VIAJA%TYPE,
                                    PTY_FECHA_INSCRIPCIONI         IN ASPIRANTE.FECHA_INSCRIPCION%TYPE,
                                    PTY_CODIGO_VACANTEI            IN ASPIRANTE.CODIGO_VACANTE%TYPE,
                                    PTY_CODIGO_FORMULARIOI         IN ASPIRANTE.CODIGO_FORMULARIO%TYPE,
                                    PTY_PROFESION_COMPLEMENTOI     IN ASPIRANTE.PROFESION_COMPLEMENTO%TYPE,
                                    PTY_FORMULARIO_PRUEBA_CODIGOI  IN ASPIRANTE.FORMULARIO_PRUEBA_CODIGO%TYPE,
                                    PTY_CIUD_NACII                 IN ASPIRANTE.CIUD_NACI%TYPE,
                                    PTY_CIUD_ACTUALI               IN ASPIRANTE.CIUD_ACTUAL%TYPE,
                                    PNB_RESULTADOO              OUT NUMBER,
                                    PVH_MENSAJEO                OUT VARCHAR2)
                                    
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         PNB_RESULTADOO := 0;
      ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
         PNB_RESULTADOO := 0;
      ELSE
         AD_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P (PTY_COD_EMPRESAI,
                                                PTY_DOCUMENTOI,               
                                                PTY_TIPO_DOCUMENTOI,          
                                                PTY_NOMBREI,                  
                                                PTY_APELLIDOI,                
                                                PTY_GENEROI,                  
                                                PTY_FECHA_NACIMIENTOI,        
                                                PTY_DIRECCIONI,               
                                                PTY_TELEFONOI,                
                                                PTY_CELULARI,                 
                                                PTY_ESTADO_CIVILI,            
                                                PTY_CORREO_ELECTRONICOI,      
                                                PTY_DISCAPACIDADI,            
                                                PTY_SALARIO_ASPIRAI,          
                                                PTY_PROFESIONI,               
                                                PTY_VIAJAI,                   
                                                PTY_FECHA_INSCRIPCIONI,       
                                                PTY_CODIGO_VACANTEI,          
                                                PTY_CODIGO_FORMULARIOI,       
                                                PTY_PROFESION_COMPLEMENTOI,   
                                                PTY_FORMULARIO_PRUEBA_CODIGOI,
                                                PTY_CIUD_NACII,               
                                                PTY_CIUD_ACTUALI,             
                                                PNB_RESULTADOO,
                                                PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_PKG.ACTUALIZAR_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END ACTUALIZAR_REGISTRO_P;

   /*************************************************************/
   PROCEDURE CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                  PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                  PRF_REGISTROO               OUT SYS_REFCURSOR,
                                  PNB_RESULTADOO              OUT NUMBER,
                                  PVH_MENSAJEO                OUT VARCHAR2)
                                  
   IS
   
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
      ELSE
         AD_VACANTES_PKG.CONSULTAR_REGISTO_P (PTY_COD_EMPRESAI,
                                              PTY_DOCUMENTOI,
                                              PRF_REGISTROO,
                                              PNB_RESULTADOO,
                                              PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PNB_RESULTADOO := 0;
         PVH_MENSAJEO :=
               'Se present? un error en CA_ASPIRANTE_PKG.CONSULTAR_REGISTO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END CONSULTAR_REGISTO_P;

   /*************************************************************/
   PROCEDURE EXISTE_REGISTRO_P (PTY_COD_EMPRESAI            IN ASPIRANTE.COD_EMPRESA%TYPE,
                                PTY_DOCUMENTOI              IN ASPIRANTE.DOCUMENTO%TYPE,
                                PVH_MENSAJEO                OUT VARCHAR2)
   IS
      VBO_EXISTE   BOOLEAN := FALSE;
   BEGIN
      IF PTY_COD_EMPRESAI IS NULL
      THEN
         PVH_MENSAJEO := 'El codigo de la empresa no puede ser null';
         ELSIF PTY_DOCUMENTOI IS NULL
      THEN
         PVH_MENSAJEO := 'El documento del aspirante no puede ser null';
      ELSE
         VBO_EXISTE := AD_ASPIRANTE_PKG.EXISTE_REGISTRO_F (PTY_COD_EMPRESAI,PTY_DOCUMENTOI, PVH_MENSAJEO);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         PVH_MENSAJEO :=
               'Se presento un error en CA_ASPIRANTE_PKG.EXISTE_REGISTRO_P '
            || SQLCODE
            || ' - '
            || SQLERRM;
   END EXISTE_REGISTRO_P;
   /*************************************************************/
END CA_ASPIRANTE_PKG;
/
