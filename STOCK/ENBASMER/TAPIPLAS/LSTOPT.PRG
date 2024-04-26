****************************************************************************
*-- PROGRAMA: LSTOPT
*-- FECHA   : 11-01-92 05:39PM
*-- VERSION : G. REINER
*-- NOTAS   : LISTADO DE MERCADERIAS
*-- MODIFICACI¢N GOYO 05-29-92 00:45AM (REEMP ORDER TAG ORDMER POR ART¡CULO)
*-- Modificaci¢n GOYO 11-05-92 11:39am (lmer->lsto)
*-- VERSION TAPIPLAST - LISTADO GENERAL
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   STOR 1 TO CASOS,PAG,RUB1,SRUB1
   STOR "" TO ACLA,m.LINEA,TT,HAY

   DIME ttl[CANT_MAX],ctrl[CANT_MAX],GTL[CANT_MAX],RTL[CANT_MAX]
   STORE .F. TO CTRL
   STORE NUL TO ttl,GTL,RTL
   =LSTOP0()
   =WIN0()
   =CABPAN()
   =TIT_(1)
   =LP_P2()
   =_LIN(.T.)
   SCAN
      IF ROW()>21
         IF !FIN_LIN(1,NUL,fin_sum("SUBTOTAL",@TTL))
            EXIT
         ENDIF
         =LP_CHRUB()
         =LP_NPAGE()
      ELSE
         IF LP_CHRUB()
            =LP_NPAGE()
         ENDIF
      ENDIF
      =LstoP1()
   ENDSCAN
   =FIN_LIN(1,NUL,fin_sum(SRUB1,@TTL),.T.)
   =FIN_LIN(1,NUL,fin_sum(RUB1,@RTL),.T.)
   =FIN_LIN(2,CASOS,fin_sum("TOTAL",@GTL))
   =RELEWIN("WIN")
   =IAUD(FISC)
   =REOPMER()
ELSE
   =IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
