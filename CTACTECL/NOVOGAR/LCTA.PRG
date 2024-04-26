*********************************************************************************
*-- Programa: lcta.prg
*-- Fecha   : 11-08-91 12:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE CUENTA CORRIENTE DE CLIENTES
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
ulpr=program()
=cabpan1()
DO CASE
case bar()=1
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Listar',-1,1))
		=OPCIU()
		=OPCLI()
		do opcch WITH JANNRO
		=OPCCL() WITH JANNRO
		respuesta='nada#7#20#Estado de Cuenta#3#\<Deuda de los Clientes#\<Cheques en Cartera#\<Estado Patrimonial#\<Falta de Recepci¢n de Pagos#\<Un Cliente'
		=DEFPOP()
		ON SELE POPU nada DO ctactec1
		ACTI POPU nada
		RELE POPU nada
	ENDIF
CASE BAR()=2
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Listar',-1,1))
		=OPCIU()
		=OPCLI()
		=OPCCH(JANNRO)
		=OPCCL(JANNRO)
		respuesta='nada#7#20#Estado de Cuenta#3#\<Deuda de los Clientes#\<Cheques en Cartera#\<Estado Patrimonial#\<Falta de Recepci¢n de Pagos#\<Un Cliente'
		=DEFPOP()
		ON SELE POPU NADA DO CTACTEC2
		ACTI POPU NADA
		RELE POPU NADA
	endif
case bar()=3
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Listar',-1,1))
		=OPCLI()
		=OPCCH(JANNRO)
		=OPCCL(JANNRO)
		respuesta='nada#7#20#Gesti¢n de Saldo de Cuenta Corriente#3#\<Lista Clientes a Saldar#\<Salda Clientes'
		=DEFPOP()
		ON SELE POPU NADA DO SCCL
		ACTI POPU NADA
		RELE POPU NADA
	endif
endcase
RETURN MEN_LIN(BOTOM)
