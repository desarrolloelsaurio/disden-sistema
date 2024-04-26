********************************************************************************
*-- Programa: LCHEI1.PRG
*-- Fecha   : 10/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE CHEQUES  Y/O DOCUMENTOS ENTREGADOS, POR IMPRESORA
********************************************************************************
PARAMETER nadregi
SELE seg
stor PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   @ 0,36 SAY TIME() COLOR I
   @ 0,47 SAY PADC(ulPR,10) COLOR I
   DO impresor
	 mxrn=66
   stor "|FECHA OP|"+PADC("PROVEEDOR",20)+"|TI|"+PADC("BANCO",20)+PAIP+PADC("N§CHEQUE",10)+PAIP+PADC("MONTO",14)+"|MON|FACTURA PAGADA |" TO acla
   stor REPL("=",LEN(acla)) TO lns
   TT='Listado de Cheques y/o Documentos Entregados'
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
      stor nadregi TO nadchac,nada10
      stor occur(",",nada10) TO nahasta
      SELE ccp
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
           stor AT(",",nadchac) TO nada
           IF !EMPTY(nada)
             stor nada-nada1 TO nada2
             stor SUBSTR(nadchac,nada1,nada2) TO nadpos
             stor SUBSTR(nadchac,nada+1,LEN(nadchac)-nada) TO nadchac
             GOTO VAL(nadpos)
           ELSE
             GOTO VAL(nadchac)
           ENDIF
        ELSE
           GOTO VAL(nadchac)
        ENDIF
        ?  "|"
        ?? ccp.fechaop
        ?? "|"
        SELE pro
        SET ORDER TO 1
        ?? IIF(SEEK(ccp.procod),LEFT(pro.proveedor,20),"Proveedor Inexisten.")
        SELE ccp
        ?? "|"
        ?? ccp.comprre
        ?? "|"
        ?? LEFT(ccp.detalle,20)
        ?? "|"
        ?? ccp.numerore
        ?? "|"
        ?? STR(ccp.monto,14,2)
        ?? "|"
        ?? LEFT(IIF(ccp.moneda=LEFT(xadols,1),xadols,xauss),3)
        stor totequi+ccp.equivale TO totequi
        ?? "|"
        ?? ccp.compr
        ?? "|"
        stor totdoc+1 TO totdoc
        I=I+1
      ENDdo
      ? lns
      ?
      ?
      ? SPACE(63)+"Monto Total:"+SPACE(5)+ALLTRIM(STR(totequi,14,2))+" "+LEFT(xadols,3)
      ?
      ?
      ? "Total de Cheques y/o Documentos Entregados: "
      ?? ALLTRIM(STR(totdoc))
      _WRAP=.F.
      ?
      EJECT PAGE
      ?
   ENDP
do finimp
   =iaud('LIST. CHEQUES ENTREGADOS x IMPRESORA')
ELSE
   =iaudi()
ENDIF
=men_lin(botom)
RETURN
*: EOF: LCHEI1.PRG
