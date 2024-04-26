*
*-- Programa: lpedp3.prg
*-- Fecha   :
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A listado de remitos
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*
ulpr=PROGRAM()
DO CASE
case bar()=1
   store nul to m.pedido,m.marca
   IF buspec()
      	 fisc='pedido=m.pedido .and. marca=m.marca'
      		 ttu='Nota de Pedido N§ '+alltrim(str(m.pedido))+" - "+alltrim(mar.marca)
      DO lpecp31
   ENDIF
CASE BAR()=2
   store nul to respuesta
   if !EMPTY(ELIEMP(" a Listar",-1,1))
      xcos=MIX.NU1
      ttu='Por Marca:'+alltrim(mar.marca)
      fisc="marca=xcos"
      do lpecp31
   endif
CASE BAR()=3
   ?"NO SE SI HAY !!!"
   *store nul to respuesta
   *if elimer(" a Listar",-1,1)#0
   *   xcos=mer.articulo
   *   ttu='Por Art¡culo:'+alltrim(mer.merca)
   *   fisc="articulo=xcos"
   *   do lpecp31
   *endif
CASE BAR()=4
   ?"NO EXISTE !!!"
   *store nul to respuesta
   *if elicur(" a Listar",-1,1)#0
   *   xcos=cur.curva
   *   ttu='Por Curva:'+alltrim(cur.curva)
   *   fisc="curva=xcos"
   *   do lpecp31
   *endif
CASE BAR()=5
   store nul to respuesta
   if !EMPTY(elicol(" a Listar",-1,1))
      xcos=recno()
      ttu='Por Color:'+alltrim(mix.texto1)
      fisc="color=xcos"
      do lpecp31
   endif
CASE BAR()=6
   FISC="cantidad#ENTREGADO"
   TTU='Pendientes'
   do lpecp31
CASE BAR()=7
   FISC="cantidad=ENTREGADO"
   TTU='Entregados'
   do lpecp31
CASE BAR()=8
   FISC="reservado"
   TTU='Reservados'
   do lpecp31
CASE BAR()=9
   FISC="!reservado"
   TTU='No Reservados'
   do lpecp31
ENDCASE
ulpr=PROGRAM()
@ 24,0 SAY SPACE(80)
UNLO ALL
RETURN
