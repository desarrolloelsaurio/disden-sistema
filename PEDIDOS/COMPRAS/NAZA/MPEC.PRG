*:*********************************************************************
*-- Programa: MPEC.PRG
*-- Fecha   : 11-14-91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA notas de pedido proveed.
**********************************************************************
PARAMETER fattal, desdec
PRIVATE desdecual,hastacual, cuantos
desdecual=desdec
cuantos = OCCURS(",",fattal)+1
hastacual=MIN(desdecual+13,cuantos)
STORE '999,999,999,999.99' TO picu2
STORE '@R 999-999-999-999-999-999' TO picu4
ACTI WIND win2
DO pecmask
SELE pro
SET ORDER TO 1
SEEK m.procod
@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
@ 2,0 SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
@ 3,0 SAY pro.localidad
@ 1,66 SAY m.pedido PICT "@Z 9999999999"
GO m.marca IN ("MAR")
@ 2,53 SAY mar.marca
@ 3,53 SAY m.fechaem
IF m.condpago1 > 0
   GO m.condpago1 IN ("MIX")
   @ 4,15 SAY mix.texto1 PICT picu4
   @ 4,53 SAY m.presup1 PICT picu2
   IF m.condpago2 > 0
      GO m.condpago2 IN ("MIX")
      @ 5,15 SAY mix.texto1 PICT picu4
      @ 5,53 SAY m.presup2 PICT picu2
      IF m.condpago3 > 0
         GO m.condpago3 IN ("MIX")
         @ 6,15 SAY mix.texto1 PICT picu4
         @ 6,53 SAY m.presup3 PICT picu2
      ENDIF
   ENDIF
ENDIF
ren=10
kok=0
FOR I=desdecual TO hastacual
   SELE pe1
   nada=IIF( I=1,1,AT(",",fattal,I-1)+1)
   nada1=IIF (I=cuantos, LEN(fattal)+1, AT(",",fattal,I))
   GO VAL(SUBSTR(fattal, nada, nada1-nada))
   SCAT MEMV
   IF tipopec="M"
      SELE mer
      SET ORDER TO 1
      SEEK LEFT(m.articulo,13)
      @ ren ,c1 SAY LEFT(m.articulo,13)
      @ ren ,c2 SAY LEFT(mer.merca,29)
      IF m.color>0
         SELE mix
         rtc=SUBSTR(m.articulo,12,2)
         SET FILTER TO filtro='O'
         SCAN FOR LEFT(texto2,2)=rtc
            EXIT
         ENDSCAN
         IF !EOF()
            @ ren, c6 SAY LEFT(mix.texto1,7)
         ENDIF
      ENDIF
   ELSE
      IF tipopec="T"
         SELE tel
         SET ORDER TO 2
         SEEK LEFT(m.articulo,10)
         @ ren ,c1 SAY LEFT(m.articulo,10)
         @ ren ,c2 SAY LEFT(tel.tela,29)
         IF m.color>0
            GO m.color IN ("MIX")
            @ ren, c6 SAY LEFT(mix.texto1,7)
         ENDIF
      ELSE
         IF tipopec="A"
            SELE avi
            SET ORDER TO 1
            SEEK LEFT(m.articulo,10)
            @ ren ,c1 SAY LEFT(m.articulo,10)
            @ ren ,c2 SAY LEFT(avi.avios,29)
            IF m.color>0
               GO m.color IN ("MIX")
               @ ren, c6 SAY LEFT(mix.texto1,7)
            ENDIF
         ELSE
            @ ren ,c1 SAY m.articulo
            @ ren ,c2 SAY m.descripcio
            IF m.color>0
               GO m.color IN ("MIX")
               @ ren, c6 SAY LEFT(mix.texto1,7)
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   @ ren, c3 SAY m.talle        PICT "@Z 99.99"
   @ ren, c4 SAY unid(m.unidad) PICT "xxxxxx"
   @ ren, c5 SAY m.cantidad 	 PICT "@Z 9999999999"
   ren=ren+1
   NEXT
   RETURN
*: EOF: MPEC.PRG
