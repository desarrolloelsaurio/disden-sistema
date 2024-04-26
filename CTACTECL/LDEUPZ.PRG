********************************************************************************
*-- Programa: LDEUPZ.PRG
*-- Fecha   : 06-17-92 09:44am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE DEUDA POR PANTALLA
********************************************************************************
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
STORE PROGRAM() TO ULPR
IF CHEQSEG()
   dime ttl[CANT_MAX],ctrl[CANT_MAX],PTL[CANT_MAX]
   STORE .F. TO hay,ACLA,LINEA,ELCLI,TT
   stor nul TO casos
   =LDEUPZ0()
   =WIN0()
   pag=1
   =cabpan()
   tt='Listado de Deuda Pendiente Clientes'+;
     CRLF+;
     TTQUE+;
     CRLF+;
     ALLTRIM(ELCLI)
   =tit_lin(1)
   SCAN
      IF CLIENTE#ELCLI .AND. HAY
         IF !FIN_LIN(1,NUL,FIN_SUM(ALLTRIM(ELCLI),@PTL))
            EXIT
         ENDIF
         ELCLI=CLIENTE
         STORE 0 TO PTL[5]
         tt='Listado de Deuda Pendiente Clientes'+CHR(10)+CHR(13)+TTQUE+CHR(13)+CHR(10)+ALLTRIM(ELCLI)
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         =tit_lin(1)
      ENDIF
      IF ROW()>21
         IF HAY
            IF !FIN_LIN(1,NUL,FIN_SUM('SUBTOTAL',@TTL))
               EXIT
            ENDIF
         ELSE
            IF !FIN_LIN(1,NUL)
               EXIT
            ENDIF
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         =tit_lin(2)
      ENDIF
      =LDEUPZ1()
   ENDSCAN
   if last()#27
      IF HAY
         =FIN_LIN(1,NUL,FIN_SUM(ALLTRIM(ELCLI),@PTL))
         =FIN_LIN(2,casos,FIN_SUM('TOTAL',@TTL))
      ELSE
         =FIN_LIN(2,casos)
      ENDIF
   ENDIF
   =RELEWIN('win')
   =REopccl()
   =IAUD(FISC)
ELSE
   =iaudi()
ENDIF
RETURN men_lin(BOTOM)
