******************************************************************************
*-- Programa: LDEBIA.PRG
*-- Fecha   : 07/22/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE NOTAS DE DEBITO POR IMPRESORA - inscriptos
*-- MODIFICACION GOYO / NOVOGAR
*-- Modificaciones varias 11/9/96
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
   SELE fac
   picu="99,999,999,999.99"
   picu1="999,999.99"
   W=PAIP
   =impresor()
   STOR NUL TO casos
   stor 90 TO t1
   c1=2
   c2=18
   c7=48
   c3=60
   c4=c3+10
   c5=55
   c6=60
   SET DEVICE TO PRINT
   SET CONSOLE OFF
   SET PRINTER ON
   _PEJECT="NONE"
   _PLENGTH=54
   _PLINENO=NUL
   _PAGENO=1
   _PSCODE='{27}{64}{27}{67}{54}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}{27}{69}'
   _PLOFFSET=NUL
   _ALIGNMENT='LEFT'
   _PADVANCE="LINEFEEDS"
   _wrap=.F.
   _rmargin=255
   _lmargin=NUL
   _PCOPIES=1
   nlq2=chr(27)+chr(113)+chr(0)+chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)+chr(27)+chr(52)
   nlq1=chr(27)+chr(113)+chr(0)+chr(27)+chr(120)+chr(2)+chr(27)+chr(107)+chr(0)+chr(27)+chr(52)+chr(27)+chr(113)+chr(1)
   PRINTJOB
      ***************************************************
      ?
      ?
      ?? nlq2
      ?? "NOTA DE DEBITO" AT 60
      ? fac.fechaem AT 60
      ?
      ?
      ?
      ?
      ?
		SELE PER
      SET ORDER TO TAG CODCLI
      SEEK fac.codcli
      ?
      ?? nlq1
      ?? PER.cliente
      ?? nlq2
      ?? SAYMIX(PER.CONDIVA,"IVACOD") AT 39
      ?? PER.NROIVA AT 61
      ?
      ?? nlq1
      ?? PER.domicilio
      =XSEEK(PER.localidad,'mix','CIUCOD')
      STORE mix.texto1 TO nada
      ? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")"
      =XSEEK(right(MIX.TEXTO2,2),'MIX','PRVCOD')
      ?? ' - '
      ?? alltrim(mix.texto1)
      ?? nlq2
      ?
      ?
      ?
      ?
      ?? nlq2
      SELE fac
      sele fax
      set order to tag facturaa
      =seek(fac.factura)
      stor RECNO() TO regi
      STOR NUL TO nadacan,nadacanu,nadareg
      stor .T. TO lnada10
      stor .F. TO lnada12
      STOR NUL TO nadacant
      =LDEBI0()
      DO WHILE _PLINENO<32
         ?
      ENDDO
      =xseek(fac.codvia,'via','codvia')
      ? padr(upper(biaja),19)+': '+ALLTRIM(via.viajante) AT 2
      ?
      ?
		? FAC.MONTOBRU PICT PICU1
		?? FAC.MONTOIVA PICT PICU1 AT 38
		?? FAC.MONTOOT2 PICT PICU1 AT 49
		?? FAC.IMPINT PICT PICU1 AT 27
   		?? "  " at c6-2
        ?? FAC.MONTONET PICT PICU
      ?
      ?
      if fac.moneda=left(xauss,1)
         tx='EQ. '+UPPER(XADOLS)
         TX=PADR(TX,11)+" : "
         ? tx
         ?? '->'
         ?? fac.montonet/FAC.COTIZ pict PICU
         ?? ' '
         ?? xadols
      endif
      _WRAP=.F.
      _lmargin=NUL
      ?
      EJECT PAGE
   ENDP
   =FINIMP()
   =iaud(FAC.FACTURA)
RETURN MEN_LIN(BOTOM)