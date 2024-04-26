****************************************************************************
*-- PROGRAMA: LCOSP.PRG
*-- FECHA   : 11-20-92 11:50am
*-- VERSION : G. REINER
*-- NOTAS   : LISTADO DE MERCADERIAS
*-- MODIFICACI¢N GOYO 05-29-92 00:45AM (REEMP ORDER TAG ORDMER POR ART¡CULO)
*-- Modificaci¢n GOYO 11-05-92 11:39am (lmer->lsto)
*-- VERSION TAPIPLAST - LISTADO DE COSTOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   STOR 1 TO CASOS,PAG,RUB1,SRUB1
   STOR "" TO ACLA,m.LINEA,TT,HAY

   =LCOSP0()
   =WIN0()
   =CABPAN()
   =TIT_(1)
   =LP_P2()
   =_LIN(.T.)
   SCAN
      IF ROW()>21
         IF !FIN_LIN(1,NUL)
            EXIT
         ENDIF
         =LP_CHRUB(.T.)
         =LP_NPAGE()
      ELSE
         IF LP_CHRUB(.T.)
            =LP_NPAGE()
         ENDIF
      ENDIF
      =LCOSP1()
   ENDSCAN
   =FIN_LIN(2,CASOS)
   =RELEWIN("WIN")
   =IAUD(FISC)
   =REOPMER()
ELSE
   =IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
