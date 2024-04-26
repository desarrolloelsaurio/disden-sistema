*:*********************************************************************
*:
*:        Program: ADIOS.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/05/91     13:09
*:
*:      Called by: COMER.PRG
*:
*:   Memory Files: &A
*:
*:      Documented 09/25/91 at 13:24               FoxDoc  version 2.01
*:*********************************************************************
DO CASE
CASE BAR()=2
	=IAUD("SALIDA DEL SISTEMA")
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("EQUIPO")="TAPIPLAS"
		A=PATH+'\GENE'
		SAVE TO &a ALL LIKE xa*
	ELSE
		save to (pathVEN+"\gene") all like xa*
	ENDIF
	RELE abio,abios,tella,tellas,austral,australes,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,unid
	RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER
	RELE pds,favri,ulpr,sstm,WIDE,OFFWIDE
	RELE ALL LIKE mader*
	RELE ALL LIKE PATH*
	RELE ALL LIKE xa*
	A=PATH
	RELE PATH,pathpro
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
		SAVE TO (A+'\posic')
	ELSE
		if GETENV("EQUIPO")="TAPIPLAST"
			SAVE TO C:\SISTEMAS\VENTAS\VENTASP\POSIC 
		else
			SAVE TO POSIC
		ENDIF
	ENDIF
	QUIT
ENDCASE
RETURN
