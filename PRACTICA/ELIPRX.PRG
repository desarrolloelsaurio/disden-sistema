*****************************************************************************
*-- Programa: ELIPRX.PRG
*-- Fecha   : 10-20-92 01:41am
*-- Version : G. REINER
*-- Notas   : ELIGE SUBCODIGO DE PRACTICA
*-- Modificaci¢n GOYO 05-30-92 11:06am (elimix - saco ventana interm)
********************************************************************************
FUNCTION eliPRX
PARA msg,r1,c1,SUBC
SUBC=IIF(EMPTY(SUBC),M.CODPRA,SUBC)
SELE PRX
store NUL to respuesta
IF PRAPOP
   =DOTALK()
   SET ORDER TO
   SORT ON CODPRX FOR CODPRA=SUBC TO TEMPO
   SELE 0
   USE TEMPO
   =DEFPOGRL(2,40,"PRXPOP","TEMPO.CODPRX",15,"Seleccione Subc¢digo")
   =UNTALK()
   ACTI POPUP PRXPOP 
   STOR !empty(respuesta) TO respuesta
   IF RESPUESTA
      SELE PRX
      SET ORDER TO TAG CODPRX 
      IF !SEEK(SUBC+TEMPO.CODPRX)
         STORE .F. TO RESPUESTA
      ENDIF
   ENDIF
   USE IN TEMPO
   ERASE TEMPO.DBF
ELSE
   respuesta=ELIMIX1('Pr ctica '+msg,'MED','CODPRA',10)
ENDIF
RETURN respuesta
