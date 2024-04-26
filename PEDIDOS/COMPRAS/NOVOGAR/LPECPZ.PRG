********************************************************************************
*-- Programa: LPECPZ.PRG
*-- Fecha   : 08-27-92 05:53pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE NOTAS DE PEDIDO DE COMPRA
*-- VERSION NOVOGAR
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   DIME TTL[CANT_MAX]
   HAY=.F.
   STORE PAIP TO TT,ACLA,ELPRO
   =LPECPZ0()
   =WIN0()
   PAG=1
   =CABPAN()
   STOR NUL TO CASOS
   =TIT_LIN(1)
   SCAN
      IF ROW()>21 .OR. PRO.PROCOD#ELPRO
         IF !FIN_LIN(1,NUL)
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         =TIT_LIN(2)
         IF PRO.PROCOD#ELPRO
            ELPRO=PRO.PROCOD
         ENDIF
      ENDIF
      =LPECPZ1()
   ENDSCAN
   =FIN_LIN(2,CASOS)
   =RELEWIN("WIN")
   =IAUD(FISC)
   =REOPPEC()
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
