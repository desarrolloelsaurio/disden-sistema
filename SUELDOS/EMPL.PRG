********************************************************************************
*-- Programa: EMPL.PRG
*-- Fecha   : 11/03/90 01:05am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DE DATOS PERSONALES EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO iempl
CASE BAR()=2
   DEFI POPU caca2 FROM 10,30 MESSAGE 'Tipo de Correcci¢n' SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca2 PROM ' \<Todos los Conceptos '
   DEFI BAR 2 OF caca2 PROM ' \<Puntaje'
   DEFI BAR 3 OF caca2 PROM ' \<Categor¡a'
   DEFI BAR 4 OF caca2 PROM ' Con\<venio'
   DEFI BAR 5 OF caca2 PROM ' C\<entro de Costos'
   DEFI BAR 6 OF caca2 PROM ' E\<specialidad'
   ON SELE POPU caca2 DO cempl
   ACTI POPU caca2
   RELE POPU caca2
CASE BAR()=4
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro<>0
      IF eliemp(" a dar de Baja")<>0
         GOTO respuesta
         DO bempl
      ENDIF
   ENDIF
CASE BAR()=5
   IF jannro=0
      DO elijan
   ENDIF
   SET DELE OFF
   SET FILTER TO DELETED()
	GOTO TOP
	IF .NOT. EOF()
	   STORE EMPpop TO anterior
   	STORE .T. TO EMPpop
		do opEMP
	   STORE 0 TO respuesta
   	IF eliEMP(" a Recuperar")<>0
			GOTO RESPUESTA
	      DO llEMPl
   	ENDIF
	   STORE anterior TO EMPpop
	ENDIF
SET FILTER TO
SET DELE ON
DO OPEMP
CASE BAR()=7
   DEFI POPU caca FROM 6,30 MESSAGE 'Tipo de Listado' SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca PROM ' \<Listado Completo'
   DEFI BAR 2 OF caca PROM ' Listado \<Parcial'
   DEFI BAR 3 OF caca PROM ' Por \<Centro de Costos '
   DEFI BAR 4 OF caca PROM ' Por C\<ategor¡a'
   DEFI BAR 5 OF caca PROM ' Por C\<onvenio'
   DEFI BAR 6 OF caca PROM ' Por \<Especialidad'
   ON SELE POPU caca DO lempli
   ACTI POPU caca
CASE BAR()=8
   DEFI POPU caca FROM 9,30 MESSAGE 'Tipo de Listado' SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca PROM ' \<Muestra Ficha'
   DEFI BAR 2 OF caca PROM ' Listado \<Parcial'
   DEFI BAR 3 OF caca PROM ' Por \<Centro de Costos '
   DEFI BAR 4 OF caca PROM ' Por C\<ategor¡a'
   DEFI BAR 5 OF caca PROM ' Por C\<onvenio'
   DEFI BAR 6 OF caca PROM ' Por \<Especialidad'
   DEFI BAR 7 OF caca PROM ' \<Busca Empleado'
   ON SELE POPU caca DO lemplp
   ACTI POPU caca
CASE BAR()=10
   ulpr='XEMP'
   DO kk WITH 11,30
   ON SELE POPU caca DO xemp
   ACTI POPU caca
ENDCASE
ulpr=PROGRAM()
RETURN
