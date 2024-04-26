*
*-- Programa: LPEDP3.PRG
*-- Fecha   : 06/27/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE MERCADERIA DE NOTAS DE PEDIDO, POR PANTALLA
*
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   SELE pe1
   =win0()
   pag=1
   =cabpan()
   STORE nul TO casos, totcant, totentre, totcurv
   STORE '|'+PADC('COD. ART.',13)+'|   TALLE  '+;
   '| COLOR |UNID.PEDID|UNID.ENTR.|UNID.PEND.|' TO acla
   STORE LEN(acla) TO largo
   STORE REPL('=', largo) TO linea
   STORE 'Listado de Notas de Pedido - '+ttu TO tt
	 STORE '@Z 9999999999' TO picu5
   _WRAP=.T.
   _ALIGNMENT='CENTER'
   ? tt
   _wrap=.f.
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
         _wrap=.t.
         ? tt
         _wrap=.f.
         ?linea
         ? acla
         ? linea
      ENDIF
      SELE pe1
      SCAT MEMV
      m->curvatalle = TRAN(m->talle, "@Z 9999999.99")
      m->cant  = pe1->cantidad
      m->entre = pe1->entregado
      totcant  = m->cant  + totcant
      totentre = m->entre + totentre
      m->pendi = m->cant - m->entre
      m->cantidad  = TRAN(m->cant , picu5)
      m->entregado = TRAN(m->entre, picu5)
      m->pendiente = TRAN(m->pendi, picu5)
      if m->color>0
         go m->color in ("MIX")
         m->color = LEFT(mix->texto1,7)
      ELSE
         m->color = SPACE(7)
      ENDIF
      ?  '|'
      ?? LEFT(m->articulo,13)
      ?? '|'
      ?? m->curvatalle
      ?? '|'
      ?? m->color
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
   if lastkey()#27
      IF ROW()>18
         ? LEFT(linea,LEN(linea)-4)
         ?? '\\\\'
         =inkey(nul )
         CLEA
         STOR pag+1 TO pag
         =cabpan()
      endif
      ? linea
      _WRAP=.F.
      ?
      ? 'Cantidad de L¡neas Pedidas : '+ STR(casos,10)
      ?
      ? 'Total Unidades Pedidas    : '+ STR(totcant,10)
      ? 'Total Unidades Entregadas : '+ STR(totentre,10)
      ? 'Total Unidades Pendientes : '+ STR(totcant-totentre,10)
      =INKEY(nul )
   endif
   rele wind win
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LPEcP3.PRG
