FUNCTION LIVAVI0
#DEFINE PAIP   "|"                               && PAIP
IF !EMPTY(TMP.FACTURA)
   ? paip
   ?? TMP.fechaem
   ?? paip
   DO CASE
   CASE TMP.tipo="FA" .or. EMPTY(TMP.tipo)
      ?? IIF(PORPAN,"FA ","FACTU.")
   CASE TMP.tipo="ND"
      ?? IIF(PORPAN,"ND ","N.DEB.")
   CASE TMP.tipo="NC"
      ?? IIF(PORPAN,"NC ","N.CRE.")
   ENDCASE
   ?? FACTURA
*   =IIF(!PORPAN,RIGHT(ALLTRIM(TMP.FACTURA),6),TMP.FACTURA)
   ?? paip
   IF TMP.CODCLI='ANULADA'
      ?? PADC("A N U L A D A",30)
      ?? paip
      IF !PORPAN
         ?? space(13)
         ?? paip
      ELSE
         ?? space(10)
         ?? PAIP
      ENDIF
   ELSE
      IF !PORPAN
        ?? IIF(XSEEK(TMP.codcli,"PER","CODCLI"),;
        LEFT(PER.cliente,30),;
        PADL(IIF(!EMPTY(TMP.MONTO),"NO EXISTE","ANULADA"),30))
        ?? PAIP
        ?? SAYMIX(PER.CONDIVA,"IVACOD",10)
         ?? paip
         ?? left(PER.nroiva,13)
         ?? paip
       ENDIF
   ENDIF
   ?? STR(MONTOBRU,XACDIGI,2)
   ?? PAIP
   ?? STR(MONTOIVA,XACDIGI,2)
   ?? PAIP
   ?? STR(MONTOOT2,XACDIGI,2)
   ?? PAIP
   ?? STR(MONTONET,XACDIGI,2)
   ?? PAIP
   STORE TOTAL[1]+MONTOBRU TO TOTAL[1]
   STORE TOTAL[2]+MONTOIVA TO TOTAL[2]
   STORE TOTAL[3]+MONTOOT2 TO TOTAL[3]
   STORE TOTAL[4]+MONTONET TO TOTAL[4]
   endif
   RETURN .T.
