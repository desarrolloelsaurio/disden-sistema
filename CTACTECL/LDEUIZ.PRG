********************************************************************************
*-- Programa: LDEUIZ.PRG
*-- Fecha   : 06-17-92 09:44am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE DEUDA PENDIENTE POR IMPRESORA
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
   dime ttl[CANT_MAX],ctrl[CANT_MAX],PTL[CANT_MAX]
   STORE .F. TO hay,ACLA,LINEA,ELCLI,TT
   stor nul TO casos
   =LDEUPZ0()
   =CABPRI()
   _PCOPIES=1
   PRINTJOB
      =cabpri1()
      =TIT_(3)
      ? ALLTRIM(ELCLI)
      =_LIN(.T.)
      SCAN
         IF CLIENTE#ELCLI .AND. HAY
            IF HAY
               ? LINEA
               ? FIN_SUM(ALLTRIM(ELCLI),@PTL)
               ? LINEA
            ENDIF
            ELCLI=CLIENTE
            STORE 0 TO PTL[5]
            ?
            ? ALLTRIM(ELCLI)
            =_lin(.t.)
         ENDIF
         =LDEUPZ1()
      ENDSCAN
      IF HAY
         ? LINEA
         ? FIN_SUM(ALLTRIM(ELCLI),@PTL)
         ? LINEA
      ENDIF
      =IIF(HAY,FIN_LIN(4,CASOS,FIN_SUM('SUBTOTAL',@TTL)),FIN_LIN(4,CASOS))
   ENDP
   =FINIMP()
   =iaud(FISC)
   =REOPCCL()
ELSE
   =iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
