********************************************************************************
*-- Programa: cligrl.PRG
*-- Fecha   : 09/12/91 12:34pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP cligrl
********************************************************************************
* VERSION RAFULS *
******************
function cligrl
PARAMETER R,C,t,DEAUNO
IF SSTM2="EXPENSAS"
C_SINGULAR="Consorcista"
C_PLURAL="Consorcistas"
endif
respuesta='cligrl#'+str(R)+'#'+str(C)+'#'+t+'#3;
#\<Todos los '+C_PLURAL+;
'#Por \<Localidad'
IF SSTM2="EXPENSAS"
   RESPUESTA=RESPUESTA+'#Un \<Consorcio'
ENDIF
IF DEAUNO
   RESPUESTA=RESPUESTA+'#\<Un '+C_SINGULAR
ENDIF
=DEFPOP()
UNLO ALL
RETURN .T.
