********************************************************************************
*-- Programa: CONFIRMA.PRG
*-- Fecha   : 06/06/91 05:31pm
*-- Version : G. REINER
*-- Notas   : FUNCION DE CONFIRMACION - DEVUELVE .T. O .F.
* V= VENTANA ?
********************************************************************************

FUNCTION confirma
PARAMETER m.con_texto,v,R,C,ALVESRE
PRIVATE m.con_texto,V,R,C
LAVENTA=WONTOP()
STORE IIF(ALVESRE,"NO","SI") TO M.respuesta
IF v
   ACTI SCRE
   lg=len('Confirma '+m.con_texto+' ? ')+8
   =MOVEWIN(R,C,R+4,c+lg,'FIc'," Confirma ? ")
   store 1 to r,c
Endif
@ R,C SAY 'Confirma '+m.con_texto+' ? ' GET respuesta PICTURE '@M SI,NO' MESS 'Confirma '+m.con_texto+' ? '
READ
IF LASTKEY()=27
   STORE 'NO' TO respuesta
ENDIF
IF v
   =RELEWIN('fic')
   IF !EMPTY(LAVENTA)
   ACTI WIND (LAVENTA)
   ENDIF
ENDIF
RETURN respuesta="SI"
