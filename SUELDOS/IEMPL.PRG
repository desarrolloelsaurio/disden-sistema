********************************************************************************
*-- Programa: IEMPL.PRG
*-- Fecha   : 03/11/90 / 20:29:05
*-- Version : G. REINER - GENERADOR
*-- Notas   : INGRESO DE DATOS PERSONALES DE LOS EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLO I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 2,15 TO 22,71 TITL " Empleados - Ingreso Datos Personales " SHAD COLO SCHE 8
SELE emp
me1=" Empleados - Ingreso Datos Personales "
DO WHILE .T.
   STORE .T. TO sigue1
   ACTI WIND win
   SCATTER MEMVAR BLANK
   m.apy=m.apynom
   m.localidad='2000-Rosario        '
   @ 1,1 SAY "Nß de Legajo" COLO SCHE 3
   @ 2,1 SAY "Apellido del Empleado" COLO SCHE 3
   @ 3,1 SAY "Nombre del Empleado" COLO SCHE 3
   @ 4,1 SAY "Domicilio" COLO SCHE 3
   @ 5,1 SAY "Localidad" COLO SCHE 3
   @ 6,1 SAY "TelÇfono" COLO SCHE 3
   @ 7,1 SAY "Tipo de Documento" COLO SCHE 3
   @ 7,33 SAY "Nß" COLO SCHE 3
   @ 8,1 SAY "Fecha de Nacimiento" COLO SCHE 3
   @ 9,1 SAY "Fecha de Ingreso" COLO SCHE 3
   @ 9,33 SAY "Aniversario" COLO SCHE 3
   @ 10,1 SAY "Nß de Jubilaci¢n" COLO SCHE 3
   @ 11,1 SAY "Nacionalidad" COLO SCHE 3
   @ 12,1 SAY "Puntaje" COLO SCHE 3
   @ 13,1 SAY "Centro de Costos" COLO SCHE 3
   @ 15,1 SAY "Categor°a" COLO SCHE 3
   @ 14,1 SAY "Convenio" COLO SCHE 3
   @ 16,1 SAY "Especialidad" COLO SCHE 3
   @ 17,1 SAY "Empresa" COLO SCHE 3
   DO WHILE .T.
      @ 1,24 GET m.legajo;
         PICT "NNNNNNNNNN";
         MESS me1+"- [ENTER] para Men£"
      READ
      IF LEN(ALLTRIM(m.legajo))<>0 .AND. LEFT("0000000000",LEN(ALLTRIM(m.legajo)))<>ALLTRIM(m.legajo)
         m.legajo=UPPER(m.legajo)
         SET DELE OFF
         SET ORDER TO 2
         SEEK ALLTRIM(m.legajo)
         SET DELE ON
         SET ORDER TO ordlis
         IF .NOT. FOUND() .OR. (FOUND() .AND. emp.jan<>jannro)
            @ 2,24 GET m.apynom;
               PICT "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
               MESS me1+"- Apellido del Empleado"
            @ 3,24 GET m.apy;
               PICT "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
               MESS me1+"- Nombre del Empleado"
            @ 4,24 GET m.domicilio;
               PICT "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
               MESS me1+"- Domicilio del Empleado"
            @ 5,24 GET m.localidad;
               PICT "XXXXXXXXXXXXXXXXXXXX";
               MESS me1+"- Localidad"
            @ 6,24 GET m.telefono;
               PICT "XXXXXXXXXXXXXXX";
               MESS me1+"- TelÇfono"
            READ
            ACTI SCREEN
            @ 1,60 MENU tdoc,5 TITL ' Tipo de Documento ' SHAD
            respuesta=0
            DO WHILE respuesta=0
               READ MENU TO respuesta
            ENDDO
            m.tipodoc=respuesta
            ACTI WIND win
            @ 7,24 GET tdoc[m.tipodoc]
            CLEAR GETS
            @ 7,40 GET m.nrodoc;
               PICT "99.999.999";
               MESS me1+"- Nß de Documento"
            @ 8,24 GET m.fechanac;
               PICT '@D';
               MESS me1+"- Fecha de Nacimiento"
            DO WHILE .T.
               @ 9,24 GET m.fechaing;
                  PICT '@D';
                  MESS me1+"- Fecha de Ingreso en la Empresa"
               READ
               m.fechaani=m.fechaing
               @ 9,45 GET m.fechaani;
                  PICT '@D';
                  MESS me1+"- Fecha para C†lculo de AntigÅedad"
               READ
               IF m.fechaani<=DATE() .AND. m.fechaing<=DATE()
                  EXIT
               ENDIF
            ENDDO
            @ 10,24 GET m.nujub;
               PICT "XXXXXXXXXXXXXXXXXXXX";
               MESS me1+"- Nß de la Caja de Jubilaci¢n"
            @ 11,24 GET m.nacion;
               PICT "@!AAA";
               MESS me1+"- Nacionalidad"
            @ 12,24 GET m.puntaje;
               PICT "999";
               MESS me1+"- Puntaje"
            READ
            respuesta=0
            ACTI SCREEN
            m.apynom=ALLTRIM(UPPER(m.apynom))+' '+PROPER(m.apy)
            DO WHILE eliccos(' de '+ALLTRIM(m.apynom))=0
            ENDDO
            GOTO respuesta
            ACTI WINDOW win
            @ 13,24 GET ccos.cencos
            CLEAR GETS
            m.ccos=respuesta
            respuesta=0
            ACTI SCREEN
            DO WHILE elicon(' de '+ALLTRIM(m.apynom))=0
            ENDDO
            GOTO respuesta
            ACTI WINDOW win
            @ 14,24 GET con.convenio
            CLEAR GETS
            m.con=respuesta
            respuesta=0
            SELE cat
            SET FILTER TO cat.convenio=m.con
            DO WHILE elicat(' de '+ALLTRIM(m.apynom))=0
            ENDDO
            GOTO respuesta
            ACTI WINDOW win
            @ 15,24 GET cat.categoria
            CLEAR GETS
            m.cat=respuesta
            SELE cat
            SET FILTER TO
            DO WHILE eliesp(' de '+ALLTRIM(m.apynom))=0
            ENDDO
            GOTO respuesta
            ACTI WINDOW win
            @ 16,24 GET esp.especiali
            CLEAR GETS
            m.esp=respuesta
            SET FILTER TO
            GOTO jannro IN jan
            ACTI WINDOW win
            @ 17,24 GET jan.empresa
            CLEAR GETS
            m.jan=m.jannro
            STORE .T. TO sigue
         ELSE
            ACTI SCREEN
            @ 24,0 SAY PADC("Nß de Legajo "+ALLTRIM(m.legajo)+' existe - Enter para continuar',80,' ')
            ACTI WIND win
            DO existe WITH " Nß de Legajo"
            DO WHILE INKEY()=0
            ENDDO
            STORE .F. TO sigue
            CLEA
            EXIT
         ENDIF
         SELE emp
         IF sigue
            ACTI SCRE
            STORE 'SI' TO respuesta
            @ 24,0 SAY PADC(' Confirma los Datos Ingresados ? ',80,'*') COLO SCHE 19
            DEFINE WINDOW fic FROM 18,0 TO 22,77 DOUBLE TITL ' Confirma los Datos Ingresados ? ' SHADOW COLOR SCHE 8
            ACTI WINDOW fic
            @ 1,10 SAY "Confirma ? " GET respuesta PICTURE '@M SI,NO'
            READ
            RELE WINDOW fic
            ACTI SCRE
            @ 24,0 SAY SPACE(80)
            ACTI WIND win
            IF respuesta='SI'
               SELECT emp
               APPEND BLANK
               GATHER MEMVAR
               REPL emp.noliq WITH .T.
               REPL emp.pagsal WITH 'SI'
               CLEA
               EXIT
            ENDIF
         ENDIF
      ELSE
         STORE .F. TO sigue1
         EXIT
      ENDIF
   ENDDO
   IF .NOT. sigue1
      EXIT
   ENDIF
ENDDO
RELE WIND win
RELE legajo,apynom,domicilio,localidad,telefono,tipodoc,nrodoc,fechanac,fechaing,fechaegr,nujub,nacion,puntaje,noliq,ccos,cat,CONV,jan,texto,me1,apy
@ 24,0 SAY SPACE(80)
RETURN
