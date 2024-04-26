*:*********************************************************************
*:
*:        Program: INICIO.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, FRIGORIFICO LA TROPA
*:  Last modified: 04/19/91     10:12
*:
*:          Calls: INICIO2.PRG
*:               : INICIO1.PRG
*:               : SUELDOS.PRG
*:
*:      Documented 04/19/91 at 10:13               FoxDoc  version 2.01
*:*********************************************************************
SET TALK OFF
SET ESCA OFF
CLEA
DIME letra[26,5]
letra[ 1, 1]=" €€€ "
letra[ 1, 2]="€   €"
letra[ 1, 3]="€€€€€"
letra[ 1, 4]="€   €"
letra[ 1, 5]="€   €"
letra[ 2, 1]="€€€€ "
letra[ 2, 2]="€   €"
letra[ 2, 3]="€€€€ "
letra[ 2, 4]="€   €"
letra[ 2, 5]="€€€€ "
letra[ 3, 1]=" €€€ "
letra[ 3, 2]="€   €"
letra[ 3, 3]="€    "
letra[ 3, 4]="€   €"
letra[ 3, 5]=" €€€ "
letra[ 4, 1]="€€€€ "
letra[ 4, 2]="€   €"
letra[ 4, 3]="€   €"
letra[ 4, 4]="€   €"
letra[ 4, 5]="€€€€ "
letra[ 5, 1]="€€€€€"
letra[ 5, 2]="€    "
letra[ 5, 3]="€€€€€"
letra[ 5, 4]="€    "
letra[ 5, 5]="€€€€€"
letra[ 6, 1]="€€€€€"
letra[ 6, 2]="€    "
letra[ 6, 3]="€€€€€"
letra[ 6, 4]="€    "
letra[ 6, 5]="€    "
letra[ 7, 1]=" €€€€"
letra[ 7, 2]="€    "
letra[ 7, 3]="€  €€"
letra[ 7, 4]="€   €"
letra[ 7, 5]=" €€€ "
letra[ 8, 1]="€   €"
letra[ 8, 2]="€   €"
letra[ 8, 3]="€€€€€"
letra[ 8, 4]="€   €"
letra[ 8, 5]="€   €"
letra[ 9, 1]="€€€€€"
letra[ 9, 2]="  €  "
letra[ 9, 3]="  €  "
letra[ 9, 4]="  €  "
letra[ 9, 5]="€€€€€"
letra[10, 1]="   €€"
letra[10, 2]="    €"
letra[10, 3]="    €"
letra[10, 4]="€   €"
letra[10, 5]=" €€€ "
letra[11, 1]="€   €"
letra[11, 2]="€   €"
letra[11, 3]="€€€€ "
letra[11, 4]="€   €"
letra[11, 5]="€   €"
letra[12, 1]="€    "
letra[12, 2]="€    "
letra[12, 3]="€    "
letra[12, 4]="€    "
letra[12, 5]="€€€€€"
letra[13, 1]="€   €"
letra[13, 2]="€€ €€"
letra[13, 3]="€ € €"
letra[13, 4]="€   €"
letra[13, 5]="€   €"
letra[14, 1]="€   €"
letra[14, 2]="€€  €"
letra[14, 3]="€ € €"
letra[14, 4]="€  €€"
letra[14, 5]="€   €"
letra[15, 1]=" €€€ "
letra[15, 2]="€   €"
letra[15, 3]="€   €"
letra[15, 4]="€   €"
letra[15, 5]=" €€€ "
letra[16, 1]="€€€€ "
letra[16, 2]="€   €"
letra[16, 3]="€€€€ "
letra[16, 4]="€    "
letra[16, 5]="€    "
letra[17, 1]=" €€€ "
letra[17, 2]="€   €"
letra[17, 3]="€   €"
letra[17, 4]="€ € €"
letra[17, 5]=" €€€€"
letra[18, 1]="€€€€ "
letra[18, 2]="€   €"
letra[18, 3]="€€€€ "
letra[18, 4]="€   €"
letra[18, 5]="€   €"
letra[19, 1]=" €€€€"
letra[19, 2]="€    "
letra[19, 3]=" €€€ "
letra[19, 4]="    €"
letra[19, 5]="€€€€ "
letra[20, 1]="€€€€€"
letra[20, 2]="  €  "
letra[20, 3]="  €  "
letra[20, 4]="  €  "
letra[20, 5]="  €  "
letra[21, 1]="€   €"
letra[21, 2]="€   €"
letra[21, 3]="€   €"
letra[21, 4]="€   €"
letra[21, 5]=" €€€ "
letra[22, 1]="€   €"
letra[22, 2]="€   €"
letra[22, 3]="€   €"
letra[22, 4]=" € € "
letra[22, 5]="  €  "
letra[23, 1]="€   €"
letra[23, 2]="€   €"
letra[23, 3]="€ € €"
letra[23, 4]="€€ €€"
letra[23, 5]="€   €"
letra[24, 1]="€   €"
letra[24, 2]=" € € "
letra[24, 3]="  €  "
letra[24, 4]=" € € "
letra[24, 5]="€   €"
letra[25, 1]="€   €"
letra[25, 2]=" € € "
letra[25, 3]="  €  "
letra[25, 4]="  €  "
letra[25, 5]="  €  "
letra[26, 1]="€€€€€"
letra[26, 2]="    €"
letra[26, 3]=" €€€ "
letra[26, 4]="€    "
letra[26, 5]="€€€€€"
CLEA
@ 1,1 TO 16,79 177
@ 3,3 TO 14,76
DO inicio2 WITH 3,15,'SUELDOS  Y'
DO inicio2 WITH 10,20,'JORNALES'
@ 20,0 SAY PADC("SISTEMAS INFORMATICOS S.R.L.",80) COLO I
@ 21,0 SAY PADC("Goyo REINER / Carlos GENZLER",80) COLO I
@ 24,0 SAY PADC("TECLA PARA CONTINUAR",80) COLO I
=INKEY(0)
FOR A=1 TO 16
	scroll 2,2,15,78,1
	FOR B=1 TO 200
	NEXT
