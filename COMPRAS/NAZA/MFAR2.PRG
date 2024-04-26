*:*********************************************************************
*:
*:        Program: MFAR2.PRG
*:
*:         System: SYSTEMA DE COMPRAS
*:         Author: GOYO REINER
*:      Copyright (c) 1992, NAZA S.R.L.
*:  Last modified: 12/18/91     12:10
*:
*:      Called by: IDEBC2.PRG                    
*:               : LFAR.PRG                      
*:
*:          Calls: FARMASK.PRG
*:               : UNID()         (function  in ?)
*:
*:      Documented 01/30/92 at 15:51               FoxDoc  version 2.01
*:*********************************************************************
*
*-- Programa: Mfar2.PRG
*-- Fecha   : 06/12/91 03:03pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA factura proveed.
*
PARAMETER fattal, desdec, tipofar
desdecual=desdec
cuantos = OCCURS(",",fattal)+1
hastacual=MIN(desdecual+13,cuantos)
DO farmask
SELE pro
SET ORDER TO 1
SEEK m.procod
@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
@ 2,0 SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
@ 3,0 SAY pro.localidad
IF tipofar
   @ 1,66 SAY m.factura PICT "@Z 9999999999"
ELSE
   @ 1,66 SAY m.debito PICT "@Z 9999999999"
ENDIF
GO m.marca IN ("MAR")
@ 2,53 SAY mar.marca
@ 3,53 SAY m.fechaem
IF m.condpago>0
   GO m.condpago IN ("MIX")
   @ 4,15 SAY mix.texto1 PICT "@R 999-999-999-999-999-999"
ENDIF
ren=10
kok=0
FOR I=desdecual TO hastacual
   SELE fad
   nada=IIF (I=1,1,AT(",",fattal,I-1)+1)
   nada1=IIF(I=cuantos,LEN(fattal)+1,AT(",",fattal,I))
   GO VAL(SUBSTR(fattal, nada, nada1-nada))
   SCAT MEMV
   IF tipopec="M"
      SELE mer
      SET ORDER TO 1
      SEEK LEFT(m.articulo,13)
      @ ren ,d1 SAY LEFT(m.articulo,13)
      @ ren ,d2 SAY LEFT(mer.merca,8)
   ELSE
      IF tipopec="T"
         SELE tel
         SET ORDER TO 1
         SEEK LEFT(m.articulo,10)
         @ ren ,d1 SAY LEFT(m.articulo,10)
         @ ren ,d2 SAY LEFT(tel.tela,8)
      ELSE
         IF tipopec="A"
            SELE avi
            SET ORDER TO 1
            SEEK LEFT(m.articulo,10)
            @ ren ,d1 SAY LEFT(m.articulo,10)
            @ ren ,d2 SAY LEFT(avi.avios,8)
         ELSE
            @ ren ,d1 SAY m.articulo
            @ ren ,d2 SAY LEFT(m.descripcio,8)
         ENDIF
      ENDIF
   ENDIF
   IF m.talle>0
      @ ren, d3 SAY m.talle        PICT "99.99"
   ENDIF
   IF m.unidad>0
      @ ren, d4 SAY unid(m.unidad) PICT "XXXX"
   ENDIF
   @ ren, d5 SAY m.cantidad - m.devuelta  PICT "@Z 9999999999"
   @ ren, d6 SAY m.monto /m.cantidad PICT "@Z 99999,999,999.99"
   @ ren, d7 SAY m.monto        PICT "@Z 99999,999,999.99"
   ren=ren+1
   NEXT
   RETURN
*: EOF: MFAR2.PRG
