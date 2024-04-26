********************************************************************************
*-- Programa: LCAJI2.PRG
*-- Fecha   : 11/03/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE CAJA POR TIPO DE GASTO, POR IMPRESORA
********************************************************************************
PARAMETER nadregi
SELE Seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   SELE mix
   SET FILTER TO filtro="T"
   GO TOP
   COUNT TO nadagas
   DIME TOTAL[nadagas,3]
   GO TOP
   i=1
   @ 0,36 SAY TIME() COLOR I
   @ 0,47 SAY padc(ULPR,10) COLOR I
   DO impresor
MXRN=66
   STORE "|FECHA OP|"+padc("PROVEEDOR",20)+PAIP+padc("CLIENTE",20)+"|N§ de COMPROBANTE|MON|"+padc("MONTO",15)+PAIP+padc("EQUIVALE",15)+PAIP TO acla
   STORE REPL("=",LEN(acla)) TO lns
   tt='Listado de Caja por Tipo de Gasto'
   STORE LEN(acla) TO largo
   STORE MIN(xacancho,xachoja) TO largoim
   acti SCRE
   @ 24,0 SAY padc('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLO sche 19
   IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
      A=PATH+"\"+LEFT(sincosas(janname),8)+'.TXT'
      acti SCRE
      @ 24,0 SAY padc("Imprimiendo Listado en Archivo "+Alltrim(A),80) COLO sche 19
      SET PRINTER TO FILE &a
      MXRN=IIF(largoim>80,63,53)
   ENDIF
   DO cabpri
   _pcopies=1
   PRIN
      DO cabpri1
      ? tt
      ? Alltrim(janname)
      ?
      SCAN for &fisc
         STORE mix.texto2 TO nagasto,TOTAL[i,1]
         STORE mix.texto1 TO nagasto1
         STORE 0 TO namonto,naequi
         SELE caj
         GO TOP
         ? ">>> "+Alltrim(nagasto)+" <<<"
         ? "   ("+Alltrim(nagasto1)+")"
         ?lns
         ? acla
         ? lns
         SCAN WHILE !EOF()
            IF caj.gasto=nagasto
               IF EMPTY(caj.caja)
                  IF _plineno>MXRN
                     ? LEFT(lns,largo-3)
                     ?? '///'
                     EJECT page
                     _rmargin=80
                     _wrap=.F.
                     ?
                     DO cabpri1
                     IF largo>largoim
                        _RMARGIN=IIF(largoim>80,233,132)
                        ??? CHR(15)
                     ENDIF
                     ? tt+' - Continuaci¢n'
                     ? Alltrim(janname)
                     ?
                     ? ">>> "+Alltrim(nagasto)+" <<<"
                     ? "   ("+Alltrim(nagasto1)+")"
                     ? lns
                     ? acla
                     ? lns
                  ENDI
                  ? PAIP
                  ?? caj.fechaop
                  ?? '|'
                  IF caj.proveedor
                     SELE pro
                     ?? PADL(IIF(SEEK(caj.procod),pro.proveedor,"Prov.Inexistente"),20)
                     ?? PAIP+SPACE(20)
                  ELSE
                     ?? SPACE(20)
                     ?? PAIP
							SELE PER
                     SET ORDER TO 2
                     ?? IIF(!EMPTY(caj.codcli),PADL(IIF(SEEK(caj.codcli),PER.cliente,"Clie.Inexistente"),20),SPACE(20))
                  ENDIF
                  SELE caj
                  ?? '|'
                  ?? padl(caj.compre+"-"+Alltrim(STR(caj.numere,10)),17)
                  ?? '|'
                  ?? LEFT(IIF(caj.moneda=LEFT(xadols,1),xadols,xauss),3)
                  ?? PAIP
                  IF caj.compre="TR" .OR. caj.compre="RE"
                     ?? " "+STR(caj.monto,14,2)
                     ?? PAIP
                     ?? " "+STR(caj.equivale,14,2)
                     STORE namonto+caj.monto TO namonto
                     STORE naequi+caj.equivale TO naequi
                  ELSE
                     ?? "-"+STR(caj.monto,14,2)
                     ?? PAIP
                     ?? "-"+STR(caj.equivale,14,2)
                     STORE namonto-caj.monto TO namonto
                     STORE naequi-caj.equivale TO naequi
                  ENDIF
                  ?? PAIP
               ENDI
            ENDI
         ENDSCAN
         ? lns
         ? "TOTALES:"+SPACE(65)+PAIP+STR(namonto,15,2)+PAIP+STR(naequi,15,2)+PAIP
         ? lns
         ?
         EJECT page
         STORE namonto TO TOTAL[i,2]
         STORE naequi TO TOTAL[i,3]
         I=I+1
         SELE mix
      ENDS
      ? lns
      ? "HOJA RESUMEN"
      ? lns
      ? padc("GASTO",15)+PAIP+padc("MONTO",15)+PAIP+padc("EQUIVALE",15)+PAIP
      FOR I=1 TO nadagas
         ? padl(TOTAL[i,1],15)
         ?? PAIP
         ?? STR(TOTAL[i,2],15,2)
         ?? PAIP
         ?? STR(TOTAL[i,3],15,2)
         ?? PAIP
      endfor
      _wrap=.F.
      ?
      EJECT page
      ?
   endp
   DO FINIMP
   DO iaud WITH 'INGRESO A '+ulpr
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
acti SCRE
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LCAJI2.PRG
* EOF - INDENT
