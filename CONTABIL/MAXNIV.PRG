FUNCTION MAXNIV
PARAMETER CINI,CFIN
IF USED("BAL1")
   SELE BAL1
ELSE
   SELE BAL
ENDIF  
CALC MAX(NIVEL) FOR ;
  IMPUTABLE="N" .AND. ;
  CODIGO >=CINI .AND. ;
  CODIGO <= FINAL TO MNIV
RETURN MNIV
