* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_TEM.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 12-19-92 08:54pm                                           �
* �    Copyright: 1992 SISTEMAS INFORMATICOS S.R.L.                          �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_TEM
PARAMETER CUAL
STORE NUL TO TEM_SALIDA
if filTEM=2
  qw_cosa=qwTEM(mixgrl(" Query de Temporadas ","Temporada","Temporadas"),cual)
   if qw_cosa#".F."
	  qw=at(chr(250),qw_cosa)
      QUETEM=left(qw_cosa,qw-1)
	  TTTEM=substr(qw_cosa,qw+1)
   else
      store 1 to filTEM
   endif
endif
return TEM_SALIDA#2
