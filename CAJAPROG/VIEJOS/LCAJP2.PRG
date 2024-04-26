********************************************************************************
*-- Programa: LCAJP1.PRG
*-- Fecha   : 11/03/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO COMPLETO DE CAJA LISTADO POR TIPO DE GASTO
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   SELE mix
   SET FILTER TO FILTRO="T"
   GO TOP
   COUNT TO nadagas
   DIME TOTAL[nadagas,3]
   GO TOP
   DO win0
   acti wind win
   STORE 1 TO i,pag
   DO cabpan
   STORE "FECHA OP|"+padc('PROVEEDOR',9)+PAIP+padc('CLIENTE',9)+"|COMPROB. REF.|MON|"+padc('MONTO',15)+PAIP+padc('EQUIVALE',15)+PAIP TO acla
   STORE REPL("=",LEN(acla)) TO lns
   tt='Listado de Caja por Tipo de Gasto'
   _wrap=.T.
   _alignment='CENTER'
   ? tt
   _wrap=.F.
   ? lns
   ? acla
   ? lns
   SCAN FOR &FISC
      STORE mix.texto2 TO nagasto,TOTAL[i,1]
      STORE mix.texto1 TO nagasto1
      STORE 0 TO namonto,naequi
      SELE caj
      GO TOP
      ? ">>> "+Alltrim(nagasto)+" <<<"
      ? "   ("+Alltrim(nagasto1)+")"
      SCAN WHILE !EOF()
         IF caj.gasto=nagasto
            IF caj.caja=0
               IF ROW()>20
                  ? LEFT(lns,LEN(lns)-4)
                  ?? '\\\\'
                  =inkey(0)
                  IF lastkey()=27
                     EXIT
                  ENDIF
                  CLEA
                  STOR pag+1 TO pag
                  DO cabpan
                  ? tt
                  _wrap=.F.
                  ? lns
                  ? acla
                  ? lns
                  ? ">>> "+Alltrim(nagasto)+" <<<"
                  ? "   ("+Alltrim(nagasto1)+")"
               ENDIF
               ? caj.fechaop
               ?? '|'
               IF caj.proveedor
                  SELE pro
                  IF SEEK(caj.procod)
                     ?? LEFT(pro.proveedor,9)
                  ELSE
                     ?? padl("Prov.Inexistente",9)
                  ENDIF
                  ?? PAIP+SPACE(9)
               ELSE
                  ?? SPACE(9)
                  ?? PAIP
                  IF !EMPTY(caj.codcli)
							SELE PER
                     SET ORDER TO 2
                     IF SEEK(caj.codcli)
                        ?? LEFT(PER.cliente,9)
                     ELSE
                        ?? padl("Clie.Inexistente",9)
                     ENDIF
                  ELSE
                     ?? SPACE(9)
                  ENDIF
                ENDIF
               SELE caj
               ?? '|'
               ?? padl(caj.compre+"-"+Alltrim(STR(caj.numere,10)),13)
               ?? '|'
               IF caj.moneda=LEFT(xadols,1)
                  ?? LEFT(xadols,3)
               ELSE
                  ?? LEFT(xauss,3)
               ENDIF
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
            ENDIF
         ENDIF
      ENDSCAN
      ? lns
      ? "TOTALES:"+SPACE(38)+PAIP+STR(namonto,15,2)+PAIP+STR(naequi,15,2)+PAIP
      ? lns
      ?
      =inkey(0)
      STORE namonto TO TOTAL[i,2]
      STORE naequi TO TOTAL[i,3]
      I=I+1
      SELE mix
   ENDSCAN
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
   =INKEY(0)
   RELE wind win
   DO iaud WITH 'INGRESO A '+ulpr
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LCAJP1.PRG
