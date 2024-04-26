*
*-- Programa: LpecI3.PRG
*-- Fecha   : 06/27/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE MERCADERIA DE NOTAS DE PEDIDO, POR IMPRESORA
*
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   SELE pe1
   @ 0,36 SAY TIME() COLOR I
   @ 0,47 SAY PADC(ULPR,10) COLOR I
   DO impresor
   @ 24,0 SAY IMPRIMIENDO COLO SCHE 19
   STORE nul TO casos, totcant, totentre
   STORE '|'+PADC('COD. ART.',16)+PAIP+PADC('ARTICULO',29)+PAIP+PADC('TALLE',11)+;
   '| COLOR |UNID.PEDID|UNID.ENTR.|UNID.PEND.|FECHA IN| USUARIO  |'  TO acla
   STORE LEN(acla) TO largo
   STORE REPL('=', largo) TO lineas
   STORE 'Listado de Notas de Pedido' TO tt
   STORE MIN(xacancho,xachoja) TO largoim
   =cabpri()
   _PCOPIES=1
   PRINTJOB
   =cabpri1()
   IF largo>largoim
      _RMARGIN=IIF(largoim>80,233,132)
      ??? CHR(15)
   ENDIF
   ? tt STYLE 'u'
   ? ALLTRIM(janname) STYLE 'u'
   ?
   ? lineas
   ? acla
   ? lineas
   SCAN FOR &fisc
      IF _PLINENO>63
         ? LEFT(lineas,largoim-3)
         ?? '///'
         EJECT PAGE
         _RMARGIN=80
         _WRAP=.F.
         ?
         =cabpri1()
         IF largo>largoim
            _RMARGIN=IIF(largoim>80,233,132)
            ??? CHR(15)
         ENDIF
         ? tt+' - Continuaci¢n' STYLE 'u'
         ? ALLTRIM(janname) STYLE 'u'
         ?
         ? lineas
         ? acla
         ? lineas
      ENDI
      SELE pe1
      SCAT MEMV
      m->curvatalle = TRAN(m->talle, "@Z 9999999.99")
      m->cant  = pe1->cantidad
      m->entre = pe1->entregado
      totcant  = m->cant  + totcant
      totentre = m->entre + totentre
      m->pendi = m->cant - m->entre
      m->cantidad  = TRAN(m->cant , "@Z 9999999999")
      m->entregado = TRAN(m->entre, "@Z 9999999999")
      m->pendiente = TRAN(m->pendi, "@Z 9999999999")
      IF !EMPTY(m->color)
         go m->color in ("MIX")
         m->color = LEFT(mix->texto1,7)
      ELSE
         m->color = SPACE(7)
      ENDIF
      ?  '|'
      ?? m->articulo
      ?? '|'
      ?? m->descripcio
      ?? '|'
      ?? m->curvatalle
      ?? ' |'
      ?? m->color
      ?? '|'
      ?? m->cantidad
      ?? '|'
      ?? m->entregado
      ?? '|'
      ?? m->pendiente
      DO IMPUSE
      SELE pe1
   ENDSCAN
   ? lineas
   _WRAP=.F.
   ?
   ? 'Cantidad Articulos de Notas de Pedidos : '+ STR(casos,10)
   ?
   ? 'Total Unidades Pedidas    : '+ STR(totcant,10)
   ? 'Total Unidades Entregadas : '+ STR(totentre,10)
   ? 'Total Unidades Pendientes : '+ STR(totcant-totentre,10)
   EJECT PAGE
   ?
   ENDP
	 =finimp()
   DO iaud WITH 'LISTADO de N. de Ped. por IMPRESORA'
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LpecI3.PRG
