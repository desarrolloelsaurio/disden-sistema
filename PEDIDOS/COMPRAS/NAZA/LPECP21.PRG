*
*-- Programa: LPEDP2.PRG
*-- Fecha   : 06/27/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE CABECERAS DE NOTAS DE PEDIDO, POR PANTALLA
*
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   SELE pec
   =win0()
   pag=1
   =cabpan()
   STORE nul TO casos
   STORE '|'+PADC('NUMERO',10)+PAIP+PADC('MARCA',10)+'|COD.PROVEE|'+     ;
   PADC('COND. DE PAGO',15)+"|FECH EMI|FECH ENT|" TO acla
   STORE LEN(acla) TO largo
   STORE REPL('=', largo) TO linea
   STORE 'Listado de Notas de Pedido '+ttu TO tt
   _WRAP=.T.
   _ALIGNMENT='CENTER'
   ? tt
   ? linea
   ? acla
   ? linea
   pag=1
   SCAN FOR &fisc
      IF ROW()=21
         ? LEFT(linea,LEN(linea)-4)
         ?? '\\\\'
         IF INKEY(nul )=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         ? tt
         ?linea
         ? acla
         ? linea
      ENDIF
      SCAT MEMV
      GO m->marca IN ("MAR")
      SELE pro
      SET ORDER TO 1
      SEEK m->procod
      if !EMPTY(m->condpago1)
         GO m->condpago1 IN ("MIX")
         m->texto1=mix->texto1
         m->texto1=TRANSFORM(m->texto1, "@R 999-999-999-999")
      ELSE
         m->texto1=space(15)
      ENDIF
      m->nada1 = mar->marca
      ? '|'
      ??TRAN(m->pedido,"9999999999")
      ??'|'
      ??LEFT(m->nada1,10)
      ??'|'
      ??m->procod
      ??'|'
      ??STRTRAN(m->texto1,'-000',SPACE(4))
      ??'|'
      ??fechaem
      ??'|'
      ??fechaent
      ??"|"
      STORE casos+1 TO casos
   ENDSCAN
   ? linea
   _WRAP=.F.
   ?
   ? 'Cantidad de Notas de Pedidos: '
   ?? STR(casos,10)
   =INKEY(nul )
   RELE WIND win
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LpecP2.PRG
