* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_SRU.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 12-19-92                                                   �
* � Time created: 11:50:26am                                                 �
* �    Copyright: 1992 SISTEMAS INFORMATICOS S.R.L.                          �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
