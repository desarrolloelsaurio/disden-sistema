********************************************************************************
*-- Programa: LHORI6.PRG
*-- Fecha   : 01/07/91 11:07am
*-- Version : G. REINER
*-- Notas   : DERIVA A PROGRAMAS DE LISTADO DE HORAS TRABAJADAS POR IMPRESORA
********************************************************************************
PARAMETER bsc,fl,flva,flti,fun,fil,flt1
uli=ulpr
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo1=BAR()
DO CASE
CASE BAR()=1
   DO kk2 WITH 14,35,'L¡mites del Listado de '+flti
   ON SELE POPU caca1 DO lhori3
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=2
   DO rhori WITH RECC(fil),bsc,flt1,flti+ALLTRIM(peraliq),fil,flva
CASE BAR()=3
   DO kk2 WITH 14,35,'L¡mites del Listado de Aportes'
   ON SELE POPU caca1 DO lqreti1
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=4
   DO rqret WITH RECC(fil),bsc,flt1,flti+ALLTRIM(peraliq),fil,flva
case bar()=6
   do lobsoci
ENDCASE
RELE uli
RETURN
*: EOF: LHORI6.PRG
