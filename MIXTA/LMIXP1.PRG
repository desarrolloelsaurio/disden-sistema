* ษออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMIXP1.PRG             บ
* บ COMENTARIO    : MAIN IMPRESION MIXTA   บ
* ศออออออออออออออออออออออออออออออออออออออออผ
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
