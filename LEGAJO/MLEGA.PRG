FUNCTION MLEGA
PARAMETER LEG_MENS,LEG_MENS1,LEG_CAMBI,LEG_CLOSE,LEG_CAMPO
LEG_CAMPO=iif(TYPE("LEG_CAMPO")='L',"LEGAJO",LEG_CAMPO)
ON KEY LABEL TAB KEYBOARD CHR(23)
LEG_PARAM=PARAMETER()
IF !EMPTY(LEG_PARAM)
   =MEN_LIN(LEG_MENS)
   =MOVEWIN(10,4,20,76,'LEGAJO',LEG_MENS1)
ENDIF
ACTI WIND LEGAJO
IF LEG_CAMBI
   MODI MEMO (LEG_CAMPO) WIND LEGAJO
ELSE
   IF LEG_CLOSE
      MODI MEMO (LEG_CAMPO) noedit NOWAIT WIND LEGAJO
   ELSE
      MODI MEMO (LEG_CAMPO) noedit WIND LEGAJO
   ENDIF
ENDIF
CLOSE MEMO (LEG_CAMPO)
IF !EMPTY(LEG_PARAM) .AND. !LEG_CLOSE
=RELEWIN("LEGAJO")
ENDIF
ON KEY LABEL TAB
RETURN .T.
