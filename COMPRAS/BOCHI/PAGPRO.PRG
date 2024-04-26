=oppro()
m.codpro=""
=opfar()
sele far
M.CODPRO=SEEKTECX(30,'PER','PER.CLIENTE','PER.CLIENTE',"PROVEEDO",ALIAS(),ORDER(),2,22)
M.CODPRO=PER.CODCLI
set orde to fecha
replace marca with 0 for codcli=m.codpro
on key label F2 do elmarca
on key label F10 KEYBOARD '{CTRL+W}'
defi wind a from 10,10 to 30,80 TITLE "ELIJA FACTURA A PAGAR     -     SELECCION CON [F2]   SALE CON [F10]"
acti wind a
brow fiel  a=iif(marca=0," ","*"), TIPO, factura:H="Factura", fechaem:H="Fecha", montonet:H="Monto" ;
	in wind a free a nomo for codcli=m.codpro
on key label F2
on key label F10
rele wind a

store 0 to totnet, totbru 
scan for codcli=m.codpro and marca=1
	if tipo="NC"
		totnet = totnet - montonet
		totbru = totbru - montobru
	else
		totnet = totnet + montonet
		totbru = totbru + montobru
	endif
endscan
m.codibru = allt(per.texto1)
m.porbru = iif(!empty(m.codibru) .and. xseek(m.codibru, "MIX", "BRUCOD"),mix.nu3,0)
store 0 to m.ingbrut
if totnet=>2000
	store m.porbru * m.totbru / 100 to m.ingbrut
endif
totfinal = totnet-ingbrut
do pagpro.spr
return

function elmarca
	replace marca with iif(marca=0,1 ,0)
	KEYB '{DNARROW}' PLAIN
return