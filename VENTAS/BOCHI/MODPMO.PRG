* MODIFICA COSTOS EN DOLARES
=OPMIX()
M.PORLISMAY=GETNU1("PORLISMAY","FOXGRL")
M.PORLISMIN=GETNU1("PORLISMIN","FOXGRL")
M.FLETE=GETNU1("FLETE","FOXGRL")

ON KEY LABEL F10 KEYB CHR(23)

SELE MER
SET ORDER TO TAG MERCA

DEFI WIND win FROM 5,5 TO WROWS()-2,WCOLS()-2 TITL "MOD. PRECIOS "+tt ;
	FONT "ARIAL",10

=CARTELX(" [F10] SALE ")

fisc = fisc + " AND !empty(moneda)"

BROW FIEL articulo:p="!!!!!!!!!!":R:14 ,;
	merca:R:H=PADC("DESCRIPCION",35):p=REPL("!",35) ,;
	mer.fob:H="FOB":p="99999999.99":v=convmoneda(mer.fob, mer.moneda, mer.nacion) ,;
	na=mer.fob*(1+nacion/100):H="NAC.":p="999999.99" ,;
	mer.moneda:H="MO":R ,;
	DD =pasamoneda(saypre("+"), mer.moneda):R:H="MAY S/IVA":p="9999999.99" ,;
	dd1=pasamoneda(saypre("-"), mer.moneda):R:H="MIN S/IVA":p="9999999.99" ,;
	mer.dolar:H="$ COSTO":p="999999.99":R ,;
	D =saypre("+"):R:H="$ MAY S/IVA":p="9999999.99" ,;
	d1=saypre("-"):R:H="$ MIN S/IVA":p="9999999.99" ;
	FOR &fisc ;
	WIND win ;
	FONT "ARIAL",9 ;
	FREE fob

ON KEY LABEL F10
ON KEY LABEL F1
ON KEY LABEL F2
ON KEY LABEL F3
=RELEWIN("MENS")
RETURN RELEWIN("WIN")

FUNCTION convmoneda
PARA plata, moneda, pornac
lamone = plata * getnu1(moneda, "FOXGRL",3)
REPLACE mer.dolar WITH lamone * (1+pornac/100)
RETURN .T.

FUNCTION pasamoneda
PARA plata, moneda
lamone = plata / getnu1(moneda, "FOXGRL",3)
RETURN lamone
