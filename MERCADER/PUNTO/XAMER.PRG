********************************************************************************
*-- Programa: xamer
*-- Fecha   : 11-08-91 07:02pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA forma de trabajo de popup de mercader¡a
********************************************************************************
ulpr=hora_ulp(PROGRAM())
=movewin(7,12,11,64,'win',' Tipo de Popup de Mercader¡a ')
@ 1,1 SAY 'TIPO DE POPUP DE MERCADERIA' COLO SCHE 3
vez=1
nada=iif(merpop1,'Completo','Parcial ')
DO WHILE vez=1
   vez=2
   @ 1,28 GET nada PICTURE '@M Completo,Parcial';
      MESS 'Tipo de Popup de Selecci¢n de Mercader¡a'
   READ
   merpop1=(nada='C')
ENDDO
RETURN RELEWIN('win') .AND. men_lin(botom)
