*
*-- Programa: LPEDP4.PRG
*-- Fecha   : 06/27/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE MERCADERIA DE NOTAS DE PEDIDO PROVEED., POR PANTALLA
*
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   SELE pec
   =win0()
   pag=1
   =cabpan()
   STORE '|'+PADC('NUMERO',10)+PAIP+PADC('MARCA',10)+'|COD.PROV. '+     ;
   '| PEDIDOS  |ENTREGADOS|PENDIENTES|' TO acla
   STORE LEN(acla) TO largo
   STORE REPL('=', largo) TO linea
   STORE 'Listado de Notas de Pedido - '+ttu TO tt
   STORE nul TO casos
	 STORE "@Z 9999999999" TO picu5
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
      SELE pec
      SCAT MEMV
      GO m->marca IN ("MAR")
      SELE pro
      SET ORDER TO 1
      SEEK m->procod
      STORE nul TO totcant, totentre
      SELE pe1
      SCAN FOR m->pedido = pe1->pedido
         totcant  = pe1->cantidad   + totcant
         totentre = pe1->entregado  + totentre
      ENDSCAN
      m->pendiente = m->totcant - m->totentre
      m->cantidad  = TRAN(m->totcant,  picu5)
      m->entregado = TRAN(m->totentre, picu5)
      m->pendiente = TRAN(m->pendiente, picu5)
      ? '|'
      ??TRAN(m->pedido,"9999999999")
      ??'|'
      nada1= mar->marca
      ??LEFT(nada1,10)
      ??'|'
      ??m->procod
      ??'|'
      ?? m->cantidad
      ?? '|'
      ?? m->entregado
      ?? '|'
      ?? m->pendiente
      ??'|'
      STORE casos+1  TO casos
      SELE pec
   ENDSCAN
   ? linea
   _WRAP=.F.
   ?
   ? 'Cantidad de Notas de Pedidos : '+ STR(casos,10)
   =INKEY(nul )
   RELE WIND win
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LpecP4.PRG
