********************************************************************************
*-- Programa: MMER.PRG
*-- Fecha   : 11-22-91 01:52am
*-- Version : G. REINER
*-- Notas   : MUESTRA MERCADERIA
********************************************************************************
parameter cosa
acti wind win
@ 2,40 SAY "ARTICULO" COLO SCHE 3
@ 1,2 SAY "RUBRO" COLO SCHE 3
@ 2,2 SAY "SUB-RUBRO" COLO SCHE 3
@ 3,2 SAY "MODELO" COLO SCHE 3
@ 4,nul SAY repl("-",wcol())
@ 5,2 SAY "DENOMINACION " COLO SCHE 3
@ 6,2 SAY "DESCRIPCION " COLO SCHE 3
@ 7,2 SAY "MARCA" COLO SCHE 3
@ 8,2 SAY "MEDIDAS" COLO SCHE 3
@ 9,nul SAY padc(" PROVEEDORES ",wcol(),'-')
@ 10,2 SAY "PROVEEDOR N§ 1" COLO SCHE 3
@ 11,2 SAY "PROVEEDOR N§ 2" COLO SCHE 3
@ 12,2 SAY "PROVEEDOR N§ 3" COLO SCHE 3
@ 13,nul SAY padc(" CARACTERISTICAS ",wcol(),'-')
@ 14,2 SAY "CARACTERISTICA N§ 1" COLO SCHE 3
@ 15,2 SAY "CARACTERISTICA N§ 2" COLO SCHE 3
@ 16,2 SAY "CARACTERISTICA N§ 3" COLO SCHE 3
@ 17,nul SAY padc(" OTROS ",wcol(),'-')
@ 18,2 SAY "GRUPO DE COMPRAS" COLO SCHE 3
@ 19,2 SAY "LINEA" COLO SCHE 3
@ 20,2 SAY "ALIMENTACION" COLO SCHE 3
@ 21,2 SAY "TEMPORADA" COLO SCHE 3
@ 22,2 SAY "COLOR" COLO SCHE 3
@ 23,2 SAY "ES ELECTRONICO ?" COLO SCHE 3
if cosa
	=OPRUB()
   =bussru(m.rubro,nul)
   nada=rub.rubro
   @ 1,col1 get nada
   do opsru
   =bussru(m.rubro,m.subrubro)
   nada=rub.rubro
   @ 2,col1 get nada
   sele mer
   @ 2,55 get m.articulo
   @ 3,col1 get m.modelo
   @ 5,col1 get m.merca
   nada=SAYMIX1(M.MARCA,"MARCOD")
   @ 7,col1 get nada
   @ 8,col1 get m.medidas
   nada1=iif(xseek(m.pro1,'pro','procod'),pro.proveedor,space(20))
   @ 10,col get nada1
   nada2=iif(xseek(m.pro2,'pro','procod'),pro.proveedor,space(20))
   @ 11,col get nada2
   nada3=iif(xseek(m.pro3,'pro','procod'),pro.proveedor,space(20))
   @ 12,col get nada3

   sele mi1
   set ORDER TO CARCOD
   seek(m.car1)
   nada=mi1.texto1
   @ 14,col get nada
   if !empty(m.car2)
      seek(m.car2)
      nada1=mi1.texto1
      @ 15,col get nada1
      if !empty(m.car3)
         set order to 1
         seek(m.car3)
         nada1=mi1.texto1
         @ 16,col get nada1
      endif
   endif
   nada=SAYMIX(M.GRUPO,"GRUCOD")
   @ 18,col get nada
   NADA=SAYMIX(M.LINEA,"LINCOD")
   @ 19,col get nada
   sele mi1
   set order to tag CARTEX
   NADA=SAYMIX1(M.ALIM,"ALICOD")
   @ 20,col get nada
   nada=qtem(m.temporada)
   @ 21,col get nada
   NADA=SAYMIX(M.COLOR,"COLCOD")
   @ 22,col get nada
   nada=iif(m.jean,'SI','NO')
   @ 23,col get nada
   clea gets
   sele mer
endif
return
