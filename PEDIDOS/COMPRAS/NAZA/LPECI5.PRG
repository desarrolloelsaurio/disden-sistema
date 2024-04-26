*
*-- Programa: LPECI5.PRG
*-- Fecha   : 06/27/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE MERCADERIA DE NOTAS DE PEDIDO, POR IMPRESORA
*
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   @ 0,36 SAY TIME() COLOR I
   @ 0,47 SAY PADC(ULPR,10) COLOR I
   DO IMPRESOR
   @ 24,0 SAY IMPRIMIENDO COLO SCHE 19
   STORE '|'+padc('NUMERO',10)+PAIP+padc('MARCA',20)+PAIP+PADC('TALLE',10)+   ;
   '|UNID.PEDID|UNID.ENTR.|UNID.PEND.|FECHA IN| USUARIO  |' TO acla
   STORE LEN(acla) TO LARGO
   STORE REPL('=', LARGO) TO LINEAS
   STORE 'Listado de Notas de Pedido' TO TT
   STORE MIN(XACANCHO,Xachoja) TO LARGOIM
	 STORE '@Z 9999999999' TO picu5
   =cabpri()
   _PCOPIES=1
   PRINTJOB
   sele mer
   SCAN FOR &fisc
      _RMARGIN=80
      _WRAP=.F.
      ?
      =cabpri1()
      SCAT MEMV
      sele mix
      rtc=SUBSTR(m->articulo,12,2)
      SET FILTER TO filtro='O'
      SCAN FOR LEFT(texto2,2)=rtc
         EXIT
      ENDSCAN
      m->color=IIF(!EOF(),mix->texto1,SPACE(20))
      IF largo>largoim
         _RMARGIN=IIF(largoim>80,233,132)
         ??? CHR(15)
      ENDIF
      ? tt STYLE 'u'
      ? ALLTRIM(janname) STYLE 'u'
      ?
      ? 'Producto : '+rtc+"  "+mer->merca+'     Color :'+m->color
      ? lineas
      ? acla
      ? lineas
      sele pe1
      STORE nul TO casos, totcant, totentre, totcurv
      scan for m->articulo = LEFT(pe1->articulo,13)
         SCAT MEMV
         GO m->marca IN ("MAR")
         m->curvatalle = tran(m->talle, "@Z 9999999.99")
         m->cant  = pe1->cantidad
         m->entre = pe1->entregado
         totcant  = m->cant   + totcant
         totentre = m->entre  + totentre
         m->pendi = m->cant - m->entre
         m->cantidad  = tran(m->cant,  picu5)
         m->entregado = tran(m->entre, picu5)
         m->pendiente = tran(m->pendi, picu5)
         ? '|'
         ?? tran(m->PEDIDO,"9999999999")
         ?? '|'
         ?? mar->marca
         ?? '|'
         ?? m->curvatalle
         ?? '|'
         ?? m->cantidad
         ?? '|'
         ?? m->entregado
         ?? '|'
         ?? m->pendiente
         DO IMPUSE
         sele pe1
      ENDSCAN
      ? LEFT(lineas,LARGOIM-3)
      ?? '///'
      m->pendiente = m->totcant - m->totentre
      m->cantidad  = tran(m->totcant,  picu5)
      m->entregado = tran(m->totentre, picu5)
      m->pendiente = tran(m->pendiente, picu5)
      sele mer
      _WRAP=.F.
      ? "TOTAL" + space(39)
      ?? m->cantidad
      ?? '|'
      ?? m->entregado
      ?? '|'
      ?? m->pendiente
      ? lineas
      EJECT PAGE
   ENDSCAN
   ENDP
	 =finimp()
   do iaud WITH 'LISTADO de N. de Ped. por IMPRESORA'
ELSE
   do iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
