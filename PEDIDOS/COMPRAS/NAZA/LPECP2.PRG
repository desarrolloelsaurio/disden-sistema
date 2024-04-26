*
*-- Programa: lpedp2.prg
*-- Fecha   :
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A listado de nota de pedido proveed.
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*
ulpr=PROGRAM()
DO CASE
CASE BAR()=1
   store nul to respuesta
   if !EMPTY(ELIEMP(" a Listar",-1,1))
      xcos=MIX.NU1
      ttu='Por Marca:'+alltrim(mar->marca)
      fisc="marca=xcos"
      do lpedp21
   endif
case bar()=2
   store nul to respuesta
   if !EMPTY(elipro(" a Listar",-1,1))
      xcos=procod
      ttu='Por Proveedor:'+alltrim(pro->proveedor)
      fisc="procod=xcos"
      do lpedp21
   endif
case bar()=3
   ? "NO EXISTE !!!"
   *store nul to respuesta
   *if elivia(" a Listar",-1,1)#0
   *   xcos=codvia
   *   ttu='Por Viajante:'+alltrim(via->viajante)
   *   fisc="codvia=xcos"
   *   do lpedp21
   *endif
case bar()=4
   store nul to respuesta
   if !EMPTY(eliPAG(" a Listar",-1,1))
      xcos=RECNO()
      m->texto1=TRANSFORM(mix->texto1, "@R 999-999-999-999")
      m->texto1=STRTRAN(m->texto1,'-000',SPACE(4))
      ttu='Por Condici¢n:'+alltrim(m->texto1)
      fisc="condpago1=xcos .or. condpago2=xcos .or. condpago3=xcos"
      do lpedp21
   endif
ENDCASE
ulpr=PROGRAM()
@ 24,0 SAY SPACE(80)
UNLO ALL
RETURN
