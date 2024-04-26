******************************************************************************
*-- Programa: lprei3.prg
*-- Fecha   : 09/11/91 05:10pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE lista de precios por pantalla
*******************************************************************************
function lprei2

#DEFINE NUL    0                                 && NUL

ttu='Todos los Precios'
RELE NADA,ALGO
DIME NADA[5],ALGO[4]
NADA[1]=XALIS1
NADA[2]=XALIS2
NADA[3]=XALIS3
NADA[4]=XALIS4
nada[5]='Lista Calculada'
STORE NUL TO LIS1,LIS2
=movewin(3,10,10,60,'win','Listas a Listar')
@ 1,1 SAY "Porcentaje"
@ 2,1 SAY "Sobre Lista"
@ 3,1 SAY "Denominaci¢n"
@ 4,1 SAY "Confirma"
STORE NUL TO RESPUESTA,SOBRECUAL,PORCENTAJE
STORE '' TO NOM_LISTA
PORCENTAJE=PREGUNTA("PORCENTAJE DE LA LISTA",.T.,10,0,'9999.99')
@ 1,18 SAY PORCENTAJE PICT '9999.99'
IF !EMPTY(PORCENTAJE)
   DIME NADA[4]
   SOBRECUAL=POP_LIST(5,20,@NADA,'SOBRE QU‚ LISTA CARGO EL PORCENTAJE ? ')
   @ 2,18 SAY NADA[SOBRECUAL]
   STORE SPACE(20) TO RESPUESTA
   NOM_LISTA=PREGUNTA("Denominaci¢n de la Lista",.t.,10,0,'!!!!!!!!!!!!!!!!!!!!')
   @ 3,18 SAY NOM_LISTA
   IF EMPTY(NOM_LISTA) .OR. EMPTY(PORCENTAJE) .OR. EMPTY(SOBRECUAL)
      =RELEWIN("WIN")
      STORE NUL TO PORCENTAJE
   ELSE
      STORE IIF(CONFIRMA('',.F.,4,1),PORCENTAJE,NUL) TO PORCENTAJE
   ENDIF
ELSE
   =RELEWIN("WIN")
ENDIF
RETURN PORCENTAJE
