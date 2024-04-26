function elilote
para elarti
push key
select * from lot where articulo=elarti order by vencimient into cursor tmp
sele tmp
count to cuantlot
IF cuantlot > 1
	on key label F10 keyb chr(23)
	DEFI WIND WIN FROM 1,40 TO 37,81
	BROW FIEL ;
		LOTE:H="LOTE",;
		VENCIMIENT:H="VENCE" ;
		TITL " Elija LOTE " ;
		FONT "ARIAL",9 ;
		COLOR RGB(255,0,0,255,255,255) ;
	WIND WIN
	RELE WIND WIN
	ON KEY LABEL F10
	m.qualote = TMP.LOTE
	M.VENCIMIENT = TMP.VENCIMIENT
else 
	IF cuantlot = 1
		m.qualote = TMP.LOTE
	else
		wait "CUIDADO NO HAY LOTES !!!" wind nowa
		m.qualote = " "
	endif
ENDIF
pop key
****use in tmp
RETURN m.qualote