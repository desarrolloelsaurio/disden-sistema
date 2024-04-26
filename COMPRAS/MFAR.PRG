*
*-- Programa: Mfar.PRG
*-- Fecha   : 06/12/91 03:03pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA FACTURA PROVEED.
*
PARAMETER fattal, desdec
PRIVATE desdecual,hastacual, cuantos
desdecual=desdec
cuantos = OCCURS(",",fattal)+1
hastacual=min (desdecual+13,cuantos)
STORE '999,999,999,999.99' TO picu2
STORE '@R 999-999-999-999-999-999' TO picu4
ACTI WIND win2
DO farmask with .t.
SELE pro
SET ORDER TO 1
SEEK m.procod
@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
@ 2,0 SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
@ 3,0 say pro.localidad
@ 1,66 SAY m.pedido PICT "@Z 9999999999"
GO m.marca IN ("MAR")
@ 2,53 SAY mar.marca
@ 3,53 SAY m.fechaem
if m.condpago1 > 0
   GO m.condpago1 IN ("MIX")
   @ 4,15 SAY mix.texto1 PICT picu4
   @ 4,53 SAY m.presup1 PICT picu2
   if m.condpago2 > 0
      GO m.condpago2 IN ("MIX")
      @ 5,15 SAY mix.texto1 PICT picu4
      @ 5,53 SAY m.presup2 PICT picu2
      if m.condpago3 > 0
         GO m.condpago3 IN ("MIX")
         @ 6,15 SAY mix.texto1 PICT picu4
         @ 6,53 SAY m.presup3 PICT picu2
      endif
   endif
endif
ren=10
kok=0
FOR I=desdecual TO hastacual
   SELE pe1
   nada=iIF(I=1,1,AT(",",fattal,I-1)+1)
   nada1=iIF(I=cuantos,LEN(fattal)+1,AT(",",fattal,I))
   GO VAL(SUBSTR(fattal, nada, nada1-nada))
   SCAT MEMV
   if M.tipo
      SELE mer
      SET ORDER TO 1
      SEEK LEFT(m.articulo,13)
      @ ren ,c1 SAY LEFT(m.articulo,13)
      @ ren ,c2 SAY LEFT(mer.merca,18)
   else
      @ ren ,c1 SAY m.articulo
      @ ren ,c2 SAY left(m.descripcio,18)
   ENDIF
   @ ren, c3 SAY m.talle                 PICT "99.99"
   @ ren, c4 SAY unid(m.unidad)          PICT "XXXXXX"
   @ ren, c5 SAY m.cantidad-m.facturado PICT "@Z 9999999999"
   @ ren, c6 SAY    importes[I]           PICT "@Z 999,999,999,999.99"
   ren=ren+1
NEXT
RETURN
*: EOF: MREC.PRG
