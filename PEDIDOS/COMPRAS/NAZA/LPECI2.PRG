*
*-- Programa: LpecI2.PRG
*-- Fecha   : 06/27/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE CABECERAS DE NOTAS DE PEDIDO, POR IMPRESORA
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
   STORE nul TO casos
   STORE '|'+padc('NUMERO',10)+PAIP+padc('MARCA',20)+'|COD.PROVEE|'+     ;
   padc('PROVEEDOR',29)+PAIP+     ;
   padc('COND. DE PAGO',23)+'|FECH EMI|FECH ENT|' TO acla
   STORE LEN(acla) TO LARGO
   STORE REPL('=', LARGO) TO LINEAS
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
      SCAT MEMV
      GO m.marca IN ("MAR")
      SELE pro
      SET ORDER TO 1
      SEEK m.procod
      if !EMPTY(m.condpago1)
         GO m.condpago1 IN ("MIX")
         m.texto1=mix.texto1
         m.texto1=TRANSFORM(m.texto1, "@R 999-999-999-999-999-999")
      ELSE
         m.texto1=space(23)
      ENDIF
      ? '|'
      ??tran(m.PEDIDO,"9999999999")
      ??'|'
      ??mar.marca
      ??'|'
      ??m.procod
      ??'|'
      ??pro.proveedor
      ??'|'
      ??STRTRAN(m.texto1,'-000',space(4))
      ??'|'
      ??m.fechaem
      ??'|'
      ??FECHAENT
      ??'|'
      STORE casos+1 TO casos
   ENDSCAN
   ? lineas
   _WRAP=.F.
   ?
   ? 'Cantidad de Notas de Pedidos: '
   ?? STR(casos,10)
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
