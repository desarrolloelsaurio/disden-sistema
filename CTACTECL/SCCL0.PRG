* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : SCCL0.PRG                            �
* � COMENTARIO    : GESTION DE SALDO DE CTA CTE CLIENTES �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                             �
* � FECHA      : 12-08-93                                �
* � HORA       : 06:39:56pm                              �
* � COPYRIGHT  : 1993 by GREGORIO REINER                 �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様夕
SCCL_DIJO=ALLTRIM(PROMPT())
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE SCCL_DIJO="Salda Cta. Cte (Clientes en 0)"
   DO CCLH0
CASE SCCL_DIJO="Salda por Partida"
    DO CLI
CASE SCCL_DIJO="Borra Cliente Contado"
    DO SCCLCTDO.SPR
CASE SCCL_DIJO="Calcula Saldo Anterior"
	DO SCCLA.SPR
ENDCASE
RETURN MEN_LIN(BOTOM)
