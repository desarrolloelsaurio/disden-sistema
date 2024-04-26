* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_SRU.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-19-92                                                   ³
* ³ Time created: 11:50:26am                                                 ³
* ³    Copyright: 1992 SISTEMAS INFORMATICOS S.R.L.                          ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
function qw_SRU
	parameter cual
	private cual
	STORE NUL TO SRU_SALIDA
	if filSRU=2
		qw_cosa=qwSRU(mixgrl(" Query de Subrubros ","Subrubro","Subrubros",.t.),cual)
		if qw_cosa#".F."
			qw=at(chr(250),qw_cosa)
			QUESRU=left(qw_cosa,qw-1)
			TTSRU=substr(qw_cosa,qw+1)
		else
			store 1 to filSRU
		endif
	endif
return SRU_SALIDA#2
