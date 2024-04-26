function qw_caj
parameter ren,col,cosa
private ren,col,cosa
store iif(filcaj=1,'.T.',iif(filcaj=2,'!','')+cosa+'="00"') to quecaj
return FILcaj#3
