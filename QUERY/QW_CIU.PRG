* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_CIU.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-19-92                                                   ³
* ³ Time created: 11:50:26am                                                 ³
* ³    Copyright: 1992 SISTEMAS INFORMATICOS S.R.L.                          ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
function qw_ciu
parameter cual
private cual
STORE NUL TO CIU_SALIDA
if filciu=2
	 qw_cosa=qwciu(ciugrl(" Query de Ciudades "),cual)
     if qw_cosa#".F."
		qw=at(chr(250),qw_cosa)
        QUECIU=left(qw_cosa,qw-1)
		TTciu=substr(qw_cosa,qw+1)
   else
      store 1 to filciu
   endif
endif
return CIU_SALIDA#2
