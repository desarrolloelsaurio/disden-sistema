PARAMETER LAFACTURA,L_ACOPIA
IF EMPTY(M.LAFACTURA)

ENDIF
SELE FAX
SET ORDER TO TAG FACTURA
ELGIL=SAYPER(M.CODCLI,"CODCLI")
HAIR=SAYMIX(PER.LOCALIDAD,"CIUCOD")
LACONDIVA=SAYMIX(PER.CONDIVA,"IVACOD")
ELNROIVA=PER.NROIVA
ELTELEF=saygrl(per.localidad,"mix","ciucod","allt(left(mix.texto2,16))")+"-"+ALLTRIM(PER.TELEFONO)+" - "+ALLTRIM(PER.FAX)
COPIA=1
M.MINCOP=1
IF EMPTY(L_ACOPIA) .OR. ;
   L_ACOPIA=4
   MAXCOP=IIF(LEFT(FACTURA,1)="B",2,3)
ELSE
   STORE L_ACOPIA TO MINCOP,MAXCOP
ENDIF
_PCOPIES=1
FOR COPIA=MINCOP TO MAXCOP
      LACOPIA=IIF(COPIA=1,"ORIGINAL",IIF(COPIA=2,IIF(LEFT(M.FACTURA,1)="A","TRIPLICADO","DUPLICADO"),"DUPLICADO"))
      SELE FAX
      SEEK M.LAFACTURA
*    REPO FORM LFACI TO PRIN WHILE FACTURA=M.FACTURA NOCONSOLE
      REPO FORM LFACI TO PRIN ;
      NOCONSOLE ;
      WHILE FACTURA=LAFACTURA
NEXT
RETURN
