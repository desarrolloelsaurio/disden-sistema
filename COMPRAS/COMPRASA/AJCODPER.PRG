FUNCTION AJCODPER
PARAMETER AJ_COD,AJ_ZEROS,AJ_FILTRO
IF EMPTY(VAL(AJ_COD)) .AND. ;
   AJ_COD#"0"
   AJ_COD=PADL(ALLTRIM(AJ_COD),AJ_ZEROS)
   AJ_FILTRO=AJ_FILTRO+AJ_COD
ELSE
   AJ_FILTRO=AJ_FILTRO+ZERO(VAL(AJ_COD),AJ_ZEROS)
ENDIF
RETURN AJ_FILTRO
