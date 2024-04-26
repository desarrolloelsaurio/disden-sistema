*********************************************************************************
*-- Programa: LALQP.PRG
*-- Fecha   : 04-21-92 02:43pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A LISTADOS DE ALQUILERES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE '' TO acla,LINEA,TT,CASOS
	 =LALQP0()
   =win0()
   pag=1
   =cabpan()
   =TIT_LIN(1)
   SCAN FOR &FISC
      IF ROW()>21
         IF !FIN_LIN(1,NUL)
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         =TIT_LIN(2)
      ENDIF
      =LALQP1()
   ENDSCAN
   =REOPINM()
   =IAUD(FISC)
   =FIN_LIN(2,CASOS)
   =RELEWIN("win")
ELSE
   =iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
