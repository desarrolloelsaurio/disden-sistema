********************************************************************************
*-- Programa: BUSREC.PRG
*-- Fecha   : 10-16-92 03:19pm
*-- Version : G. REINER
*-- Notas   : devuelve variables para trabajo con REMITOS DE COMPRAS
********************************************************************************
function BUSREC
	=movewin(10,20,15,70,'win'," Remito de Compras ")
	SCAT MEMV BLAN
	@ 1,1 SAY "N§ REMITO  : "
	@ 2,1 SAY "PROVEEDOR  : "
	store SPACE(14) to m.remito
	@ 1,15 GET m.remito PICT "@!";
	MESS 'Ingrese N§ de Remito [ENTER] p/menu'
	READ
	M.remito=Q_FAC(M.remito)
	@ 1,15 GET m.remito PICT "@!"
	CLEA GETS
	IF RIGHT(M.remito,8)#'00000000'
		STOR NUL TO respuesta
		IF !EMPTY(eliPRO(' [ESC] para Men£ ',2,25))
			NADA=PRO.PROVEEDOR
			@ 2,15 GET NADA
			CLEA GETS
			=RELEWIN("WIN")
			SELE REC
		RETURN SEEK(M.remito+PRO.PROCOD)
	ENDIF
else
	=relewin("WIN")
return .F.
ENDIF
RETURN !relewin("WIN")
