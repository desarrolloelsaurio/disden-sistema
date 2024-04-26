*:*********************************************************************
*:
*:        Program: LEMPLP.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPL.PRG                      
*:
*:          Calls: MEMPL.PRG
*:               : LEMPLPP.PRG
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : LEMPLP1.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:               : BUEMPL.PRG
*:
*:      Documented 04/23/91 at 20:52               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: Lemplp.PRG
*-- Fecha   : 10/31/90 09:58pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LOS LISTADOS DE datos personales de empleados por pantalla
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Imprimiendo los Datos Requeridos',80,' ')
dijo=BAR()
DO CASE
CASE BAR()=1
   @ 24,0 SAY PADC('[ESC] para Men£',80,' ')
   SCAN
      SCATTER MEMVAR
      DO mempl WITH 'Muestra'
      DO WHILE INKEY()=0
      ENDDO
      IF LASTKEY()=27
         EXIT
      ENDIF
   ENDSCAN
   IF WEXIST("WIN")
      RELE WIND win
   ENDIF
   RELE legajo,apynom,domicilio,localidad,telefono,tipodoc,nrodoc,fechanac,fechaing,fechaegr,nujub,nacion,puntaje,noliq,ccos,cat,CONV,jan,texto,me1,apy,pct
CASE BAR()=2
   DEFI POPU caca1 FROM 11,40 MESSAGE 'Tipo de Listado' SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca1 PROM ' \<Domicilio y Localidad'
   DEFI BAR 2 OF caca1 PROM ' \<Tel‚fonos'
   DEFI BAR 3 OF caca1 PROM ' Documento de \<Identidad '
   DEFI BAR 4 OF caca1 PROM ' \<Puntaje'
   DEFI BAR 5 OF caca1 PROM ' \<Centros de Costos'
   DEFI BAR 6 OF caca1 PROM ' C\<ategor¡as'
   DEFI BAR 7 OF caca1 PROM ' C\<onvenios'
   DEFI BAR 8 OF caca1 PROM ' \<No Cobran S. Familiar'
   DEFI BAR 9 OF caca1 PROM ' No \<Liquida'
   ON SELE POPU caca1 DO lemplpp
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=3
   SELE ccos
   STORE 0 TO respuesta
   IF eliccos('a Listar')<>0
      GOTO respuesta
      xcos=RECNO()
      SELE emp
      SET ORDER TO ordlis
      MAX=4
      tt='Listado de Empleados - Centro de Costos: '+ALLTRIM(ccos->cencos)
      fisc='EMP->CCOS=XCOS'
      DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
      co[1]='  Legajo  '
      co[2]='      Apellido y Nombre       '
      co[3]='   Categor¡a   '
      co[4]='   Convenio    '
      DO lemplp1
      RELE co,ct,gt,gto,ctt,fisc,xcos
   ENDIF
CASE BAR()=4
   SELE cat
   STORE 0 TO respuesta
   IF elicat('a Listar')<>0
      GOTO respuesta
      xcos=RECNO()
      SELE emp
      SET ORDER TO ordlis
      MAX=4
      tt='Listado de Empleados - Categor¡a: '+ALLTRIM(cat->categoria)
      fisc='EMP->cat=XCOS'
      DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
      co[1]='  Legajo  '
      co[2]='      Apellido y Nombre       '
      co[3]=' Ctro de Costos'
      co[4]='   Convenio    '
      DO lemplp1
      RELE co,ct,gt,gto,ctt,fisc,xcos
   ENDIF
CASE BAR()=5
   SELE con
   STORE 0 TO respuesta
   IF elicon('a Listar')<>0
      GOTO respuesta
      xcos=RECNO()
      SELE emp
      SET ORDER TO ordlis
      MAX=4
      tt='Listado de Empleados - Convenio: '+ALLTRIM(con->convenio)
      fisc='EMP->con=XCOS'
      DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
      co[1]='  Legajo  '
      co[2]='      Apellido y Nombre       '
      co[3]='Ctro de Costos '
      co[4]='  Categor¡a    '
      DO lemplp1
      RELE co,ct,gt,gto,ctt,fisc,xcos
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp('a Listar')<>0
      GOTO respuesta
      xcos=RECNO()
      SELE emp
      SET ORDER TO ordlis
      MAX=4
      tt='Listado de Empleados - Especialidad: '+ALLTRIM(esp->especiali)
      fisc='EMP->esp=XCOS'
      DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
      co[1]='  Legajo  '
      co[2]='      Apellido y Nombre       '
      co[3]='Ctro de Costos '
      co[4]='  Categor¡a    '
      DO lemplp1
      RELE co,ct,gt,gto,ctt,fisc,xcos
   ENDIF
CASE BAR()=7
   DEFI POPU caca1 FROM 13,48 MESSAGE 'B£squeda de Empleados - Campo de b£squeda' SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca1 PROM ' \<Legajo'
   DEFI BAR 2 OF caca1 PROM ' \<Apellido/Nombre '
   DEFI BAR 3 OF caca1 PROM ' \<Domicilio'
   DEFI BAR 4 OF caca1 PROM ' \<Localidad'
   DEFI BAR 5 OF caca1 PROM ' \<Tel‚fono'
   ON SELE POPU caca1 DO buempl
   ACTI POPU caca1
   RELE POPU caca1
ENDCASE
RETURN
*: EOF: LEMPLP.PRG
