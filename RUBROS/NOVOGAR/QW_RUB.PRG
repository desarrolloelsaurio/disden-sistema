* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_RUB.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-19-92                                                   ³
* ³ Time created: 11:50:26am                                                 ³
* ³    Copyright: 1992 SISTEMAS INFORMATICOS S.R.L.                          ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
function qw_RUB
parameter cual
private cual
STORE NUL TO RUB_SALIDA
if filRUB=2
	 qw_cosa=qwRUB(mixgrl(" Query de Rubros ","Rubro","Rubros",.t.),cual)
     if qw_cosa#".F."
		qw=at(chr(250),qw_cosa)
        QUERUB=left(qw_cosa,qw-1)
		TTRUB=substr(qw_cosa,qw+1)
   else
      store 1 to filRUB
   endif
endif
return RUB_SALIDA#2
