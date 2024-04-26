*:*********************************************************************
*:
*:        Program: LKARP2.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/25/91     11:59
*:
*:      Called by: LKARP.PRG
*:
*:          Calls: IAUD.PRG
*:
*:      Documented 09/25/91 at 13:47               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LKARP2.PRG
*-- Fecha   : 08/21/91 10:23am
*-- Version : E. BANALOTTI
*-- Notas   : IMPRESION DE OPERACIONES DE KARDEX POR PANTALLA
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
=WIN0()
pag=1
=CABPAN()
   SELE kar
   STOR PAIP+PADC('Fecha Op',8)+PAIP+PADC('Articulo',16)+PAIP+PADC('Cbte N§',12)+PAIP+PADC('Cliente',25)+PAIP+PADC('Cantidad',10)+PAIP TO acla
   STOR ' SUBTOTAL'+SPACE(57) TO lsub
   STOR NUL TO casos
   STORE REPL("=",LEN(acla)) TO linea
   STORE LEN(acla) TO largo
   _WRAP=.T.
   _ALIGNMENT="LEFT"
   ? tt
   ? linea
   ? acla
   ? linea
   SELE kar
   subt=NUL
   SCAN FOR &FISC
      IF ROW()=21
         ? linea
         ? lsub
         ?? STR(subt,10,2)
         ? LEFT(linea,LEN(linea)-4)
         ?? '\\\\'
         IF INKEY(0)=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
=CABPAN()
         ? tt
         ?linea
         ? acla
         ? linea
      ENDI
      ? PAIP
      ?? kar->fechaop
      ?? PAIP
      ?? kar->articulo
      ?? PAIP
      ?? kar->docref
      ?? STR(kar->nrodocref)
      ?? PAIP
		SELE PER
      SET ORDER TO 2
      IF SEEK(kar->cliente)
         ?? lEFT(PER.cliente,25)
      ELSE
         ?? SPACE(25)
      ENDIF
      ?? PAIP
      SELE kar
canti=IiF(salida # 0,0-salida,entrada)
      subt=subt+canti
      ?? STR(canti,10,2)
      ?? PAIP
      STORE casos+1 TO casos
   ENDSCAN
   ? linea
   ? " TOTAL"+SPACE(60)
   ?? STR(subt,10,2)
   ? linea
   _WRAP=.F.
   ?
   ? 'Cantidad de Movimientos '
   ?? STR(casos,10)
   =INKEY(0)
   =relewin("WIN")

ELSE
   =iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
*: EOF: LKARP2.PRG
