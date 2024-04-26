***************************************
*-- Programa: CCO1F.PRG
*-- Fecha   : 06/27/91 10:13am
*-- Version : G. REINER
*-- Notas   : CORRIGE FECHA DE FINALIZACION PREVISTA
*-- Modif 07-12-93 02:32am
***************************************
PARAMETER XTPR
ULPR=HORA_ULP(PROGRAM())
#DEFINE TEX_EFES " - [F2] Popup - [F3] B£squeda" && TEX_EFES
IF CHEQSEG()
IF XTPR
ME1='Correcci¢n Tipo de Estructura Ordenes de '+korte+' - '
ELSE
ME1='Correcci¢n Fecha Fin Prev. Ordenes de '+korte+' - '
ENDIF
	=MOVECENT(1,1,15,60,"WIN"," Correcci¢n "+iif(xtpr,"Tipo de Estructura","Fecha Fin Prevista ")+"Orden de "+korte+' ')
	COL=20
	SELE COR
	SCAT MEMV MEMO
	ELREG=RECNO()
	=MCOR(.T.)
	IF XTPR
		@ 11,COL GET M.ESTRUC ;
			MESS me1+tex_efes ;
			WHEN _r7o10lcw6() ;
			VALID _r7o10lcw7() ;
			ERROR "ESTRUCTURA INEXISTENTE"
	ELSE
		@ 5,COL GET M.FECHAPRE ;
			MESS me1+'Fecha de Finalizaci¢n Prevista' ;
			VALID M.FECHAPRE>M.FECHAINI ;
			ERROR "LA FECHA DEBE SER MAYOR AL INICIO"
	ENDIF
	READ
	IF LAST()#27 
	    IF (XTPR .AND. !EMPTY(M.ESTRUC)) .OR. (!XTPR .AND. !EMPTY(M.FECHAINI))
		=AGRABAR1("COR",ELREG)
		=IAUD(ALLTRIM(STR(M.NUMERO))+"-"+M.ARTICULO+"-"+IIF(XTPR,M.ESTRUC,DTOC(M.FECHAINI)))
	ENDIF
	=RELEWIN('WIN')
ELSE
	=IAUDI()
ENDI
RETURN MEN_LIN(BOTOM)


FUNCTION _r7o10lcw6     &&  m.estruc WHEN
=MIX_F2("M.ESTRUC","del Art¡culo",4,18,"LEFT(MIX.TEXTO2,2)","TSTTEX",4,20)
RETURN SGET('COR')

FUNCTION _r7o10lcw7 &&  m.estruc VALID
IF EMPTY(M.ESTRUC) .OR. LAST()=27 
RETURN .T.
ENDIF
IF XSEEK(M.ESTRUC,"MIX","TSTCOD") 
  @ 11,COL+11 SAY MIX.TEXTO1
  RETURN .T.
ENDIF
RETURN .F.
