*
*-- Programa: lpecp4.prg
*-- Fecha   :
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A listado de notas de pedido proveed.
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*
ulpr=PROGRAM()
DO CASE
case bar()=1
   store nul to m->pedido,m->marca
   IF buspec()
      	 fisc='pedido=m->pedido .and. marca=m->marca'
      		 ttu='Nota de Pedido N§ '+alltrim(str(m->pedido))+" - "+alltrim(mar->marca)
      DO lpecp41
   ENDIF
CASE BAR()=2
   store nul to respuesta
   if !EMPTY(ELIEMP(" a Listar",-1,1))
      xcos=MIX.NU1
      ttu='Por Marca:'+alltrim(mar->marca)
      fisc="marca=xcos"
      do lpecp41
   endif
case bar()=3
   store nul to respuesta
   if !EMPTY(elipro(" a Listar",-1,1))
      xcos=procod
      ttu='Por Proveedor:'+alltrim(Pro->proveedor)
      fisc="procod=xcos"
      do lpecp41
   endif
case bar()=4
   ?"NO EXISTE !!!"
   * store nul to respuesta
   * if elivia(" a Listar",-1,1)#0
   *    xcos=codvia
   *    ttu='Por Viajante:'+alltrim(via->viajante)
   *    fisc="codvia=xcos"
   *    do lpecp41
   * endif
case bar()=5
   store nul to respuesta
   if !EMPTY(eliPAG(" a Listar",-1,1))
      xcos=RECNO()
      m->texto1=TRANSFORM(mix->texto1, "@R 999-999-999-999")
      m->texto1=STRTRAN(m->texto1,'-000',SPACE(4))
      ttu='Por Condici¢n:'+alltrim(m->texto1)
      fisc="condpago1=xcos .or. condpago2=xcos .or. condpago3=xcos"
      do lpecp41
   endif
ENDCASE
ulpr=PROGRAM()
@ 24,0 SAY SPACE(80)
UNLO ALL
RETURN
