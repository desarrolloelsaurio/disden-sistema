* CONSULTA PRECIOS MAYORISTAS
=OPMIX()
M.PORLISMAY=GETNU1("PORLISMAY","FOXGRL")
M.PORLISMIN=GETNU1("PORLISMIN","FOXGRL")
M.FLETE=GETNU1("FLETE","FOXGRL")
ON KEY LABEL F10 KEYB CHR(23)
ON KEY LABEL F1 WAIT ALLTRIM(MER.MERCA)+" CON "+PC18+":"+TRANS(SAYPRE("+")*IVA118,"9999.99")+" " WIND
ON KEY LABEL F2 WAIT ALLTRIM(MER.MERCA)+" CON "+PC27+":"+TRANS(SAYPRE("+")*IVA127,"9999.99")+" " WIND
ON KEY LABEL F3 KEYB CHR(23)

SELE MER
SET ORDER TO TAG MERCA
DEFI WIND WIN FROM 5,5 TO WROWS()-2,WCOLS()-2 TITL "MAYORISTA "+TT ;
FONT "ARIAL",10

=CARTELX(" [F10] SALE / [F1]  +"+PC18+"/ [F2] +"+PC27+" [F3] % ")

BROW FIEL ARTICULO:R ,;
MERCA:R:H=PADC("DESCRIPCION",35):P=REPL("!",35) ,;
D=SAYPRE("+"):R:H="MAY S/IVA":P="9999.99" ,;
D1=SAYPRE("+")*IVA118:R:H="C/"+PC18:P="9999.99" ,;
D2=SAYPRE("+")*IVA127:R:H="C/"+PC27:P="9999.99" ;
FOR &FISC ;
WIND WIN ;
FONT "ARIAL",9 ;
FREE MERCA

ON KEY LABEL F10 
ON KEY LABEL F1
ON KEY LABEL F2
ON KEY LABEL F3
=RELEWIN("MENS")
RETURN RELEWIN("WIN")