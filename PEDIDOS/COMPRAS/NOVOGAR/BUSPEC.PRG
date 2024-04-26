********************************************************************************
*-- Programa: BUSPEC.PRG
*-- Fecha   : 10-16-92 01:41pm
*-- Version : G. REINER
*-- Notas   : devuelve variables para trabajo con NOTAS DE PEDIDO DE COMPRAS
********************************************************************************
function BUSPEC
	=movewin(10,10,15,70,'win'," Nota de Pedido de Compras ")
	SCAT MEMV BLAN
	@ 1,1 SAY "N§ NOTA DE PEDIDO : "
	@ 2,1 SAY "PROVEEDOR         : "
	store SPACE(14) to m.PEDIDO
	@ 1,20 GET m.PEDIDO PICT "@!";
	MESS 'Ingrese N§ de Nota de Pedido [ENTER] p/menu'
	READ
	M.PEDIDO=Q_FAC(M.PEDIDO)
	@ 1,20 GET m.PEDIDO PICT "@!"
	CLEA GETS
	IF RIGHT(M.PEDIDO,8)#'00000000'
		STOR NUL TO respuesta
		IF !EMPTY(eliPRO(' [ESC] para Men£ ',2,25))
			NADA=ALLTRIM(PRO.PROVEEDOR)
			@ 2,20 GET NADA
			CLEA GETS
			=RELEWIN("WIN")
			SELE PEC
		    RETURN SEEK(M.PEDIDO+PRO.PROCOD)
	ENDIF
else
	=relewin("WIN")
return .F.
ENDIF
=relewin("WIN")
return .F.
