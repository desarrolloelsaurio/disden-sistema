function qw_ope
  parameter ren,col
  private ren,col
  queope=iif(filope=1,".T.",iif(filope=2,'caj.monto<nul','caj.monto>nul'))
  ttope =iif(filope=1,"",iif(filope=2,'D‚bitos','Cr‚ditos'))
  @ ren,col say ttope
return .t.
