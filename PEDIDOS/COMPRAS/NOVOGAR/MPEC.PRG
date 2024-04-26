*:*********************************************************************
*-- Programa: MPEC.PRG
*-- Fecha   : 11-14-91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA notas de pedido proveed.
**********************************************************************
PARAMETER fattal, desdec
PRIVATE desdecual,hastacual, cuantos
desdecual=desdec
cuantos=OCCURS(",",fattal)+1
hastacual=MIN(desdecual+13,cuantos)
STORE '999,999,999,999.99' TO picu2
STORE '@R 999-999-999-999-999-999' TO picu4
=pecmask()
=xseek(m.procod,'pro','procod')
@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
@ 2,nul SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
@ 3,nul SAY pro.localidad
@ 1,53 SAY m.pedido PICT "@!"
@ 2,53 SAY janname
@ 3,53 SAY m.fechaem
@ 4,15 say zpec11(m.condpago1)
@ 5,15 say zpec11(m.condpago2)
@ 6,15 say zpec11(m.condpago3)
@ 4,53 say presup1 PICT picu2
@ 5,53 say presup1 PICT picu2
@ 6,53 say presup1 PICT picu2
ren=10
kok=NUL
FOR I=desdecual TO hastacual
   SELE pe1
   nada=IIF(I=1,1,AT(",",fattal,I-1)+1)
   nada1=IIF(I=cuantos,LEN(fattal)+1,AT(",",fattal,I))
   GO VAL(SUBSTR(fattal, nada, nada1-nada))
   SCAT MEMV
   =SEEK(LEFT(m.articulo,13),'mer','articulo')
   @ ren ,c1 SAY m.articulo
   @ ren ,c2 SAY LEFT(mer.merca,29)
   @ ren,c3 SAY m.cantidad pict "9999999999"
   @ ren,c4 say m.monto pict "999,999,999.99"
   ren=ren+1
   IF REN>23
      REN=10
   ENDIF
NEXT
RETURN
