FUNCTION ALGUNO
PARAMETER ARREGLO,TX,CLIX
PRIVATE ALCUAN,ALX,salida
ALCUAN=ALEN(ARREGLO,1)
DEFI WIND WIN FROM 0,0 TO ALCUAN+3,25 FOOT ALLTRIM(CLIX) TITL TX DOUB SHAD COLO SCHE 8
=CENTWIN()
acti wind win
parele=''
FOR ALX=1 TO ALCUAN
VA='Vx'+ALLTRIM(STR(row()+1))
IF TYPE("ELTEXTO")#"C"
   STORE 'Factura Remito N§ '+alltrim(str(arreglo[alx,1]))+' ?' TO &VA
ELSE
   STORE eltexto+' '+alltrim(str(arreglo[alx,1]))+' ?' TO &VA
ENDIF
@ row()+1,1 get arreglo[alx,3] pict str(arreglo[alx,1]) func '*C' MESS &VA
@ row(),15 say arreglo[alx,2]
ENDF
READ
rele all like vx*
salida=.f.
for alx=1 to alcuan
   salida=iif(arreglo[alx,3],.t.,salida)
endf
=relewin("win")
RETURN salida