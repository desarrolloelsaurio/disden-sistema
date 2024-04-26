*:*********************************************************************
*:
*:        Program: SUELDOS.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/23/91     20:35
*:
*:      Called by: INICIO.PRG
*:
*:          Calls: OPJAN          (procedure in PROCESOS.PRG)
*:               : GENVAR.PRG
*:               : OPHLP          (procedure in PROCESOS.PRG)
*:               : ICDG.PRG
*:               : HLP            (procedure in PROCESOS.PRG)
*:               : VARIOS.PRG
*:               : EMPLEA.PRG
*:               : LIQUID.PRG
*:               : PLANIL.PRG
*:               : ADELAN.PRG
*:               : HISTOR.PRG
*:               : AGUINA.PRG
*:               : VARI.PRG
*:               : ADIOS          (procedure in PROCESOS.PRG)
*:               : ICDG2.PRG
*:
*:   Memory Files: PATH.MEM
*:
*:    Other Files: FOXUSER.DBF
*:
*:      Documented 04/23/91 at 20:43               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: SUELDOS.PRG
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : MENU SISTEMA DE SUELDOS
********************************************************************************
ON ERROR QUIT
A=FILE("C:\TOOLS\LL.EXE")
IF A .AND. CONTROL
! cd D:\sueldos
SET RESOURCE TO D:\sueldos\foxuser.dbf
SET PATH TO D:\sueldos\
SET RESOURCE ON
SET STAT OFF
SET ESCA OFF
SET TALK OFF
SET DEVE OFF
SET MEMO TO 70
SET DECIMALS TO 10
SET LOGE OFF
SET SYSMENU OFF
SET DELE ON
SET SAFE OFF
SET CONFIRM ON
SET DATE TO FRENCH
SET COLOR SET TO goyo
SET BELL TO 100,1
RELE ALL
CLOSE ALL
CLEA ALL
ON ERROR DO ERROR
ulpr=PROGRAM()
CLEA
REST FROM PATH ADDI
janpop=.F.
*SET PROC TO procesos
DO opjan
IF RECC()=4
   GOTO 1
   IF empresa=CHR(67)+CHR(65)+CHR(80)+CHR(83)+CHR(69)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)
      GOTO 2
	  IF EMPRESA=CHR(70)+CHR(73)+CHR(78)+CHR(67)+CHR(65)+CHR(83)+CHR(32)+CHR(82)+CHR(73)+CHR(79)+CHR(74)+CHR(65)+CHR(78)+CHR(65)+CHR(83)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)
	     GOTO 3
         IF EMPRESA=CHR(67)+CHR(65)+CHR(80)+CHR(83)+CHR(69)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)+CHR(32)+CHR(40)+CHR(77)+CHR(65)+CHR(82)+CHR(32)+CHR(68)+CHR(69)+CHR(76)+CHR(32)+CHR(80)+CHR(76)+CHR(65)+CHR(84)+CHR(65)+CHR(41)
            GOTO 4
            IF EMPRESA=CHR(67)+CHR(65)+CHR(80)+CHR(83)+CHR(69)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)+CHR(32)+CHR(40)+CHR(67)+CHR(65)+CHR(80)+CHR(46)+CHR(32)+CHR(66)+CHR(69)+CHR(82)+CHR(77)+CHR(85)+CHR(68)+CHR(69)+CHR(90)+CHR(41)
