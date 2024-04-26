* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : REOPALQ.PRG                                              บ
* บ COMENTARIO    : REABRE BASE DE ALQUILERES - BORRA TEMPORAL               บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION REOPALQ
=REOPXXX("ALQ")
RETURN IIF(TYPE("AFUTURO")#"U" .AND. AFUTURO,OPALQ() .AND. OPALQFUT(.F.),OPALQ())
