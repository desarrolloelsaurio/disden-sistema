*********************************
*-- Programa: MUTUAL
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*********************************
EXTERNAL PROCEDURE MUXOK
=CABPAN1()
MUT_DIJO=ALLTRIM(PROMPT())
DO OPPER
DO OPUNI
DO CASE
case MUT_DIJO='Unidades'
   DO UNI
case MUT_DIJO='Tipos de Arancel'
   DO TAR
case MUT_DIJO='Tipos de Facturaci¢n'
   DO TFA
case MUT_DIJO='Aranceles'
   DO OPARA
   DO ARA
CASE MUT_DIJO='Mutuales'
   do opmed
   do opmut
   DO IMUT.SPR WITH .T.
CASE MUT_DIJO='Planes'
   do opmut
   DO IMUT_PLA.SPR WITH .F.,.F.,.F.," Planes ",.T.
CASE MUT_DIJO='Porcentajes'
   do opmut
   G_GRABA="MUXOK()"
   DO IMUT_POR.SPR WITH .F.,.F.,"MUX"," Porcentajes ",.T.
   RELE G_GRABA
case MUT_DIJO='Legajo'
   do opmut
   DO IMUT_LEG.SPR WITH .F.,.F.,.F.," Legajo ",.T.
ENDCASE
RETURN MEN_LIN(BOTOM)
