*****************************************************************************************
*-- Programa: LCOBI2.PRG
*-- Fecha   : 09/14/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE REGISTROS DE CUENTA CORRIENTE DE CLIENTES, SUBTOT. POR FACTURA
*****************************************************************************************
SELE seg
stor PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   @ 0,36 SAY TIME() COLOR I
   @ 0,47 SAY PADC(ulPR,10) COLOR I
      DO impresor
   stor ('|'+PADC("CLIENTE",20)+PAIP+PADC("DETALLE",14)+"|FEC.OPER|FEC.VENC|"+PADC('COMPR.REF.',13)+PAIP+padc("MONTO",15)+"|MON|"+PADC('MONTO EN '+LEFT(xadols,3)+".",15)+"|  USUARIO |") TO acla
   stor REPL("=",LEN(acla)) TO lns
   stor "Listado de Cuenta Corriente del Cliente" TO tt
   stor LEN(acla) TO largo
   stor MIN(xacancho,xachoja) TO largoim
   @ 24,nul say IMPRIMIENDO COLO SCHE 19
   IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
       A=left(sincosas(janname),8)+'.TXT'
     ACTI SCRE
     @ 24,nul say PADC("Imprimiendo Listado en Archivo "+ALLTRIM(A),80) COLO SCHE 19
     SET PRINTER TO FILE &a
     IF largoim>80
       mxrn=53
     ELSE
       mxrn=63
     ENDIF
   ENDIF
   SELE ccl
   INDE ON compr+dtos(fechave) TO tmpind for eval(fisc)
   SET INDEX TO tmpind
   GO TOP
do cabpri
   _PCOPIES=1
   PRINTJOB
do cabpri1
      cobtot=0
      pagtot=0
      go top
      do while !eof()
         IF _PLINENO>63
            ? LEFT(lns,largo-3)
            ?? '///'
            EJECT PAGE
            _RMARGIN=80
            _WRAP=.F.
            ?
do cabpri1
         ENDI
         stor ccl.compr TO nacompr
         ? REPL("*",19)
         ? "* "+PADC(ALLTRIM(ccl.compr),15)+" *"
         ? REPL("*",19)
         ? lns
         SCAN WHILE ccl.compr=nacompr
           ? '|'
			  SELE PER
           SET ORDER TO 2
           IF SEEK(ccl.codcli)
             ?? SUBSTR(PER.cliente,1,20)
           ELSE
             ?? "NO EXISTE EL CLIENTE"
           ENDIF
           SELE ccl
           ?? '|'
           ?? SUBSTR(ccl.detalle,1,14)
           ?? '|'
           ?? ccl.fechaop
           ?? '|'
           ?? ccl.fechave
           ?? '|'
           ?? ccl.comprre+"-"+padR(alltrim(str(ccl.numerore)),10)
           ?? '|'
           IF ccl.comprre="RE" .or. ccl.comprre="NC"
              stor STR(-1*ccl.monto,14,2) TO nada
              ?? PADR(nada,15)
           ELSE
              stor " "+STR(ccl.monto,14,2) TO nada
              ?? PADR(nada,15)
           ENDIF
           ?? '|'
           ?? IIF(LEFT(xadols,1)=ccl.moneda,left(xadols,3),left(xauss,3))
           ?? '|'
           IF ccl.comprre="RE" .or. ccl.comprre="NC"
              ?? "-"+STR(ccl.equivale,14,2)
              stor cobtot-ccl.equivale TO cobtot
              stor pagtot+ccl.equivale TO pagtot
           ELSE
              ?? " "+STR(ccl.equivale,14,2)
              stor cobtot+ccl.equivale TO cobtot
           ENDIF
           ?? '|'
           ?? usuario
           ?? '|'
         ENDSCAN
         ? lns
         ?
         ?
         ? SPACE(62)+"Total PAGADO     ("+xadols+"): "+STR(pagtot,14,2)
         ? SPACE(62)+"Total por COBRAR ("+xadols+"): "+STR(cobtot,14,2)
         ?
         ? lns
         ?
         stor 0 TO pagtot,cobtot
      ENDdo
      _WRAP=.F.
      ?
      EJECT PAGE
      ?
   ENDP
do finimp
   USE
   DELETE FILE TMPIND.IDX
	=OPCCL()
         do iaud WITH 'LISTADO CUENTA CORR. CLIENTE POR IMPRESORA'
ELSE
         do iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,nul say botom
RETURN
*: EOF: LCOBI.PRG