SET COLO TO B/W,W
CLEA
      *************************** INICIO SUELDOS **************************
      	RELE PATH,janpop
	      @ 0,0 SAY REPLICATE("Û",80) COLOR W
   	   @ 0,1 SAY 'Sueldos y Jornales' COLOR I
      	@ 0,20 SAY '|'
	      @ 0,22 SAY DATE() COLOR I
   	   @ 0,32 SAY '|'
      	@ 0,34 SAY TIME() COLOR I
	      @ 0,44 SAY '|'
      @ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
      @ 0,58 SAY '|'
      DO genvar
      DO ophlp
      FOR cdg=1 TO 3
         juligan='NO'
         DO icdg
         IF juligan='SI'
            CLEA
            ON KEY LABEL shift-f1 DO hlp
            @ 0,0 SAY REPLICATE("Û",80) COLOR W
            @ 0,1 SAY 'Sueldos y Jornales' COLOR I
            @ 0,20 SAY '|'
            @ 0,22 SAY DATE() COLOR I
            @ 0,32 SAY '|'
            @ 0,34 SAY TIME() COLOR I
            @ 0,44 SAY '|'
            @ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
            @ 0,58 SAY '|'
            @ 0,60 SAY PADL(janname,19,' ') COLOR I
            ************************** inicio sueldos
            DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE SUELDOS Y JORNALES (Shift F1 Ayuda en L¡nea) '
            DEFI PAD varios OF main PROM '\<Varios'    AT 01,00 COLOR SCHE 2
            DEFI PAD emplea OF main PROM '\<Empleados' AT 01,07 COLOR SCHE 2
            DEFI PAD adelan OF main PROM 'A\<delantos' AT 01,17 COLOR SCHE 2
            DEFI PAD liquid OF main PROM 'L\<iquida'   AT 01,27 COLOR SCHE 2
            DEFI PAD planil OF main PROM 'P\<lanillas' AT 01,35 COLOR SCHE 2
            DEFI PAD HISTOR OF main PROM '\<Hist¢rico' AT 01,45 COLOR SCHE 2
            DEFI PAD aguina OF main PROM '\<S. A. C.'  AT 01,55 COLOR SCHE 2
            DEFI PAD variab OF main PROM 'V\<ariables' AT 01,64 COLOR SCHE 2
            DEFI PAD adios  OF main PROM '\<Chau'      AT 01,74 COLOR SCHE 2

            ON SELECTION PAD varios OF main ACTI POPUP varios
            ON SELECTION PAD emplea OF main ACTI POPUP emplea
            ON SELECTION PAD adelan OF main ACTI POPUP adelan
            ON SELECTION PAD liquid OF main ACTI POPUP liquid
            ON SELECTION PAD planil OF main ACTI POPUP planil
            ON SELECTION PAD HISTOR OF main ACTI POPUP HISTOR
            ON SELECTION PAD aguina OF main ACTI POPUP aguina
            ON SELECTION PAD variab OF main ACTI POPUP variab
            ON SELECTION PAD adios  OF main ACTI POPUP adios

            DEFI POPU varios FROM 2,0 MESSAGE 'A/B/M/L Varios' SHADOW COLOR SCHE 3
            DEFI BAR 1 OF varios PROM ' \<Empresas'
            DEFI BAR 2 OF varios PROM ' \<Centros de Costos '
            DEFI BAR 3 OF varios PROM ' C\<onvenios'
            DEFI BAR 4 OF varios PROM ' Cate\<gor¡as'
            DEFI BAR 5 OF varios PROM ' Especiali\<dades'
            DEFI BAR 6 OF varios PROM ' \<Parentescos'
            DEFI BAR 7 OF varios PROM ' \<Tipo de Adelanto'
            DEFI BAR 8 OF varios PROM '---------------------------' SKIP
            DEFI BAR 9 OF varios PROM ' Co\<nstantes de Liquidaci¢n '
            DEFI BAR 10 OF varios PROM '---------------------------' SKIP
            DEFI BAR 11 OF varios PROM ' Tipo de \<Hora'
            DEFI BAR 12 OF varios PROM ' \<Adicionales'
            DEFI BAR 13 OF varios PROM ' \<Retenciones'
            DEFI BAR 14 OF varios PROM ' \<Salario Familiar'
            DEFI BAR 15 OF varios PROM '---------------------------' SKIP
            DEFI BAR 16 OF varios PROM ' Back \<Up'

            DEFI POPU emplea FROM 2,7 MESSAGE 'A/B/M/L Empleados' SHADOW COLOR SCHE 3
            DEFI BAR 1 OF emplea PROM ' Datos \<Personales'
            DEFI BAR 2 OF emplea PROM ' Datos \<Familiares'
            DEFI BAR 3 OF emplea PROM ' Datos de \<Liquidaci¢n '
            DEFI BAR 4 OF emplea PROM ' Lega\<jo'

            DEFI POPU adelan FROM 2,17 MESSAGE 'Adelantos - Pr‚stamos - Compras' SHAD COLOR SCHE 3
            DEFI BAR 1 OF adelan PROM ' \<Ingreso Adelantos'
            DEFI BAR 2 OF adelan PROM ' \<Generaliza Adelantos'
            DEFI BAR 3 OF adelan PROM ' I\<ngreso Global'
            DEFI BAR 4 OF adelan PROM '-------------------------------' SKIP
            DEFI BAR 5 OF adelan PROM ' \<Corrige Adelantos'
            DEFI BAR 6 OF adelan PROM '-------------------------------' SKIP
            DEFI BAR 7 OF adelan PROM ' \<Borra Adelantos'
            DEFI BAR 8 OF adelan PROM ' Borra \<Archivo Adelantos'
            DEFI BAR 9 OF adelan PROM '-------------------------------' SKIP
            DEFI BAR 10 OF adelan PROM ' \<Lista por Impresora'
            DEFI BAR 11 OF adelan PROM ' Lista por \<Pantalla'

            DEFI POPU liquid FROM 2,27 MESSAGE 'Liquidaci¢n de Sueldos y Jornales' SHADOW COLOR SCHE 3
            DEFI BAR 1 OF liquid PROM ' \<Calcula Sueldos y Jornales '
            DEFI BAR 2 OF liquid PROM ' Calcula \<y Muestra Sueldos y Jornales '
            DEFI BAR 3 OF liquid PROM ' \<Recalcula'
            DEFI BAR 4 OF liquid PROM '----------------------------------------' SKIP
            DEFI BAR 5 OF liquid PROM ' Recibos de Sueldo por \<Pantalla'
            DEFI BAR 6 OF liquid PROM ' Recibos de Sueldo por \<Impresora'
            DEFI BAR 7 OF liquid PROM '----------------------------------------' SKIP
            DEFI BAR 8 OF liquid PROM ' C\<heques'
            DEFI BAR 9 OF liquid PROM '----------------------------------------' SKIP
            DEFI BAR 10 OF liquid PROM ' \<Genera Hist¢rico'
            DEFI BAR 11 OF liquid PROM ' \<Fin Liquidaci¢n'
            DEFI BAR 12 OF liquid PROM '----------------------------------------' SKIP
            DEFI BAR 13 OF liquid PROM ' \<Borra Archivo Liquidaci¢n'
            DEFI BAR 14 OF liquid PROM '----------------------------------------' SKIP
            DEFI BAR 15 OF liquid PROM ' R\<eindexa Archivo Liquidaci¢n'
            DEFI BAR 16 OF liquid PROM ' Pro\<blemas'

            DEFI POPU planil FROM 2,35 MESSAGE 'Planillas y Listados' SHADOW COLOR SCHE 3
            DEFI BAR 1 OF planil PROM ' \<Genera Planilla de Sueldos y Jornales '
            DEFI BAR 2 OF planil PROM ' \<Imprime Planilla'
            DEFI BAR 3 OF planil PROM '-----------------------------------------' SKIP
            DEFI BAR 4 OF planil PROM ' \<Sueldos Pagados por Impresora'
            DEFI BAR 5 OF planil PROM ' Sueldos \<Pagados por Pantalla'
            DEFI BAR 6 OF planil PROM '-----------------------------------------' SKIP
            DEFI BAR 7 OF planil PROM ' Planilla de \<Cambio'
            DEFI BAR 8 OF planil PROM ' Planilla de Ingreso de \<Novedades'
            DEFI BAR 9 OF planil PROM ' Planilla \<Adjunta de Adelantos'
            DEFI BAR 10 OF planil PROM '-----------------------------------------' SKIP
            DEFI BAR 11 OF planil PROM ' Resumen de \<Horas'
            DEFI BAR 12 OF planil PROM ' Resumen de A\<dicionales'
            DEFI BAR 13 OF planil PROM ' Resumen de \<Leyes Sociales'
            DEFI BAR 14 OF planil PROM ' Resumen de Salario \<Familiar'
            DEFI BAR 15 OF planil PROM '-----------------------------------------' SKIP
            DEFI BAR 16 OF planil PROM ' \<Minuta Contable'

            DEFI POPU HISTOR FROM 2,45 MESSAGE 'Listados e Informes Hist¢ricos' SHADOW COLOR SCHE 3
            DEFI BAR 1 OF HISTOR PROM ' \<Horas Trabajadas'
            DEFI BAR 2 OF HISTOR PROM ' \<Adicionales'
            DEFI BAR 3 OF HISTOR PROM ' \<Retenciones-Aportes '
            DEFI BAR 4 OF HISTOR PROM ' Salario \<Familiar'
            DEFI BAR 5 OF HISTOR PROM ' \<Sueldos'
            DEFI BAR 6 OF HISTOR PROM '-----------------------' SKIP
            DEFI BAR 7 OF HISTOR PROM ' \<Moneda Constante'

            DEFI POPU aguina FROM 2,33 MESSAGE 'C lculo de Aguinaldo - Retroactivos' SHADOW COLOR SCHE 3
            DEFI BAR 1 OF aguina PROM ' \<Calcula Mejor Sueldo '
            DEFI BAR 2 OF aguina PROM ' \<Verifica Sueldo'
            DEFI BAR 3 OF aguina PROM ' \<Genera Registro de S.A.C.'
            DEFI BAR 4 OF aguina PROM '------------------------------' SKIP
            DEFI BAR 5 OF aguina PROM ' Calcula \<Retroactivos'
            DEFI BAR 6 OF aguina PROM ' \<Lista Retroactivos'
            DEFI BAR 7 OF aguina PROM ' G\<enera Registro Retroactivos '

            DEFI POPU variab FROM 2,46 MESSAGE 'Mantenimiento de variables del sistema' SHADOW COLOR SCHE 3
            DEFI BAR 1 OF variab PROM " \<Popup's a Utilizar"
            DEFI BAR 2 OF variab PROM " Ancho de la \<Impresora"
            DEFI BAR 3 OF variab PROM " Ancho de la \<Hoja"
            DEFI BAR 4 OF variab PROM " \<Redondeo"
            DEFI BAR 5 OF variab PROM " \<Billetes"
            DEFI BAR 6 OF variab PROM ' D\<enominaci¢n Moneda'
            DEFI BAR 7 OF variab PROM " \<Adelantos en Recibo"
            DEFI BAR 8 OF variab PROM " I\<mprime Adelantos"
            DEFI BAR 9 OF variab PROM " \<Tipo de Formulario"
            DEFI BAR 10 OF variab PROM " \<Cantidad de D¡gitos"
            DEFI BAR 11 OF variab PROM " \<N£mero Recibo de Adelanto "
            DEFI BAR 12 OF variab PROM " M\<oneda Constante"
            DEFI BAR 13 OF variab PROM " Orden de los \<Listados"
            DEFI BAR 14 OF variab PROM " Te\<xtos en Recibo"
            DEFI BAR 15 OF variab PROM " \<Datos de la Liquidaci¢n"
            DEFI BAR 16 OF variab PROM " Datos del \<S.A.C."
            DEFI BAR 17 OF variab PROM " C lculo del S\<.A.C."

	            DEFI POPU adios FROM 2,55 MESSAGE 'Se va del Sistema' SHADOW COLOR SCHE 3
            	DEFI BAR 1 OF adios PROM "ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»"
         	   DEFI BAR 2 OF adios PROM "º         \<Chau        º"
      	      DEFI BAR 3 OF adios PROM "ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼"

	            ON SELE POPUP varios DO varios
            	ON SELE POPUP emplea DO emplea
         	   ON SELE POPUP liquid DO liquid
      	      ON SELE POPUP planil DO planil
   	         ON SELE POPUP adelan DO adelan
	            ON SELE POPUP HISTOR DO HISTOR
            	ON SELE POPUP aguina DO aguina
         	   ON SELE POPUP variab DO vari
      	      ON SELE POPUP adios DO adios
   	         ulpr='SUELDOS'
	            DO WHILE .T.
   	            ACTI MENU main
		         ENDDO
******************** FIN SUELDOS **********************************
     		   ELSE
           		DO icdg2
	         ENDIF
  			NEXT
	      QUIT
		   ELSE
      		QUIT
		   ENDIF
		ELSE
		   QUIT
		ENDIF
	ELSE
	   QUIT
	ENDIF
ELSE
   QUIT
ENDIF
ELSE
   QUIT
ENDIF
ELSE
   QUIT
ENDIF
RETURN
