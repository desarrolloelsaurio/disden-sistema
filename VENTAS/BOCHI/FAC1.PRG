*************************************
*-- Program : FAC1.PRG
*-- Date....: 25.04.90
*-- Version.: G. REINER
*-- Notes...: FUNCION DE CONFIRMACION
*************************************
FUNCTION FAC1
PARAMETER T1,T2,U,E,D
@ 24,0 SAY SPACE(79)
STOR 'N' TO XX
@ 24,0 SAY T1 GET XX PICT '!X'
READ
IF XX='S'
   STOR .T. TO SS
   DO WHIL SS
      STOR 0 TO XX
      @ 24,0 SAY SPACE(79)
      @ 24,0 SAY T2 GET XX PICT U
      READ
      SS=IIF(CONFIRMA(T2+' de '+str(XX,E,D)),.F.,.T.)
   ENDD
ELSE
   STOR 0 TO XX
ENDI
RETURN XX
