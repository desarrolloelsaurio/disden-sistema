* 浜様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : DESFAC3.PRG                  �
* � COMENTARIO    : DESAUTOR FACTURA DE TERCEROS �
* 麺様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                     �
* � FECHA      : 06-19-94                        �
* � HORA       : 08:24:34pm                      �
* � COPYRIGHT  : 1994 by GREGORIO REINER         �
* 藩様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION DESFAC3
	PARAMETER PORFECHA
	ULPR=PROGRAM()
	=HORA_ULP(PROGRAM())
	IF CHEQSEG()
		IF ESJEFE()
			#DEFINE ESCAFIN " - [ESC] para Fin"        && ESCAFIN
			#DEFINE NUL    0                           && NUL
			#DEFINE BOTOM  "  "+repl("�",78)           && BOTOM
			STORE {} TO M.FECINI
			IF PORFECHA
				M.FECINI=INFEC("WIN","Fecha l�mite para el Listado")
			ELSE
				STORE NUL TO RESPUESTA
			ENDIF
			IF (!PORFECHA .AND. ELIPRP("",-1,1)) .OR. ;
				(PORFECHA .AND. !EMPTY(M.FECINI))
				SELE CCP
				ON KEY LABEL ENTER DO AUTFAC31
				=MEN_LIN("Desautoriza Facturas de Proveedores - [ENTER] Desautoriza"+escafin)
				=MOVECENT(nul,nul,12,IIF(PORFECHA,79,58),"WIN",;
				IIF(PORFECHA," Factura de Proveedores hasta el "+dtoc(m.fecini)+" " ," Facturas de "+alltrim(per.cliente))+;
				" ")
				STORE NUL TO TOTAUT
				IF PORFECHA
				BROW FIELD ;
				FECHAVE:H="VENCIM.":R,;
				PROPIETARIO=SAYPER(CCP.PROCOD,"PRPCOD",20):R:H=PADC("PROPIETARIO",20),;
				DETALLE:R,;
				MONTO:P="99,999.99":R,;
				COSA=IIF(AUTORIZ,"AUT","---"):H="AUT",;
				COSA1=" ":H="*" ;
				FREEZE COSA1 FOR ;
				CCP.FECHAVE<=M.FECINI .AND. ;
				AUTORIZ .AND. ;
				!PAGADA ;
				WIND WIN
					ELSE
				BROW FIELD ;
				FECHAVE:H="VENCIM.":R,;
				DETALLE:R,;
				MONTO:P="99,999.99":R,;
				COSA=IIF(AUTORIZ,"AUT","---"):H="AUT",;
				COSA1=" ":H="*" ;
				FREEZE COSA1 FOR ;
				PROCOD=PER.CODCLI .AND. ;
				AUTORIZ .AND. ;
				!PAGADA ;
				WIND WIN
				ENDIF
				ON KEY LABEL ENTER
				=RELEWIN("WIN")
			ENDIF
		ELSE
			=NOSOSJEF()
			=IAUDI()
		ENDIF
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)
