********************************************************************************
*-- Programa: kar.prg
*-- Fecha   : 06/21/91 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE kardex
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
SELE kar
dijo=alltrim(prompt())
DO CASE
CASE dijo='Ingresa Operaci¢n'
	DO ikar
CASE dijo='Verifica Consistencia'
	RESPUESTA=INFIC("CLAVE",99999999)
	IF RESPUESTA=14642754 .OR. RESPUESTA=13958543
	IF CONFIRMA("SWAPEAR DATOS ENTRADA-KILOS",.T.,10,10)
		=WORKING()
		=OPKAR() WITH JANNRO
		=FLOCK() .OR. FLOK()
		=DOTALK()
		SCAN FOR DOCREF='RI' .AND. OPK='02' .AND. EMPTY(SALIDA) .AND. !EMPTY(ENPESO)
			STORE KAR.ENTRADA TO NADA
			REPL KAR.ENTRADA WITH KAR.ENPESO
			REPL KAR.ENPESO WITH NADA
		ENDSCAN
		UNLO IN KAR
		=UNTALK()
		=UNWORK()
		ENDIF
	ENDIF
CASE BAR()=3
	respuesta='nada#8#15#Tipo de Borrado#3#Borra \<Todo el Archivo#\<'+abios+'#\<'+tellas+'#\<Por '+abio+'#P\<or '+tella
	=DEFPOP()
	ON SELE POPU nada DO bkar
	ACTI POPU nada
	RELE POPU nada
CASE BAR()=4
	respuesta='nada#8#15#Calcula Saldos de Kardex#3#Borra \<Todo el Archivo#\<'+abios+'#\<'+tellas+'#\<Por '+abio+'#P\<or '+tella
	=DEFPOP()
	ON SELE POPU nada DO skar
	ACTI POPU nada
	RELE POPU nada
CASE dijo="Lista por Pantalla"
	STORE DATE() TO FECINI,FECFIN
	IF ENTRE_FE()
		TT="Listado de Operaciones de Kardex"+chr(13)+chr(10)+;
		"entre el "+dtoc(fecini)+" al "+dtoc(fecfin)
		FISC='FECHAOP>={'+dtoc(fecini)+"} .AND. FECHAOP<={"+dtoc(fecfin)+"}"
		FISC1='FECHAOP<{'+dtoc(fecini)+"}"
		STORE NUL TO RESPUESTA
		IF ELIMER("a Listar",-1,1)
			FISC=FISC+' .AND. "'+MER.ARTICULO+'"=KAR.ARTICULO'
			FISC1=FISC1+' .AND. "'+MER.ARTICULO+'"=KAR.ARTICULO'
			TT=TT+CHR(13)+CHR(10)+ALLTRIM(MER.MERCA)
			DO LKARP
		ENDIF
	ENDIF
CASE dijo="Lista por Impresora"
	STORE DATE() TO FECINI,FECFIN
	IF ENTRE_FE()
		TT="Listado de Operaciones de Kardex"+chr(13)+chr(10)+;
		"entre el "+dtoc(fecini)+" al "+dtoc(fecfin)
		FISC='FECHAOP>={'+dtoc(fecini)+"} .AND. FECHAOP<={"+dtoc(fecfin)+"}"
		FISC1='FECHAOP<{'+dtoc(fecini)+"}"
		STORE NUL TO RESPUESTA
		IF ELIMER("a Listar",-1,1)
			FISC=FISC+' .AND. "'+MER.ARTICULO+'"=KAR.ARTICULO'
			FISC1=FISC1+' .AND. "'+MER.ARTICULO+'"=KAR.ARTICULO'
			TT=TT+CHR(13)+CHR(10)+ALLTRIM(MER.MERCA)
			DO LKARI
		ENDIF
	ENDIF
CASE BAR()=9
	DO vkar
CASE BAR()=11
	ulpr='Xkar'
	DO rndx WITH 16,20
	ON SELE POPU rndx DO xkar
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
