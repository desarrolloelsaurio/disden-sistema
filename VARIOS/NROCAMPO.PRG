FUNCTION NROCAMPO
PARAMETER NCPO_CAMPO,NCPO_ALIAS
PRIVATE NCPO_ALANT,NCPO_PUNTERO
NCPO_ALIAS=IIF(EMPTY(NCPO_ALIAS),ALIAS(),NCPO_ALIAS)
NCPO_CAMPO=UPPER(NCPO_CAMPO)
NCPO_ALANT=ALIAS()
SELE (NCPO_ALIAS)
NCPO_FCOUNT=FCOUNT()
FOR NCPO_PUNTERO=1 TO NCPO_FCOUNT
   IF FIELD(NCPO_PUNTERO)=NCPO_CAMPO
      EXIT
   ENDIF
NEXT
IF !EMPTY(NCPO_ALANT)
   SELE (NCPO_ALANT)
ENDIF   
RETURN IIF(NCPO_PUNTERO>NCPO_FCOUNT,0,NCPO_PUNTERO)