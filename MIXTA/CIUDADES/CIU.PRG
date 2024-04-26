*************************************************
*-- Programa: CIU.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE CIUDADES
************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
EXTERNAL PROCEDURE LCIU0.PRG
ulpr=PROGRAM()
=cabpan1()
SELE mix
*=OPPRV(.T.)
*do ciu.spr
DO CASE
CASE BAR()=1
	ulpr="ICIU"
*	DO iciu
      do iciu.spr
CASE BAR()=2
	ulpr="CCIU"
	stor nul TO respuesta
	do while ELIciu(" a Corregir",-1,1)
		do cciu.spr
	enddo
CASE BAR()=4
	stor nul TO respuesta
	=IIF(ELIciu(" a Borrar",-1,1),BCIU(),.T.)
CASE BAR()=5
	SET DELE OFF
	SET FILTER TO DELETED()
	GOTO TOP
	IF !EOF()
		stor ciupop TO anterior
		stor .T. TO ciupop
		=OPCIU()
		stor nul TO respuesta
		IF ELIciu(" a Recuperar",-1,1)
			ULPR="LLCIU"
			DO llciu
		ENDIF
		stor anterior TO ciupop
		=OPCIU()
	ENDIF
	SET DELE ON
	SELE mix
	SET FILTER TO
CASE BAR()=8 
	SELE MIX
	SET ORDE TO CIUTEX
	repo form ciudad  noco  to prin prompt
	SET ORDE TO CIUCOD
CASE BAR()=9
	acla='|CODIGO|'+PADC("CIUDAD",20)+paip+PADC("PROVINCIA",20)+'|C.POSTAL|CARACT.TE|  USUARIO |'
	m.linea=REPL("=",LEN(acla))
	tt='Listado de Ciudades'
    =XPRN1(4,"MIX","LCIU0()","","LCIU")
CASE BAR()=11
	=vGRL("CIU"," CIUDADES"," DE CIUDADES")
CASE BAR()=13
	ulpr='XCIU'
      DO rndx WITH 16,20
	ON SELE POPU rndx DO xMIX
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
