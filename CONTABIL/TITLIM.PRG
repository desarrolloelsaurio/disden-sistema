FUNCTION TITLIM
PARAMETER ARR_COL
ARR_TXT=""
IF MLIM=2
   if inicio>9999999
      IF INICIO=FINAL
         ? PADC("Cuenta:"+alltrim(saynom(inicio))+" ("+str(inicio,8)+")",ARR_COL)
      else
         arr_txt="Entre Cuentas "+alltrim(saynom(inicio))+" ("+str(inicio,8)+") y "+;
           alltrim(saynom(final))+" ("+str(final,8)+")"
         ? padc(arr_txt,ARR_COL)
      endif
      C=C+1
   endif
ENDIF
RETURN .T.
