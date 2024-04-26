********************************************************************************
*-- Programa: FUNCION MINUS.
*-- Fecha   : 11/04/90 11:52am
*-- Version : G. REINER
*-- Notas   : DEVUELVE LA POSICION DE LA PRIMERA MINUSCULA EN EL STRING
********************************************************************************
FUNCTION minus
PARAMETER cs
FOR re=AT(' ',cs) TO LEN(cs)
   IF ISLOWER(SUBSTR(cs,re)) .OR. ASC(SUBSTR(cs,re))>122
      EXIT
   ENDIF
NEXT
RETURN(re-1)
