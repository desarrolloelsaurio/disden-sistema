********************************************************************************
*-- Programa: Lempli.PRG
*-- Fecha   : 10/31/90 09:58pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LOS LISTADOS DE datos personales de empleados
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Imprimiendo los Datos Requeridos',80,' ') COLO SCHE 19
DO CASE
CASE BAR()=1
   fisc='.t.'
   tt='Listado de Empleados'
   SET ORDER TO ordlis
   DO lempli1
   RELE fisc
CASE BAR()=2
   DEFI POPU caca1 FROM 9,40 MESSAGE 'Tipo de Listado' SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca1 PROM ' \<Domicilio y Localidad'
   DEFI BAR 2 OF caca1 PROM ' \<Tel‚fonos'
   DEFI BAR 3 OF caca1 PROM ' Documento de \<Identidad '
   DEFI BAR 4 OF caca1 PROM ' \<Puntaje'
   DEFI BAR 5 OF caca1 PROM ' \<Centros de Costos'
   DEFI BAR 6 OF caca1 PROM ' C\<ategor¡as'
   DEFI BAR 7 OF caca1 PROM ' C\<onvenios'
   DEFI BAR 8 OF caca1 PROM ' \<Especialidades'
   DEFI BAR 9 OF caca1 PROM ' \<No Cobran S. Fam.'
   DEFI BAR 10 OF caca1 PROM ' No \<Liquida'
   DEFI BAR 11 OF caca1 PROM ' \<Bajas'
   ON SELE POPU caca1 DO lemplip
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=3
   SELE ccos
   STORE 0 TO respuesta
   IF eliccos('a Listar')#0
      GOTO respuesta
      xcos=respuesta
      fisc='EMP.CCOS=XCOS'
      ACTI SCRE
      SELE emp
      SET ORDER TO ordlis
      tt='Listado de Empleados - Centro de Costos: '+ALLTRIM(ccos.cencos)
      DO lempli1
   ENDIF
CASE BAR()=4
   SELE cat
   STORE 0 TO respuesta
   IF elicat('a Listar')#0
      GOTO respuesta
      xcos=respuesta
      fisc='EMP.cat=XCOS'
      SELE emp
      SET ORDER TO ordlis
      tt='Listado de Empleados - Categor¡a: '+ALLTRIM(cat.categoria)
      DO lempli1
   ENDIF
CASE BAR()=5
   SELE con
   STORE 0 TO respuesta
   IF elicon('a Listar')#0
      GOTO respuesta
      xcos=respuesta
      SELE emp
      fisc='EMP.con=XCOS'
      SET ORDER TO ordlis
      tt='Listado de Empleados - Convenio: '+ALLTRIM(con.convenio)
      DO lempli1
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp('a Listar')#0
      GOTO respuesta
      xcos=respuesta
      fisc='EMP.esp=XCOS'
      SELE emp
      SET ORDER TO ordlis
      tt='Listado de Empleados - Especialidad: '+ALLTRIM(esp.especiali)
      DO lempli1
   ENDIF
ENDCASE
RETURN
