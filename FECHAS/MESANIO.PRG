* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MESANIO.PRG           บ
* บ COMENTARIO    : INGRESA MES Y AฅO     บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 12-12-93                 บ
* บ HORA       : 01:06:51pm               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
* MES_TEX : TITULO DE LA VENTANA
* MES_NUMES: SI DEVUELVE EL MES COMO NUMERO
* MES_VENT : USA VENTANA
#DEFINE NUL    0                                 && NUL
FUNCTION MESANIO
	PARAMETER MES_TEX,MES_NUMES,MES_VENT
	PRIVATE MES_SALIDA
	STORE '' TO MES_SALIDA
	=MOVEWIN(10,10,15,60,'WIN',mes_tex)
	@ 1,1 SAY "MES" font "ARIAL",9
	@ $+1,1 SAY IIF(_WINDOWS,"AัO","AฅO") font "ARIAL",9
	STORE nul TO M.MES,M.ANIO
	@ 1,20 GET M.MES ;
	PICT '99' ;
	VALID EMPTY(M.MES) .OR. (M.MES>nul .AND. M.MES<13) ;
	ERROR "EL NUMERO DE MES NO ES CORRECTO" ;
	MESS "MES - [ESC] PARA MENU"
	READ
	IF LAST()#27 .AND. !EMPTY(M.MES)
		NADA=IIF(MES_NUMES,STR(M.MES,2),QMES(M.MES))
		M.ANIO=YEAR(DATE())
		@ $,20 SAY QMES(M.MES)
		@ $+1,20 GET M.ANIO ;
		PICT '9999' ;
		MESS IIF(_WINDOWS,"AัO","AฅO")
		READ
		IF LAST()#27 .AND. !EMPTY(M.ANIO)
			MES_SALIDA=LEFT(NADA,3)+STR(M.ANIO,4)
		ENDIF
	ENDIF
	=IIF(!MES_VENT,RELEWIN("WIN"),.T.)
RETURN MES_SALIDA
