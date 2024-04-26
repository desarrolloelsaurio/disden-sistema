*********************************************************************************
*-- Programa: VARIAB.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : MENU VARIABLES DEL SISTEMA
********************************************************************************
=CABPAN1()
PRA_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE PRA_DIJO='Datos Generales'
DO IPRA.SPR WITH .T.
CASE PRA_DIJO='Componentes Pr cticas'
   DO OPMUT
   DO PRX_PRA.SPR WITH .F.,.F.,"PRX",.F.,.T.
CASE PRA_DIJO='Componentes'
   DO OPMUT
   DO PRX.SPR WITH .F.,.F.,"PRX",.F.,.T.
CASE PRA_DIJO='Instrucciones al Paciente'
   DO IPRA_LEG.SPR WITH .F.,.F.,.F.,.F.,.T.
ENDCASE
UNLO ALL
RETURN MEN_LIN(BOTOM)
