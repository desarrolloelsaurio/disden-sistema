********************************************************************************
*-- Programa: LCHEI.PRG
*-- Fecha   : 10/17/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE CHEQUES  Y/O DOCUMENTOS MODIFICADOS, POR IMPRESORA
********************************************************************************
PARAMETER nadregi
SELE seg
stor hora_ulp(PROGRAM()) TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   DO impresor
	 mxrn=66
   stor ("|FECHA OP|"+PADC("FACTURA",12)+"|TI|"+PADC("BANCO",15)+PAIP+PADC("N§CHEQUE",15)+PAIP+PADC("MONTO",14)+"|MON|"+PADC("CLIENTE",30)+"|") TO acla
   stor REPL("=",LEN(acla)) TO lns
   TT='Listado de Cheques y/o Documentos Modificados'
   stor LEN(acla) TO largo
   stor MIN(xacancho,xachoja) TO largoim
   =men_lin('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe')
   IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
       A=left(sincosas(janname),8)+'.TXT'
     =men_lin("Imprimiendo Listado en Archivo "+ALLTRIM(A))
     SET PRINTER TO FILE &a
     mxrn=IIF(largoim>80,53,63)
   ENDIF
   DO cabpri
   _PCOPIES=1
   PRINTJOB
   DO cabpri1
        ? tt
      ? ALLTRIM(janname)
      ?
      ?lns
      ? acla
      ? lns
      stor 0 TO totdoc,totequi
      stor nadregi TO nadchmo,nada10
      stor occur(",",nada10) TO nahasta
      SELE cch
      I=0
      nada1=1
      DO WHILE !I>nahasta
        IF _PLINENO>mxrn
           ? LEFT(lns,largo-3)
           ?? '///'
           EJECT PAGE
           _RMARGIN=80
           _WRAP=.F.
           ?
           DO cabpri1
           ? tt+' - Continuaci¢n'
           ? ALLTRIM(janname)
           ?
           ? lns
           ? acla
           ? lns
        ENDI
        IF I<occur(",",nada10)
           stor AT(",",nadchmo) TO nada
           IF !EMPTY(nada)
             stor nada-nada1 TO nada2
             stor SUBSTR(nadchmo,nada1,nada2) TO nadpos
             stor SUBSTR(nadchmo,nada+1,LEN(nadchmo)-nada) TO nadchmo
             GOTO VAL(nadpos)
           ELSE
             GOTO VAL(nadchmo)
           ENDIF
        ELSE
           GOTO VAL(nadchmo)
        ENDIF
        ?  "|"
        ?? cch.fechaop
        ?? "|"
        ?? cch.compre+STR(cch.numere,10)
        ?? "|"
        ?? cch.tipo
        ?? "|"
        ?? LEFT(cch.banco,15)
        ?? "|"
        ?? cch.nroche
        ?? "|"
        ?? STR(cch.monto,14,2)
        ?? "|"
        ?? LEFT(IIF(cch.moneda=LEFT(xadols,1),xadols,xauss),3)
        stor totequi+cch.equivale TO totequi
        ?? "|"
		  SELE PER
        ?? IIF(SEEK(cch.codcli),LEFT(PER.cliente,30),PADL("NO EXISTE",30))
        ?? "|"
        SELE cch
        stor totdoc+1 TO totdoc
        I=I+1
      ENDdo
      ? lns
      ?
      ?
      ? SPACE(45)+"Monto Total:"+SPACE(5)+ALLTRIM(STR(totequi,14,2))+" "+LEFT(xadols,3)
      ?
      ?
      ? "Total de Cheques y/o Documentos Modificados: "
      ?? ALLTRIM(STR(totdoc))
      _WRAP=.F.
      ?
      EJECT PAGE
      ?
   ENDP
DO FINIMP
   =iaud('LIST. CHEQUES ACREDITADOS x IMPRESORA')
ELSE
   =iaudi()
ENDIF
=men_lin(botom)
RETURN
*: EOF: LCHEI.PRG
