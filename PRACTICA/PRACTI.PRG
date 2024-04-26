******************************************************************************
*-- Programa: PRACTI
*-- Fecha   : 09-27-92 10:13am
*-- Version : G. REINER
*-- Notas   : MENU DE PRACTICAS
********************************************************************************
=CABPAN1()
DIJO=ALLTRIM(PROMPT())
RNN=BAR()+3
RNN=IIF(RNN>9,9,RNN)
DO CASE
case DIJO='Grupo de Pr ctica'
   do opgru
   DO GRL WITH RNN,35,'Men£ de Grupos de Pr ctica'
   ON SELE POPU grl DO gru
   ACTI POPU grl
   RELE POPU grl
case DIJO='Tipo de Pr ctica'
   do opTPR
   DO GRL WITH RNN,35,'Men£ de Tipos de Pr ctica'
   ON SELE POPU grl DO tpr
   ACTI POPU grl
   RELE POPU grl
case dijo='Material Base'
   do opmba
   DO GRL WITH RNN,35,'Men£ de Material Base'
   ON SELE POPU grl DO mba
   ACTI POPU grl
   RELE POPU grl
CASE DIJO='Pr cticas'
   DO OPGRU
	 DO OPPRA
	 DO GRL WITH RNN,35,'Men£ de Pr cticas'
   ON SELE POPU grl DO pra
   ACTI POPU grl
	 rele popu grl
CASE DIJO='Componentes'
   DO OPGRU
	 DO OPPRA
	 DO GRL WITH RNN,35,'Men£ de Componentes de Pr cticas'
   ON SELE POPU grl DO prx
   ACTI POPU grl
	 rele popu grl
ENDCASE
=MEN_LIN(BOTOM)
RETURN

