* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_IVA.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 12-19-92 08:54pm                                           �
* �    Copyright: 1992 SISTEMAS INFORMATICOS S.R.L.                          �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
function qw_iva
parameter cual
private cual
STORE NUL TO IVA_SALIDA
if filIVA=2
  qw_cosa=qwiva(mixgrl(" Query de I.V.A. ","Condici줻 de I.V.A.","Condiciones de I.V.A."),cual)
   if qw_cosa#".F."
	  qw=at(chr(250),qw_cosa)
      QUEIVA=left(qw_cosa,qw-1)
	  TTIVA=substr(qw_cosa,qw+1)
   else
      store 1 to filIVA
   endif
endif
return IVA_SALIDA#2
