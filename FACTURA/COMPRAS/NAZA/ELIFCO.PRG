*:*********************************************************************
*-- Programa: ELIFCO.PRG
*-- Fecha   : 12-10-91 09:31am
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE LA FACTURA
*-- Modif.  : GOYO 05-30-92 07:29pm (MOVEWIN)
*!*********************************************************************
FUNCTION elifco
=MOVEWIN(ipedr,ipedc,ipedr+ipedla,ipedc+ipedan,'WIN2'," Facturas ")
SELE far
SCAT MEMV BLAN
@ 1,3  SAY "Proveedor: "
@ 1,45 SAY "N£mero de FACTURA  : "
SELE pro
STORE nul TO respuesta
IF EMPTY(elipro("",1,13))
   respu=.F.
ELSE
   m.procod = pro.procod
   @ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
   @ 2,0 SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
   @ 3,0 SAY pro.localidad
   @ 1,66 GET m.factura PICT "@Z 9999999999";
      MESS 'Ingrese Nro de FACTURA [ENTER] p/menu'
   READ
   SELE far
   respu=IIF(m.factura=0,.F.,SEEK(STR(m.factura)+m.procod))
ENDIF
RETURN respu
