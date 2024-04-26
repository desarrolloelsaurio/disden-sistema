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
case DIJO='Grupo de Pr cticas'
   do opgru
   do gru
case DIJO='Tipo de Pr ctica'
   do opTPR
   do TPR
CASE DIJO='Pr cticas'
     DO OPGRU
	 DO OPPRA
	 respuesta='PRAX#5#30#Gesti¢n de Pr cticas#3;
#\<Datos Generales;
#\<Componentes Pr cticas;
#C\<omponentes;
#\<Instrucciones al Paciente'
=defpop()
ON SELE POPU PRAX DO PRA
ACTI POPU PRAX
RELE POPU PRAX
CASE DIJO='Lista de Precios'
respuesta='PRAX#5#30#Gesti¢n de Pr cticas#3;
#Li\<stados por Pantalla;
#Lis\<tados por Impresora'
=DEFPOP()
ON SELE POPU PRAX DO LPRA
ACTI POPU PRAX
RELE POPU PRAX
 ENDCASE
RETURN MEN_LIN(BOTOM)

