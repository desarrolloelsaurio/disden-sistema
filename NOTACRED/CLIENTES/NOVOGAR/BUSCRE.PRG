********************************************************************************
*-- Programa: BUSFAC.PRG
*-- Fecha   : 12-16-91 09:00pm
*-- Version : g. reiner
*-- Notas   : devuelve variables para trabajo con FACTURAS
*-- Modificaci¢n GOYO 07-23-92 01:11am marca . empresa
*-- VERSION NOVOGAR
********************************************************************************
function BUSCRE
	PARAMETER LALETRA
	PRIVATE LALETRA
	=movewin(iremr,iremc,iremr+5,iremc+50,'win'," Notas de Cr‚dito ")
	SCAT MEMV BLAN
	SALIDA=.F.
	@ 1,1 SAY "N§ NOTA CRED: "
	@ 2,1 SAY "Empresa     : "
	store SPACE(14) to m.factura
	@ 1,25 GET m.FACTURA PICT "@!";
	MESS 'Ingrese Nro de Nota de Cr‚dito [ENTER] p/menu'
	READ
	M.FACTURA=IIF(EMPTY(AT('-',M.FACTURA)),SUCU+'-'+ALLTRIM(M.FACTURA),M.FACTURA)
	M.FACTURA=Q_FAC(M.FACTURA)
	IF LAST()=27 .OR. LEFT(M.FACTURA,8)='00000000'
		SALIDA=.F.
	ELSE
	    LALETRA=IIF(TYPE('LALETRA')#'C',LEFT(M.FACTURA,1),LALETRA)
		M.FACTURA=IIF(LEFT(M.FACTURA,1)=LALETRA,M.FACTURA,LALETRA+ALLTRIM(M.FACTURA))
		@ 1,25 GET M.FACTURA
		@ 2,25 GET JANNAME 
		CLEA GETS
		SALIDA=XSEEK(M.FACTURA,'FAC',IIF(LALETRA='A',"FACTURAA","FACTURAB"))
		IF SALIDA
			if FAC.TIPO#'NC'
				do cartel2 with 'El documento buscado fue encontrado',;
				'pero no es una NOTA DE CREDITO',;
				'sino una '+iif(fac.tipo='ND','Nota de D‚bito','Factura'),;
				'Por favor reintente'
				SALIDA=.F.
			endif
		ENDIF
	ENDIF
	=relewin("WIN")
return SALIDA
