*******************************************************************************
*-- Programa: lkarI.prg
*-- Fecha   : 06/21/91 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A listados DE kardex
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STORE "" TO LINEA,ACLA,TENK,TSAK,TENU,TSAU,CASOS,TTOK,TTOU
	=LKARP0()
   =cabpri()
   _PCOPIES=1
   PRINTJOB
   =cabpri1()
   =TIT_LIN(3)
   SCAN
         IF _PLINENO>63
            =FIN_LIN(3,NUL,LKARP2("SUBTOTAL"))
            =cabpri1()
            =TIT_LIN(4)
         ENDI
         =lkarp1()
      ENDSCAN
      =FIN_LIN(4,CASOS,LKARP2("TOTAL"))
   ENDP
   =FINIMP()
   =iaud(fisc)
   =reopkar()
   SET EXAC ON
ELSE
   =iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
