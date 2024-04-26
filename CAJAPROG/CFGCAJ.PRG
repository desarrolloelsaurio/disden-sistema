*******************************************************************************
*-- Programa: CFGcaj.PRG
*-- Fecha   : 02-25-92 06:34pm
*-- Version : G. REINER
*-- Notas   : CONFIGURA LISTADO
********************************************************************************
FUNCTION CFGcaj
=movewin(1,10,6+CANT_MAX,18+aR_MAXAN(@texto),'win'," Campos a Listar ","Marque el que desee incluir")
STORE ' ' TO NADA
FOR A=1 TO CANT_MAX
   IF HABILITADO[A]
      V='VA'+ALLTRIM(STR(A))
      STORE 'Imprime Campo de '+texto[a,1]+' ?' TO &V
      @ a,2 get variable[a] pict texto[a,1] func '*C' MESS &V
   ELSE
      @ a,2 get variable[a] pict texto[a,1] func '*C' DISA
   ENDIF
endf
@ a+1,10 GET NADA pict '@* Acepta Campos' DEFA 0 MESS '[ENTER] Confirma el Listado - [ESC] Fin'
A=1
read cycle
=RELEWIN("WIN")
FOR A=1 TO CANT_MAX
   if variable[a]
      exit
   endif
endF
=men_lin(BOTOM)
RETURN A<=CANT_MAX .and. last()#27
