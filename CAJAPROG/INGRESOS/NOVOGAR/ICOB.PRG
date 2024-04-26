*****************************************
*-- Programa: ICOB.PRG
*-- Fecha   : 04-12-92 11:42am
*-- Version : G. REINER
*-- Notas   : INGRESA COBROS
*****************************************
PARAMETER ENCUOTAS,XPENSAS
ULPR=hora_ulp(PROGRAM())
IF CHEQSEG()
   =OPGAS()
   VEZ=1
   =IIF(SSTM1#"ADMIN",OPFAC(),IIF(XPENSAS,OPCNS(),OPINM()))
   =OPCCL()
   =OPCCH()
   =IIF(SSTM1#"ADMIN" .OR. XPENSAS,ICOB_1(.T.),ICOB_ALQ(.T.))
   UNLO ALL
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
