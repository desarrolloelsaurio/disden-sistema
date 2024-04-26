* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SCCL0.PRG                            บ
* บ COMENTARIO    : GESTION DE SALDO DE CTA CTE CLIENTES บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                             บ
* บ FECHA      : 12-08-93                                บ
* บ HORA       : 06:39:56pm                              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                 บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
SCCL_DIJO=ALLTRIM(PROMPT())
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
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
