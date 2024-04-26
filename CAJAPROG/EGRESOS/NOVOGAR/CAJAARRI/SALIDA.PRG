*********************************************************************************
*-- Programa: SALIDA.prg
*-- Fecha   : 11/14/91
*-- Version : R. 'EL BATA'
*-- Notas   : MENU EGRESOS CAJA
********************************************************************************
ulpr=program()
dijo=bar()
DIKO=ALLTRIM(PROMPT())
=CABPAN1()
=OPPRO()
=OPGAS()
do OPEMP
DO CASE
CASE DIKO="Salida de Cheques de Terceros"
   DO OPDOC
	=OPCLI()
   =OPPRO()
   DO OPCCP WITH JANNRO
   DO OPCCH WITH JANNRO
   DO OPBAN
   DO OPCCH WITH JANNRO
   respuesta='vdif#10#30#Tipo de Valor a que Egresa#3#\<Cheques#\<Tarjetas de Cr‚dito#\<Documentos'
   =defpop()
   on sele popu vdif DO ECCHX
   acti popu vdif
   rele popu vdif
CASE DIKO="Pago a Proveedores"
   DO OPDOC
	=OPCLI()
   DO OPBAN
   do ipagp
CASE DIKO="Pago a Cuenta"
   DO OPDOC
	=OPCLI()
   DO OPBAN
   do ipagctap
CASE DIKO="Salida de Efectivo"
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj with jannro
      DO opccp with jannro
      do ecaj1
   endif
CASE DIKO="Salida de Cheques Propios"
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj with jannro
      DO opccp with jannro
      DO OPban with jannro
      do ecaj2
   endif
case DIKO="Egresos por Pantalla"
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('a Listar',-1,1))
      DO opcaj
      DO OPBAN
		=OPCLI()
      do lcaj with .T.,'GAS','P'
   endif
case diKo="Egresos por Impresora"
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
	respuesta='nada#15#50#Reimputaci¢n de Gastos#3#Un \<Proveedor#\<Una \<Cuenta#Entre \<Fechas'
	=DEFPOP()
	ON SELE POPU nada do reimputa
	ACTI POPU nada
	RELE POPU nada
CASE DIJO=14
   do concilio
ENDCASE
=MEN_LIN(botom)
RETURN
