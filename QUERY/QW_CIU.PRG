* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_CIU.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 12-19-92                                                   �
* � Time created: 11:50:26am                                                 �
* �    Copyright: 1992 SISTEMAS INFORMATICOS S.R.L.                          �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
