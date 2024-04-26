*:*********************************************************************
*:
*:        Program: CEMPL1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/23/91     17:38
*:
*:      Called by: CEMPL.PRG                     
*:
*:          Calls: MEMPL.PRG
*:               : EXISTE         (procedure in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:               : ELIJN()        (function  in PROCESOS.PRG)
*:               : SINO()         (function  in PROCESOS.PRG)
*:               : SINOS()        (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:58               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: CEMPL1.PRG
*-- Fecha   : 03/11/90 / 20:29:05
*-- Version : G. REINER - GENERADOR
*-- Notas   : CORRECCION DE DATOS PERSONALES DE LOS EMPLEADOS
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
sigue=.T.
STORE SPACE(30) TO m->apy
SCATTER MEMVAR
DO mempl WITH "Correcci¢n"
me1='Correcci¢n Datos Personales'
@ 1,24 GET m->legajo;
   PICTURE "NNNNNNNNNN";
   MESS me1+"- [ESC] para Men£"
READ
IF LASTKEY()<>27
   IF LEN(ALLTRIM(m->legajo))<>0 .AND. LEFT("0000000000",LEN(ALLTRIM(m->legajo)))<>m->legajo
      m->legajo=UPPER(m->legajo)
      IF legajo<>m->legajo
         SET DELE OFF
         SEEK ALLTRIM(m->legajo)
         SET DELE ON
         IF FOUND()  .AND. emp->jan=m->jan
            ACTI SCREEN
            @ 24,0 SAY PADC("N§ de Legajo "+ALLTRIM(m->legajo)+' existe - Enter para continuar',80,' ')
            ACTI WIND win
            DO existe WITH " N§ de Legajo"
            DO WHILE INKEY()=0
            ENDDO
            CLEAR
            sigue=.F.
         ENDIF
      ENDIF
   ELSE
      sigue=.F.
   ENDIF
   IF sigue
      @ 2,24 GET m->apynom;
         PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
         MESS me1+"- Apellido del Empleado"
      @ 3,24 GET m->apy;
         PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
         MESS me1+"- Nombre del Empleado"
      @ 4,24 GET m->domicilio;
         PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
         MESS me1+"- Domicilio del Empleado"
      @ 5,24 GET m->localidad;
         PICTURE "XXXXXXXXXXXXXXXXXXXX";
         MESS me1+"- Localidad"
      @ 6,24 GET m->telefono;
         PICTURE "XXXXXXXXXXXXXXX";
         MESS me1+"- Tel‚fono"
      pct=tdoc[M->TIPODOC]
      @ 7,24 GET pct;
         MESS me1+' [TECLA] y [ENTER] para Corregir'
      READ
      IF pct<>tdoc[M->TIPODOC]
         ACTI SCREEN
         @ 1,60 MENU tdoc,5 TITL ' Tipo de Documento ' SHADOW
         respuesta=0
         DO WHILE respuesta=0
            READ MENU TO respuesta
         ENDDO
         m->tipodoc=respuesta
         ACTI WIND win
         @ 7,24 GET tdoc[m->tipodoc]
         CLEAR GETS
      ENDIF
      @ 7,40 GET m->nrodoc;
         PICTURE "99.999.999";
         MESS me1+"- N§ de Documento"
      @ 8,24 GET m->fechanac;
         PICTURE '@D';
         MESS me1+"- Fecha de Nacimiento"
      DO WHILE .T.
         @ 9,24 GET m->fechaing;
            PICTURE '@D';
            MESS me1+"- Fecha de Ingreso en la Empresa"
         @ 9,45 GET m->fechaani;
            PICT '@D';
            MESS me1+"- Fecha para C lculo de Antigedad"
         READ
         IF m->fechaani<=DATE() .AND. m->fechaing<=DATE()
            EXIT
         ENDIF
      ENDDO
      @ 10,24 GET m->nujub;
         PICTURE "XXXXXXXXXXXXXXXXXXXX";
         MESS me1+"- N§ de la Caja de Jubilaci¢n"
      @ 11,24 GET m->nacion;
         PICTURE "!!!";
         MESS me1+"- Nacionalidad"
      @ 12,24 GET m->puntaje;
         PICTURE "999";
         MESS me1+"- Puntaje"
      GOTO m->ccos IN ccos
      pct=ccos->cencos
      @ 13,24 GET pct;
         MESS me1+' [TECLA] y [ENTER] para Corregir'
      READ
      IF ccos->cencos<>pct
         respuesta=0
         DO WHILE eliccos(' del Empleado')=0
         ENDDO
         GOTO respuesta
         ACTI WINDOW win
         @ 13,24 GET ccos->cencos
         CLEAR GETS
         m->ccos=respuesta
         SELE emp
      ENDIF
      GOTO m->con IN con
      pct=con->convenio
      @ 14,24 GET pct;
         MESS me1+' [TECLA] y [ENTER] para Corregir'
      READ
      IF con->convenio<>pct
         respuesta=0
         DO WHILE elicon(' del Empleado')=0
         ENDDO
         GOTO respuesta
         ACTI WINDOW win
         @ 14,24 GET con->convenio
         CLEAR GETS
         m->con=respuesta
         SELE emp
      ENDIF
      GOTO m->cat IN cat
      pct=cat->categoria
      @ 15,24 GET pct;
         MESS me1+' [TECLA] y [ENTER] para Corregir'
      READ
      IF cat->categoria<>pct
         respuesta=0
         SELE cat
         SET FILTER TO cat->convenio=m->con
         DO WHILE elicat(' del Empleado')=0
         ENDDO
         GOTO respuesta
         ACTI WINDOW win
         @ 15,24 GET cat->categoria
         CLEAR GETS
         m->cat=respuesta
         SELE cat
         SET FILTER TO
         SELE emp
      ENDIF
      GOTO m->esp IN esp
      pct=esp->especiali
      @ 16,24 GET pct;
         MESS me1+' [TECLA] y [ENTER] para Corregir'
      READ
      IF esp->especiali<>pct
         respuesta=0
         SELE esp
         DO WHILE eliesp(' del Empleado')=0
         ENDDO
         GOTO respuesta
         ACTI WINDOW win
         @ 16,24 GET esp->especiali
         CLEAR GETS
         m->esp=respuesta
         SELE emp
      ENDIF
      GOTO m->jan IN jan
      pct=LEFT(jan->empresa,30)
      @ 17,24 GET pct;
         MESS me1+' [TECLA] y [ENTER] para Corregir'
      READ
      IF jan->empresa<>pct
         respuesta=0
         DO WHILE elijn(' del Empleado')=0
         ENDDO
         GOTO respuesta
         ACTI WINDOW win
         @ 17,24 GET jan->empresa
         CLEAR GETS
         m->jan=respuesta
      ENDIF
      lq=IIF(noliq,"SI","NO")
      fu=sino(m->noliq)
      @ 18,24 GET lq PICTURE fu;
         MESS 'Incluye Empleado en la Liquidaci¢n ?'
      SELE emp
      f1=sinos(m->pagsal)
      @ 18,50 GET m->pagsal PICTURE f1;
         MESS 'Paga Salario Familiar al Empleado ?'
      READ
      m->apynom=ALLTRIM(UPPER(m->apynom))+' '+PROPER(m->apy)
      m->noliq=lq="SI"
      GOTO ff
      GATHER MEMVAR
   ENDIF
ENDIF
RELE WIND win
RELE legajo,apynom,domicilio,localidad,telefono,tipodoc,nrodoc,fechanac,fechaing,fechaegr,nujub,nacion,puntaje,noliq,ccos,cat,CONV,jan,texto,me1,apy,pct,fu,esp,f1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: CEMPL1.PRG
