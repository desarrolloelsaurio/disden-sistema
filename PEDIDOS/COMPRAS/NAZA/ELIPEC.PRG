*:*********************************************************************
*-- Programa: ELIPEC.PRG
*-- Fecha   : 12-10-91 09:31am
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE LA NOTA DE PEDIDO
*!*********************************************************************
FUNCTION elipec
**** =MOVEWIN(ipedr,ipedc,ipedr+ipedla,ipedc+ipedan,'WIN2'," Notas de pedido ")
DEFINE WINDOW win2 FROM ipedr,ipedc TO ipedr+ipedla,ipedc+ipedan TITL " Ingreso de Notas de Pedido " SHAD COLOR SCHE 8 NONE
SELE pec
SCAT MEMV BLAN
@ 1,3  SAY "Proveedor: "
@ 1,45 SAY "Nro NOTA DE PEDIDO : "
SELE pro
STORE nul TO respuesta
IF EMPTY(elipro("",1,13))
   respu=.F.
ELSE
   ACTI WIND win2
   m->procod = pro->procod
   @ 1,2 SAY ALLTRIM(pro->procod) + " " + ALLTRIM(pro->proveedor)
   @ 2,0 SAY ALLTRIM(pro->domicilio) + " T.E." + ALLTRIM(pro->telefono)
   @ 3,0 SAY pro->localidad
   @ 1,66 GET m->pedido PICT "@Z 9999999999";
      MESS 'Ingrese Nro de Pedido [ENTER] p/menu'
   READ
   SELE pec
   respu=IIF(m->pedido=0, .F., SEEK(STR(m->pedido)+m->procod))
ENDIF
RETURN (respu)
*: EOF: ELIPEC.PRG

