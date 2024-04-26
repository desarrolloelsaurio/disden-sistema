*********************************************************************************
*-- Programa: ENTRAD.PRG
*-- Fecha   : 11-08-91 12:21pm
*-- Version : R. 'EL BATA'
*-- Notas   : MENU DE INGRESOS DE CAJA
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
ulpr=program()
=cabpan1()
dijo=bar()
do opemp
DO CASE
CASE dijo=1
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('',-1,1))
		DO opcaj with jannro
		=OPCLI()
		DO ICOB
	endif
CASE dijo=2
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('',-1,1))
		DO opcaj with jannro
		=OPCLI()
		DO ICOBo
	endif
CASE dijo=4
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('',-1,1))
		DO opcaj with jannro
		=OPCLI()
		DO IEFE
	endif
case dijo=6
	respuesta='LCAJ#7#28#Listado de Entradas de Caja#3;
#\<Ingresos;
#\<Recibos Emitidos'
	=defpop()
	on sele popu lcaj do lcajd with .T.,'GAS','C'
	acti popu lcaj
	rele popu lcaj
case dijo=7
	respuesta='LCAJ#7#28#Listado de Entradas de Caja#3;
#\<Ingresos;
#\<Recibos Emitidos'
	=defpop()
	on sele popu lcaj do lcajd with .f.,'GAS','C'
	acti popu lcaj
	rele popu lcaj
CASE dijo=9
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Listar',-1,1))
		=OPCIU()
		=OPCLI()
		do opcch WITH JANNRO
		=OPCCL() WITH JANNRO
		=CCLGRL(7,20)
		ON SELE POPU nada DO ctactec1
		ACTI POPU nada
		RELE POPU nada
	ENDIF
CASE dijo=10
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Listar',-1,1))
		=OPCIU()
		=OPCLI()
		do opcch with jannro
		=OPCCL() with jannro
		=CCLGRL(7,20)
		ON SELE POPU nada DO ctactec2
		ACTI POPU nada
		RELE POPU nada
	endif
case dijo=12
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('',-1,1))
		DO opcaj with jannro
		=OPCLI()
		DO CCOB
	ENDIF
CASE dijo=13
	=OPCCL()
	=OPCLI()
	respuesta='ALGO#9#20#Tipo de Reimputaci¢n#3;
	#Por \<Factura;
	#Por Fecha de \<Emisi¢n;
	#Por Fecha de \<Vencimiento'
	=DEFPOP()
	ON SELE POPU ALGO DO reimp
	ACTI POPU ALGO
	RELE POPU ALGO
CASE dijo=14
	=OPCCL()
	=OPCLI()
	respuesta='ALGO#9#20#Tipo de Saldo de Clientes#3;
	#\<Lista Clientes a Saldar;
	#\<Salda Clientes'
	=DEFPOP()
	ON SELE POPU ALGO DO sccl
	ACTI POPU ALGO
	RELE POPU ALGO
ENDCASE
=MEN_LIN(BOTOM)
RETURN
