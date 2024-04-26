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
case bar()=4
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Saldar',-1,1))
		=OPCLI()
		do opcch with jannro
		=OPCCL() with jannro
        DO sccla.spr
		ACTI POPU nada
		RELE POPU nada
	endif
CASE BAR()=5
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP('a Listar',-1,1))
	    STORE "" TO FISC,TT
		=OPCLI()
		do opcch with jannro
		=OPCCL() with jannro
   respuesta='ALGO#9#20#Tipo de Reimputaci¢n#3;
  #Por \<Factura;
  #Por Fecha de \<Emisi¢n;
  #Por Fecha de \<Vencimiento'
	=DEFPOP()
   ON SELE POPU ALGO DO reimp
      ACTI POPU ALGO
      RELE POPU ALGO
	endif
endcase
=men_lin(botom)
return
