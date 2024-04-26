FUNCTION EJEPAG
PARAMETER QTIPO,LOHACE
IF _PLINENO>66 .OR. ;
	C>60 .OR. ;
	LOHACE
   ? REPL("-",IIF(QTIPO=48,76,IIF(QTIPO=4,129,121)))
   DO LINF WITH 66
   store NPAG+1 to NPAG
   store 1 to C
   do case
   case QTIPO=1
      DO TIT1
   case QTIPO=4
      DO TIT4
   case QTIPO=48
      DO TIT48
   ENDcase
endif
RETURN
