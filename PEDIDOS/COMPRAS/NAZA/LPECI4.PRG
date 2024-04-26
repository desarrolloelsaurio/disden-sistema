*
*-- Programa: LPEDI4.PRG
*-- Fecha   : 06/27/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE MERCADERIA DE NOTAS DE PEDIDO, POR IMPRESORA
*
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   sele pec
   @ 0,36 SAY TIME() COLOR I
   @ 0,47 SAY PADC(ULPR,10) COLOR I
   DO IMPRESOR
   @ 24,0 SAY IMPRIMIENDO COLO SCHE 19
   STORE '|'+padc('NUMERO',10)+PAIP+padc('MARCA',20)+'|COD.PROVEE|'+;
   padc('PROVEEDOR',29)+'| PEDIDOS  |ENTREGADOS|PENDIENTES|FECHA IN| USUARIO  |' TO acla
   STORE LEN(acla) TO LARGO
   STORE REPL('=', LARGO) TO LINEAS
   STORE nul TO casos
   STORE 'Listado de Notas de Pedido' TO TT
   STORE MIN(XACANCHO,Xachoja) TO LARGOIM
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
         ? LEFT(lineas,LARGOIM-3)
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
      sele pec
      SCAT MEMV
      GO m.marca IN ("MAR")
      SELE pro
      SET ORDER TO 1
      SEEK m.procod
      STORE nul TO totcant, totentre
      sele pe1
      scan for m.pedido = pe1.pedido
         m.cant  = pe1.cantidad
         m.entre = pe1.entregado
         totcant  = m.cant  + totcant
         totentre = m.entre + totentre
      ENDSCAN
      m.pendiente = m.totcant - m.totentre
      m.cantidad  = tran(m.totcant,  "@Z 9999999999")
      m.entregado = tran(m.totentre, "@Z 9999999999")
      m.pendiente = tran(m.pendiente, "@Z 9999999999")
      ? '|'
      ??tran(m.PEDIDO,"9999999999")
      ??'|'
      ??mar.marca
      ??'|'
      ??m.procod
      ??'|'
      ??pro.proveedor
      ??'|'
      ?? m.cantidad
      ?? '|'
      ?? m.entregado
      ?? '|'
      ?? m.pendiente
      DO IMPUSE
      sele pe1
   ENDSCAN
   ? lineas
   _WRAP=.F.
   ?
   ? 'Cantidad de Notas de Pedidos : '+ STR(casos,10)
   EJECT PAGE
   ?
   ENDP
	 =finimp()
   do iaud WITH 'LISTADO de N. de Ped. por IMPRESORA'
ELSE
   do iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
