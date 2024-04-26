function mmer1
=movewin(rr1,cc1,rr2,cc2,'win'," Producto a Ingresar ")
@ 1,1 SAY "ARTICULO" COLO SCHE 3
@ 2,1 SAY "DENOMINACION " COLO SCHE 3
@ 3,1 SAY "RUBRO" COLO SCHE 3
@ 4,1 SAY "LINEA" COLO SCHE 3
@ 5,1 SAY "MARCA" COLO SCHE 3
@ 1,COL GET rtc
@ 2,COL GET m.merca
=xseek(m.rubro,'mix','rubcod')
nada=mix.texto1
@ 3,COL GET nada
=xseek(m.linea,'mix','lincod')
nada=mix.texto1
@ 4,COL GET nada
=xseek(m.marca,'mix','marcod')
nada=mix.texto1
@ 5,COL GET nada
CLEAR GETS
return .t.
