#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE PAIP   "|"                               && PAIP
PROCEDURE LDESN
PARA PORPAN
EXTERNAL PROCEDURE LDESNA.PRG
	ULPR=HORA_ULP(PROGRAM())
	=OPTELS()
	=OPAVIS()
	DO CASE
	CASE BAR()=1
		DO IMER_DO.SPR WITH .F.," Lista Despiece Completo  ",8,.T.
	CASE BAR()=2
		DO IMER_DO.SPR WITH .F.," Lista Despiece Enumerado ",9,.T.
	CASE BAR()=3
	   DO TELS
	CASE BAR()=4
      DO AVIS
    CASE BAR()=5
   	   DO IMER_DO.SPR WITH .F.," Lista Despieces Existentes ",30
	ENDCASE
RETURN MEN_LIN(BOTOM)