NEXT
FOR A=0 TO 25
	scroll 0,0,24,79,1
	FOR B=1 TO 100
	NEXT
NEXT
@ 1,1 TO 16,79 177
@ 3,3 TO 14,76
DO inicio1 WITH 3,15,'SUELDOS  Y'
DO inicio1 WITH 10,20,'JORNALES'
store .t. to control
DO sueldos
DO WHILE .T.
	ACTI MENU main
ENDDO
RETURN
PROCEDURE SUELDOS
	********************************************************************************
	*-- Programa: SUELDOS.PRG
	*-- Fecha   : 24/07/90
	*-- Version : G. REINER
	*-- Notas   : MENU SISTEMA DE SUELDOS
	********************************************************************************
	*ON ERROR QUIT
	IF CONTROL
		SET RESOURCE TO C:\SUELDOS\foxuser.dbf
		SET PATH TO C:\SUELDOS
		SET RESOURCE ON
		SET COLOR TO W/B,B,B
		SET MOUSE ON
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
		ON KEY LABEL Shift-F1 do hlp
		ON ERROR DO ERROR
		ULPR=PROGRAM()
		CLEA
		REST FROM PATH ADDI
		janpop=.F.
		DO opjan
		if cheqempr()
				**************************** INICIO SUELDOS **************************
				rele path,janpop
				DO genvar
				DO ophlp
				@ 0,0 SAY REPLICATE("€",80) COLOR W
				@ 0,1 SAY 'Sueldos y Jornales' COLOR I
				@ 0,20 SAY '|'
				@ 0,22 SAY DATE() COLOR I
				@ 0,32 SAY '|'
				@ 0,34 SAY TIME() COLOR I
				@ 0,44 SAY '|'
				@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
				@ 0,58 SAY '|'
				FOR cdg=1 TO 3
					juligan='NO'
					DO icdg
					IF juligan='SI'
						CLEA
						ON KEY LABEL shift-f1 DO hlp
						@ 0,0 SAY REPLICATE("€",80) COLOR W
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
						DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE SUELDOS Y JORNALES (Shift F1 Ayuda en L°nea) '
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
						DEFI BAR 4 OF varios PROM ' Cate\<gor°as'
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

						DEFI POPU adelan FROM 2,17 MESSAGE 'Adelantos - PrÇstamos - Compras' SHAD COLOR SCHE 3
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
						DEFI BAR 12 OF adelan PROM ' \<Resumen'

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

						DEFI POPU aguina FROM 2,33 MESSAGE 'C†lculo de Aguinaldo - Retroactivos' SHADOW COLOR SCHE 3
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
						DEFI BAR 10 OF variab PROM " \<Cantidad de D°gitos"
						DEFI BAR 11 OF variab PROM " \<N£mero Recibo de Adelanto "
						DEFI BAR 12 OF variab PROM " M\<oneda Constante"
						DEFI BAR 13 OF variab PROM " Orden de los \<Listados"
						DEFI BAR 14 OF variab PROM " Te\<xtos en Recibo"
						DEFI BAR 15 OF variab PROM " \<Datos de la Liquidaci¢n"
						DEFI BAR 16 OF variab PROM " Datos del \<S.A.C."
						DEFI BAR 17 OF variab PROM " C†lculo del S\<.A.C."

						DEFI POPU adios FROM 2,55 MESSAGE 'Se va del Sistema' SHADOW COLOR SCHE 3
						DEFI BAR 1 OF adios PROM "…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª"
						DEFI BAR 2 OF adios PROM "∫         \<Chau        ∫"
						DEFI BAR 3 OF adios PROM "»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº"

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
		******************** FIN SUELDOS **********************************
	RETURN
	PROCEDURE GENVAR
		*******************************************************************************
		*-- Programa: GENVAR.PRG
		*-- Fecha   : 11.08.1990
		*-- Version : G. REINER
		*-- Notas   : INICIALIZA VARIABLES
		********************************************************************************
		RELE ALL
		set talk off
		** VARIABLES DE MANEJO DE POPUP
		PUBLIC cospop,janpop,gaspop,conpop,catpop,esppop,parpop,emppop,varpop,thorpop,adipop,retpop,salpop
		** VARIABLES DE impresora
		PUBLIC acancho,achoja,canbil,redondeo,tipored,adenrec,imprec,aus,auss,acform,ACDIGI,nuade,actpla,calsac
		PUBLIC quialiq,fechaliq,mesaliq,anoaliq,recaliq,fecdep,bcodep,peraliq,FEPAG,perjub,CANREC
		public ordlis,FLIZ
		PUBLIC LIMSALQUI,LIMSALMES,MONK1,MONK2
		PUBLIC PATH,respuesta,acttex
		PUBLIC janname,jannro,indice,INDICE1,CAEM
		caem=14
		PUBLIC ARRAY bils[10],num[40],ptn[caem],MONK[12,2],pds[2]
		PUBLIC PATH
		REST FROM TOTAL ADDI
		REST FROM num ADDI
		REST FROM PATH ADDI
		RELE meses,pq,tdoc,tesc,tfr
		PUBLIC ARRAY meses[13],pq[5],tdoc[5],tesc[6],tfr[5,3]
		meses[1]='Enero'
		meses[2]='Febrero'
		meses[3]='Marzo'
		meses[4]='Abril'
		meses[5]='Mayo'
		meses[6]='Junio'
		meses[7]='Julio'
		meses[8]='Agosto'
		meses[9]='Septiembre'
		meses[10]='Octubre'
		meses[11]='Noviembre'
		meses[12]='Diciembre'
		meses[13]='S.A.C.'
		pq[2]='a Corregir'
		pq[4]='a Borrar'
		pq[5]='a Recuperar'
		tdoc[1]='D.N.I.'
		tdoc[2]='D.U.  '
		tdoc[3]='L.E.  '
		tdoc[4]='L.C.  '
		tdoc[5]='C.I.  '
		tesc[1]='Prescolar     '
		tesc[2]='Primaria      '
		tesc[3]='Secundaria    '
		tesc[4]='Terciaria     '
		tesc[5]='Universitaria '
		tesc[6]='No            '
		ulpr='L°nea de comandos'
		ptn[1]=CHR(65)+CHR(74)+CHR(65)
		ptn[2]=CHR(83)+CHR(72)+CHR(84)
		ptn[3]=CHR(83)+CHR(72)+CHR(65)
		ptn[4]=CHR(65)+CHR(82)+CHR(66)
		ptn[5]=CHR(74)+CHR(65)+CHR(77)
		ptn[6]=CHR(83)+CHR(72)+CHR(69)
		ptn[7]=CHR(83)+CHR(72)+CHR(77)
		ptn[8]='IIX'
		ptn[9]='HIX'
		ptn[10]='XXX'
		PTN[11]=CHR(65)+CHR(65)+CHR(65)
		PTN[12]=CHR(66)+CHR(66)+CHR(66)
		PTN[13]=CHR(67)+CHR(67)+CHR(67)
        PTN[14]=CHR(79)+CHR(79)+CHR(79)
		STORE 0 TO CANREC
		pds[1]=132
		pds[2]=233
		****
		****
		** tfr 1 -> shurot  2->etequim 3->smol
		** laban
		tfr[1,1]=72
		tfr[1,2]=2
		tfr[1,3]=80
		** ORIGINAL orot
		tfr[2,1]=54
		tfr[2,2]=1
		tfr[2,3]=255
		** PROG. DEL paisano
		tfr[3,1]=64
		tfr[3,2]=1
		tfr[3,3]=80
		** MANTENIM orot1
		tfr[4,1]=70
		tfr[4,2]=1
		tfr[4,3]=255
		** punteo
		tfr[5,1]=72
		tfr[5,2]=1
		tfr[5,3]=255
	RETURN
	procedure inicio1
		*:*********************************************************************
		*:
		*:        Program: INICIO1.PRG
		*:
		*:         System: SUELDOS Y JORNALES
		*:         Author: GREGORIO REINER
		*:      Copyright (c) 1991, FRIGORIFICO LA TROPA
		*:  Last modified: 04/19/91     10:12
		*:
		*:      Called by: INICIO.PRG
		*:
		*:      Documented 04/19/91 at 10:13               FoxDoc  version 2.01
		*:*********************************************************************
		PARAMETER R,C,t
		t=UPPER(ALLTRIM(t))
		FOR A=1 TO 5
			@ R,C SAY ""
			FOR B=1 TO LEN(t)
				sc=ASC(SUBSTR(t,B,1))
				IF sc=32
					?? SPACE(5)
				ELSE
					?? CHRTRAN(letra[SC-64,A],"€","≤")
					?? ' '
				ENDIF
			NEXT
			R=R+1
		NEXT
	RETURN
	procedure inicio2
		*:*********************************************************************
		*:
		*:        Program: INICIO2.PRG
		*:
		*:         System: SUELDOS Y JORNALES
		*:         Author: GREGORIO REINER
		*:      Copyright (c) 1991, FRIGORIFICO LA TROPA
		*:  Last modified: 04/19/91     10:12
		*:
		*:      Called by: INICIO.PRG
		*:
		*:      Documented 04/19/91 at 10:13               FoxDoc  version 2.01
		*:*********************************************************************
		PARAMETER R,C,t
		t=UPPER(ALLTRIM(t))
		FOR A=1 TO 5
			@ R,C SAY ""
			FOR B=1 TO LEN(t)
				sc=ASC(SUBSTR(t,B,1))
				IF sc=32
					?? SPACE(5)
				ELSE
					?? letra[SC-64,A]
					?? ' '
				ENDIF
			NEXT
			R=R+1
		NEXT
	RETURN
