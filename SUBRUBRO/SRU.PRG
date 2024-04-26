********************************************************************************
*-- Programa: sru.prg
*-- Fecha   : 06/05/91 03:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE SUB-RUBROS
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ulpr=PROGRAM()
=CABPAN1()
sele rub
stor nul TO respuesta
DO CASE
CASE BAR()=1
	DO isru
CASE BAR()=2
	=IIF(EMPTY(elisru(" a Corregir",-1,1)),NOSELEC("SUB-RUBRO"),csru())
CASE BAR()=4
	=IIF(EMPTY(elisru(" a Borrar",-1,1)),NOSELEC("SUB-RUBRO"),Bsru())
CASE BAR()=5
	SET DELE OFF
	SET FILTER TO DELETED()
	GOTO TOP
	IF !EOF()
		stor srupop TO anterior
		stor .T. TO srupop
		do opsru
		stor nul TO respuesta
		IF elisru(" a Recuperar",-1,1)#0
			DO llsru
		ENDIF
		stor anterior TO srupop
	ENDIF
	SET DELE ON
	sele sru
	set filter to
CASE BAR()=8
	respuesta='NADA#13#20#L¡mites del Listado#3;
#\<Todos los Rubros;
#\<Un Rubro'
	=DEFPOP()
	on sele popu nada DO lsru
	acti popu nada
	rele popu nada
CASE BAR()=9
	respuesta='NADA#14#20#L¡mites del Listado#3#;
\<Todos los Rubros;
#\<Un Rubro'
	=DEFPOP()
	on sele popu nada DO lsru WITH .T.
	acti popu nada
	rele popu nada
CASE BAR()=13
   DO xrub
ENDCASE
ulpr=PROGRAM()
unlo all
return men_lin(botom)
