* 浜様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LMIXP1.PRG             �
* � COMENTARIO    : MAIN IMPRESION MIXTA   �
* 藩様様様様様様様様様様様様様様様様様様様夕
FUNCTION LMIXP1
#DEFINE PAIP "|"                                 && PAIP
? PAIP
?? STR(RECNO(),5)
?? PAIP
?? MIX.TEXTO1 PICT TEXTO[1,3]
?? PAIP
?? MIX.TEXTO2 PICT TEXTO[2,3]
=QOUT(IIF(MASUNO,PAIP+STR(MIX.NU1,TEXTO[3,9],2),""))
=IMPUSE()
RETURN .T.
