* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : REOPALQ.PRG                                              �
* � COMENTARIO    : REABRE BASE DE ALQUILERES - BORRA TEMPORAL               �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION REOPALQ
=REOPXXX("ALQ")
RETURN IIF(TYPE("AFUTURO")#"U" .AND. AFUTURO,OPALQ() .AND. OPALQFUT(.F.),OPALQ())
