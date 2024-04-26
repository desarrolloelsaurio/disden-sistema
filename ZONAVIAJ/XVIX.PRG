****************************************
*-- Programa: XVIX.PRG
*-- Fecha   : 06/12/91 04:10pm
*-- Version : R. 'EL BATA'
*-- Notas   : RESTAURA BASE DE ZONA DE VIAJANTES
*-- Modificacion GOYO 06-02-93 09:48pm
*****************************************
ulpr=hora_ulp(PROGRAM())
if cheqseg()
	stor "" TO tx
=men_lin('Generando Nuevo Indice de Zonas de '+biajas)	
		=dotalk()
	IF USED("VIX")
        sele vix
		=FLOCK("VIX") .OR. flok("VIX")		
		USE
    ENDIF
		DO OPVIXX
		SELE VIX
		INDEX ON CODVIA TAG CODVIA
		IF TYPE("ZONA")="N"
		INDE ON codvia+STR(marca)+zona TAG VIAJADAT		
		ELSE
		INDE ON codvia+marca+zona TAG VIAJADAT
		ENDIF
		UNLO IN vix
		=REOPVIX()
		=untalk()
    	=iaud("RECONSTRUYE INDICE")
else
	=iaudi()
endif
RETURN
