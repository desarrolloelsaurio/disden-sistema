*:*********************************************************************
*-- Programa: ctacte.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*:*********************************************************************
ulpr=PROGRAM()
=cabpan1()
CT_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE CT_DIJO="Genera Deuda"
	  =OPCLI()
     DO OPCNX
     do optix
     do optip
     do opcns
	  =OPCCL()
     store nul to respuesta
     if !EMPTY(elicns('a Generar',1,1))
        do opliq
        do opres
        do mliq3
     endif
CASE CT_DIJO="Estado de Cuenta por Pantalla"
DO OPCNS
DO OPCNX
=OPCIU()
=OPCCH()
=OPCCL()
=OPCLI()
=cclgrl(7,20)
ON SELE POPU nada DO ctactec1 WITH .T.
ACTI POPU nada
RELE POPU nada
CASE CT_DIJO="Estado de Cuenta por Impresora"
DO OPCNS
DO OPCNX
=OPCIU()
=OPCCH()
=OPCCL()
=OPCLI()
=cclgrl(7,20)
ON SELE POPU nada DO ctactec1
ACTI POPU nada
RELE POPU nada
ENDCASE
RETURN men_lin(botom)
