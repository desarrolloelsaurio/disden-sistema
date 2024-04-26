set dele on
sele 1
use f:\sistemas\ventas\ventasa\cccli  alias ccli
sele 2
use f:\sistemas\ventas\ventasa\ccclih alias cclh
sele ccli
scan for COMPRRE="SD" or COMPRRE="SA" 
	sele cclh
	sum  comision, comisip for codcli=ccli.codcli and ;
    	  (COMPRRE="FA" .OR. COMPRRE="ND" .OR. COMPRRE="SD") to com, comp
	sum  comision, comisip for codcli=ccli.codcli to tcom, tcomp
	sele ccli
	repl comision with 2 * com  - tcom, comisip  with 2 * comp - tcomp
endscan
return
