procedure _f11000
if !pideclav(1)
	return
endif
=opcli()
=opfac()
store 0 to m.respuesta
eltrim=infic(12,"Mes a Listar")
if !empty(eltrim) .and. last()#27
   store 0 to m.respuesta
   elANIO=infic(YEAR(DATE()),"A¤o a Listar")
   if !empty(elANIO) .and. last()#27
   if confirma("Listado Fact. Mayores a 10000 - "+ALLTRIM(STR(M.ELTRIM))+"/"+STR(ELANIO,4),.t.,20,10)
   ULPR="LF15000"
   =working()
   =dotalk()
   TT="Clientes con Operaciones mayores a $ 10.000,00"
   tt1="En "+qmes(m.eltrim)+" de "+STR(ELANIO,4)
   tmp=gentmp()
   tmp1=gentmp()   
   sele fac
   set order to
   =flock() .or. flok()
   copy to (tmp) field codcli,PER.CLIENTE,tipo,montoiva,montoot2,montonet ;
   for month(fac.fechaem)=m.eltrim .and. ;
   year(fac.fechaem)=elanio
   =unlo_prx("fac",tmp)
   sele tmp
   repl all montoiva with 0, montoot2 with 0
   repl montoiva with montonet for empty(tipo) .or. tipo="FA" .or. tipo="ND"
   repl montoot2 with montonet for empty(montoiva)
   index on codcli tag codcli
   set order to tag codcli
   total on codcli to (tmp1)
   =prxarea(.t.)
   use (tmp1) alias tmp1 excl
   dele for montoiva-abs(montoot2)<10000
   set order to tag codcli in per
   set rela to codcli into per
   dele for "CONTADO" $ PER.CLIENTE
   dele for "TARJETA" $ PER.CLIENTE
   SET RELA OFF INTO PER
   pack
   index on codcli tag codcli
   sele fac
   set order to tag codcli
   set rela to codcli into tmp1

*   if type("pormonit")#"U" .and. pormonit
*   repo form lf15000 ;
*   for !empty(tmp1.codcli) .and. month(fac.fechaem)=m.eltrim .and. ;
*   year(fac.fechaem)=elanio ;
*   prev 
*   else
*   repo form lf15000 ;
*for !empty(tmp1.codcli) .and. month(fac.fechaem)=m.eltrim .and. ;
*   year(fac.fechaem)=elanio ;
 *  NOCONSOLE ;
  * to prin PROMPT
   *endif
copy to tmp ;
for !empty(tmp1.codcli) .and. month(fac.fechaem)=m.eltrim .and. ;
year(fac.fechaem)=elanio 
   =off_tmp()
   =untalk()
   =unwork()
   ENDIF
else
   =noselec(iif(_windows,"AÑO","A¥O"))
endif
else
   =noselec("PERIODO")
endif
return .t.