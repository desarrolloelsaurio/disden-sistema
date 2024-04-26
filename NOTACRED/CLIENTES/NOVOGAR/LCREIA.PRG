******************************************************************************
*-- Programa: LCREIA
*-- Fecha   : 12-02-92 12:27pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA - inscriptos
*-- MODIFICACION GOYO / NOVOGAR
*-- ADAPTACION DE FACTURAS
********************************************************************************
PARAMETER L_UNO,L_DOS
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
   SELE fac
   picu="99,999,999,999.99"
   picu1="999,999.99"
   W=PAIP
   STOR NUL TO casos
   stor 90 TO t1
   c1=2
   c2=18
   c7=48
   c3=60
   c4=c3+10
   c5=55
   c6=60
   STORE "" TO NLQ1,NLQ2
   =CABPRI3(1,54)
   PRINTJOB
      ***************************************************
      ?
      ?? CHR(14)
      ?? 'N.CRED.' AT 32
      ?
      ?? nlq2
      ? fac.fechaem AT 60
      ?
      ?
      ?
      ?
      ?
      SELE PER
      =XSEEK(FAC.CODCLI,"PER","CODCLI")
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
      ?? space(5)
      ?? nlq2
      =XSEEK(fac.condpago,'MIX','PAGCOD')
      stor mix.texto1 TO nada,nada2
      ?? NADA AT 39
      ?
      ?
      ?
      ?
      ?? nlq2
      SELE fac
      stor 1 TO I
      FOR A=4 TO 16 STEP 3
         stor VAL(SUBSTR(nada2,A,3)) TO nada5
         IF EMPTY(nada5)
            EXIT
         endi
         stor I+1 TO I
      NEXT
      sele fax
      set order to tag facturaa
      =seek(fac.factura)
      stor RECNO() TO regi
      STOR NUL TO nadacan,nadacanu,nadareg
      =LCREI0()
      ?? CHR(18)
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
		?? "  " at c6-2
		?? FAC.MONTONET PICT PICU
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
