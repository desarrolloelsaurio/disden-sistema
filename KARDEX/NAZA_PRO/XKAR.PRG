********************************************************************************
*-- Programa: XKAR.PRG
*-- Fecha   : OCR 1993
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE KARDEX
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
    =WORKING()
    =DOTALK()
	STORE "" TO TX
	SELE kar
	=FLOCK() .OR. FLOK()
    =MEN_LIN('Generando Nuevo Indice de Kardex')
    USE
    =OPKAR()X
    PACK
    Index ON FECHAOP tag FECHAOP
    Index ON ARTICULO tag ARTICULO
    =REOPKAR()
    =iaud("RECONSTRUYE INDICE")
    =UNTALK()
    =UNWORK()
ELSE
	=iaudi()
ENDIF
RETURN
