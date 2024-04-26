*************************************************************
*-- Programa: EST.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE ESTRUCTURA DE PRODUCTO
*************************************************************
ulpr=PROGRAM()
=CABPAN1()
=OPDES()
sele EST
DO CASE
CASE BAR()=1
	DO IMER_DO.SPR WITH .F.," Ingresa Estructura ",11,.F.,.T.
CASE BAR()=2
	DO IMER_DO.SPR WITH .F.," Modifica Estructura ",12,.F.,.T.
CASE BAR()=4
	RESPUESTA='nada#8#45#L¡mites de Borrado#3#\<Toda la Estructura#Al\<g£n Proceso'
    =DEFPOP()
	on sele popu nada DO BEST
	acti popu nada
	rele popu nada
CASE BAR()=5
***********   do rest
   store '' to M.ARTIC_CLR
   DO IMER_DO.SPR WITH .F.," Repite Estructura Completa ",99,.F.,.T.
   IF !EMPTY(M.ARTIC_CLR)
      M.ARTIC_CLR1=M.ARTIC_CLR
      store '' to M.ARTIC_CLR
      DO IMER_DO.SPR WITH .F.," Repite Completa de "+alltr(M.ARTIC_CLR1)+" ",98,.F.,.T.
      IF !EMPTY(M.ARTIC_CLR)
         M.ARTIC_CLR2=M.ARTIC_CLR
         DO RDES.SPR WITH "X", m.artic_clr1, m.artic_clr2, " Repite Estructura Completa ",.T.
      ENDIF
   ENDIF
CASE BAR()=7 
RESPUESTA='NADA#10#25#L¡mites del Listado#3;
#\<Un Producto;
#Un Producto (\<Detalle);
#\<Por Proceso de Fabricaci¢n'
=DEFPOP()
on sele popu nada do lest 
acti popu nada
rele popu nada
CASE BAR()=9
   DO xEST
ENDCASE
ulpr=PROGRAM()
unlo all
RETURN MEN_LIN(BOTOM)
