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
		=OPCCL(JANNRO)
		=cclgrl(7,20)
		ON SELE POPU nada DO ctactec1 WITH .T.
		ACTI POPU nada
		RELE POPU nada
	ENDIF
CASE BAR()=2
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Listar',-1,1))
		=OPCIU()
		=OPCLI()
		do opcch with jannro
		=OPCCL() with jannro
		=cclgrl(7,20)
		ON SELE POPU nada DO ctactec1
		ACTI POPU nada
		RELE POPU nada
	endif
case bar()=3
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Listar',-1,1))
		=OPCLI()
		do opcch with jannro
		=OPCCL() with jannro
		respuesta='nada#7#20#Gesti¢n de Saldo de Cuenta Corriente#3#\<Lista Clientes a Saldar#\<Salda Clientes'
		=DEFPOP()
		ON SELE POPU nada DO sccl
		ACTI POPU nada
		RELE POPU nada
	endif
CASE BAR()=4
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Listar',-1,1))
		=OPCLI()
		do opcch with jannro
		=OPCCL() with jannro
        DO cligrl WITH 11,27,'L¡mites de la Reimputaci¢n',.t.
        ON SELE POPU cligrl DO reimpccl
        ACTI POPU cligrl
        RELE POPU cligrl
	endif
ENDCASE
RETURN MEN_LIN(BOTOM)
