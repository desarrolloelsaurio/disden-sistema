*********************************************************************************
*-- Programa: SALIDA.prg
*-- Fecha   : 11/14/91
*-- Version : R. 'EL BATA'
*-- Notas   : MENU EGRESOS CAJA
********************************************************************************
ulpr=program()
SA_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
=OPPRO()
=OPGAS()
do OPEMP
DO CASE
CASE SA_DIJO="Pago a Proveedores"
   DO OPDOC
	=OPCLI()
   DO OPBAN
   do ipagp
CASE SA_DIJO="Pago a Cuenta"
   DO OPDOC
	=OPCLI()
   DO OPBAN
   do ipagctap
CASE SA_DIJO="Salida de Efectivo"
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj
      DO opccp
      do ecaj1
   endif
CASE SA_DIJO="Salida de Cheques Propios"
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj
      DO opccp
      DO OPban
      do ecaj2
   endif
case SA_DIJO="Salida de Cheques de Terceros"
DO OPCAJ
case SA_DIJO="Egresos por Pantalla"
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('a Listar',-1,1))
      DO opcaj
      DO OPBAN
		=OPCLI()
      do lcaj with .T.,'GAS','P'
   endif
case SA_DIJO="Egresos por Impresora"
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('a Listar',-1,1))
      DO opcaj
      DO OPBAN
		=OPCLI()
      do lcaj with .F.,'GAS','P'
   endif
case BAR()=10
		=OPCIU()
		=OPPRO()
		respuesta='nada#7#20#Estado de Cuenta#3#\<Deuda de los Proveedores#\<Falta de Recepci¢n de Pagos'
		=DEFPOP()
		ON SELE POPU nada DO ctactep1 WITH .T.
		ACTI POPU nada
		RELE POPU nada
case BAR()=11
		=OPCIU()
		=OPPRO()
		respuesta='nada#7#20#Estado de Cuenta#3#\<Deuda de los Proveedores#\<Falta de Recepci¢n de Pagos'
		=DEFPOP()
		ON SELE POPU nada DO ctactep1 WITH .F.
		ACTI POPU nada
		RELE POPU nada
CASE BAR()=13
    =OPPRO()
	respuesta='nada#15#50#Reimputaci¢n de Gastos#3#Un \<Proveedor#\<Una \<Cuenta#Entre \<Fechas'
	=DEFPOP()
	ON SELE POPU nada do reimputa
	ACTI POPU nada
	RELE POPU nada
CASE BAR()=14
   do concilio
ENDCASE
RETURN MEN_LIN(botom)
