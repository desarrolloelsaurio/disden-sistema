*
*-- Programa: LpecP5.PRG
*-- Fecha   : 06/27/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE MERCADERIA DE NOTAS DE PEDIDO PROVEED., POR PANTALLA
*
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   =win0()
   pag=1
   =cabpan()
   STORE nul TO casos, totcant, totentre
   STORE '|'+PADC('NUMERO',10)+PAIP+PADC('MARCA',10)+'|  TALLE   |'+   ;
   'UNID.PEDID|UNID.ENTR.|UNID.PEND.|' TO acla
   STORE LEN(acla) TO largo
   m->lineas1 = REPL('=', largo)
   STORE 'Listado de Notas de Pedido a Proveed.' TO tt
	 STORE '@Z 9999999999' TO picu5
   _WRAP=.T.
   _ALIGNMENT='CENTER'
   SELE mer
   SCAN FOR &fisc
      SCAT MEMV
      SELE mix
      rtc=SUBSTR(m->articulo,12,2)
      SET FILTER TO filtro='O'
      SCAN FOR LEFT(texto2,2)=rtc
         EXIT
      ENDSCAN
      m->color=IIF(!EOF(),mix->texto1,SPACE(20))
      CLEA
      STOR pag+1 TO pag
      =cabpan()
      ? tt
      ?
      ? 'Producto : '+rtc+"  "+mer->merca+'     Color :'+m->color
      ? m->lineas1
      ? acla
      ? m->lineas1
      SELE pe1
      STORE nul TO casos, totcant, totentre
      SCAN FOR m->articulo = LEFT(pe1->articulo,13)
         SCAT MEMV
         GO m->marca IN ("MAR")
         m->curvatalle = TRAN(m->talle, "@Z 9999999.99")
         m->cant  = pe1->cantidad
         m->entre = pe1->entregado
         totcant  = m->cant  + totcant
         totentre = m->entre + totentre
         m->pendi = m->cant - m->entre
         m->cantidad  = TRAN(m->cant , picu5)
         m->entregado = TRAN(m->entre, picu5)
         m->pendiente = TRAN(m->pendi, picu5)
         ? '|'
         ?? TRAN(m->pedido,"9999999999")
         ?? '|'
         nada1=mar->marca
         ?? LEFT(nada1,10)
         ?? '|'
         ?? m->curvatalle
         ?? '|'
         ?? m->cantidad
         ?? '|'
         ?? m->entregado
         ?? '|'
         ?? m->pendiente
         ?? '|'
         STORE casos+1  TO casos
         SELE pe1
      ENDSCAN
      ? LEFT(m->lineas1,LEN(m->lineas1)-4)
      ?? '\\\\'
      m->pendiente = m->totcant - m->totentre
      m->cantidad  = TRAN(m->totcant,   picu5)
      m->entregado = TRAN(m->totentre,  picu5)
      m->pendiente = TRAN(m->pendiente, picu5)
      SELE mer
      _WRAP=.F.
      ? SPACE(34)
      ?? m->cantidad
      ?? '|'
      ?? m->entregado
      ?? '|'
      ?? m->pendiente
      ? m->lineas1
      IF casos > 0
         =INKEY(nul )
      ENDIF
   ENDSCAN
   _WRAP=.F.
   RELE WIND win
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LPEDP5.PRG
