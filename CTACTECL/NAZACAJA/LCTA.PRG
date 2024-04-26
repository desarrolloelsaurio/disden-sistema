*********************************************************************************
*-- Programa: lcta.prg
*-- Fecha   : 11-08-91 12:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE CUENTA CORRIENTE DE CLIENTES
********************************************************************************
ulpr=program()
=cabpan1()
DO CASE
case bar()=1
	=OPCIU()
	=OPCLI()
		=OPCCH()
      =OPCCL() WITH 22
      =CCLGRL(7,20)
      ON SELE POPU nada DO ctactec1
      ACTI POPU nada
      RELE POPU nada
CASE BAR()=2
		=OPCIU()
		=OPCLI()
		=OPCCH()
      =OPCCL() WITH 22
      =CCLGRL(7,20)
      ON SELE POPU nada DO ctactec2
      ACTI POPU nada
      RELE POPU nada
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
endcase
=men_lin(botom)
return
