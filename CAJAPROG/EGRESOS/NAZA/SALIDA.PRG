*********************************************************************************
*-- Programa: SALIDA.prg
*-- Fecha   : 11/14/91
*-- Version : R. 'EL BATA'
*-- Notas   : MENU EGRESOS CAJA
********************************************************************************
ulpr=program()
dijo=bar()
=CABPAN1()
=OPPRO()
=OPGAS()
do OPEMP
DO CASE
CASE DIJO=1
	=OPCLI()
   do ipagp
CASE DIJO=2
   DO OPDOC WITH 21
	=OPCLI()
   DO OPBAN
   do ipagctap
CASE DIJO=4
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj
      do ecaj1
   endif
CASE DIJO=5
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj
      DO OPban
      do ecaj2
   endif
case DIJO=7
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('a Listar',-1,1))
      DO opcaj
      DO OPBAN
		=OPCLI()
      do lcaj with .t.,'GAS','P'
   endif
case DIJO=8
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('a Listar',-1,1))
      DO opcaj
      DO OPBAN
		=OPCLI()
      do lcaj with .f.,'GAS','P'
   endif
case dijo=10
		=OPCIU()
		=OPPRO()
		respuesta='nada#7#20#Estado de Cuenta#3#\<Deuda de los Proveedores#\<Falta de Recepci¢n de Pagos'
		=DEFPOP()
		ON SELE POPU nada DO ctactep1 WITH .T.
		ACTI POPU nada
		RELE POPU nada
case dijo=11
		=OPCIU()
		=OPPRO()
		respuesta='nada#7#20#Estado de Cuenta#3#\<Deuda de los Proveedores#\<Falta de Recepci¢n de Pagos'
		=DEFPOP()
		ON SELE POPU nada DO ctactep1 WITH .F.
		ACTI POPU nada
		RELE POPU nada
CASE DIJO=13
  =OPPRO()
	respuesta='nada#7#22#Reimputaci¢n de Gastos#3#Un \<Proveedor#\<Una \<Cuenta#Entre \<Fechas'
	=DEFPOP()
	ON SELE POPU nada do reimputa
	ACTI POPU nada
	RELE POPU nada
CASE DIJO=14
   do concilio
ENDCASE
=MEN_LIN(botom)
RETURN
