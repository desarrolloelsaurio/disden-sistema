* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LIMPINT.PRG                                              �
* � COMENTARIO    :                                                          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-24-94                                                    �
* � HORA       : 11:55:46am                                                  �
* � COPYRIGHT  : 1994 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
PARAMETER PORPAN
* PLANTEA SELECCION
FI_DIJO=ALLTRIM(PROMPT())
DO GRL2 WITH 8,45,'L�mites del Listado'
ON SELE POPU NADA DO RESP1
ACTI POPU NADA
RELE POPU NADA
* SELECCIONADO
DIJO=ALLTRIM(PROMPT())
TT=''
FISC=QWMER(BAR())
IF FISC#".F."
    DO CASE
    CASE FI_DIJO='Productos con Impuesto Interno'
    FISC="!EMPTY(IMPINT) .AND. "+FISC
    TT=TT+;
    CRLF+;
    "Productos con Impuestos Internos"
CASE FI_DIJO='Productos sin Impuesto Interno'
    FISC="EMPTY(IMPINT) .AND. "+FISC
    TT=TT+;
    CRLF+;
    "Productos sin Impuestos Internos"
CASE FI_DIJO='Por Porcentaje de Impuesto Interno'
    store nul to respuesta
    elim=infic("Porcentaje a Listar",100)
    if last()#27 .and. ;
    !empty(m.respuesta)
    TT=TT+;
    CRLF+;
    "Productos con Impuestos de "+alltrim(str(m.respuesta))+" %"
    FISC="IMPINT="+alltrim(str(respuesta))+" .AND. "+FISC       
    else
    fisc=".F."
    endif
    ENDCASE
    if fisc#".F."
    STORE "" TO M.ACLA,M.LNS
    STORE NUL TO M.CASOS
	=LMERM0(.T.,"RUB.PALISTAR,MI1.TEXTO1,MER.ARTICULO,MER.MERCA,MER.MARCA,MER.IMPINT","LIMPINT")
	TT='Listado de Mercader�as'+chr(13)+chr(10)+tt
	SELE MER
	=IIF(PORPAN,LIMPINTP(),LIMPINTI())
	ENDIF
ENDIF
RETURN
