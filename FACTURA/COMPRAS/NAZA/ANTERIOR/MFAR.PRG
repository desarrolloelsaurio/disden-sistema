*:*********************************************************************
*-- Programa: Mfar.prg
*-- Fecha   : 07-08-92 10:52am
*-- Version : R. 'EL BATA'/GOYO
*-- Notas   : MUESTRA factura proveed.
*:**********************************************************************
DO FCDMASK
SELE pro
=XSEEK(FAR.procod,'PRO','PROCOD')
   picu="@Z 99,999,999,999.99999"
@ 1,2 SAY ALLTRIM(pro->procod) + " " + ALLTRIM(pro->proveedor)
@ 2,0 SAY ALLTRIM(pro->domicilio) + " T.E." + ALLTRIM(pro->telefono)
@ 3,0 SAY pro->localidad
   @ 1,66 SAY m->factura PICT "@!"
@ 3,53 SAY m->fechaem
IF m->condpago>0
   =XSEEK(m->condpago,'MIX','PAGTEX')
   @ 4,15 SAY mix->texto1 PICT "@R 999-999-999-999-999-999"
ENDIF
                  MOVE WIND WIN2 TO 0,0
                  =MOVEWIN(10,0,23,45,'WIN10',' *** TOTAL '+tit_sin+' *** ')
                  @ 1,1 SAY "MONTO TOTAL "+padr(abr,7)+":"
                  @ 2,1 SAY "MONTO DESCUENTO    :"
                  @ 3,1 SAY "MONTO NETO GRAVADO :"
                  @ 4,1 SAY "MONTO I.V.A.       :"
                  @ 5,1 SAY "MONTO IMPUESTO 1)  :"
                  @ 6,1 SAY "MONTO IMPUESTO 2)  :"
                  @ 7,1 SAY "MONTO EXENTO       :"
                  @ 8,1 SAY "RECARGO FINANCIERO :"
                  @ 9,1 SAY "PERCEPCION         :"
                  @10,1 SAY "MONTO TOTAL "+padr(abr,7)+":"
                  @ 1,21 GET m->monto PICT picu
                  @ 2,21 GET m->descuento PICT picu
                  @ 3,21 GET m->montobru PICT PICU
                  @ 4,21 GET m->montoiva  PICT picu
                  @ 5,21 GET m->montoot2  PICT picu
                  @ 6,21 GET m->montoot3  PICT picu
                  @ 7,21 GET m->montoexe  PICT picu
                  @ 8,21 GET m->montoref  PICT picu
                  @ 9,21 GET m->montoper  PICT picu
                  @ 10,21 GET m->montonet  PICT picu
									CLEAR GETS
RETURN
