* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : TITM4.PRG                                                �
* � COMENTARIO    :                                                          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-13-93                                                    �
* � HORA       : 08:56:20pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION TITM4
? TIT1
? TIT2
if !EMPTY(KREPORTE)
   ? "Reporte: "+KREPORTE
   store C+1 to C
endif
? "FECHA: "+TRAN(DATE(),PICFEC)+"                                                                                                     Pag.: "+str(NPAG,4)
? REPL("-",43)
? PAIPD+str(MCOD,8)+" "+MNOM+PAIPI
? REPL("-",137)
? "! ASIE ! MOVI !              CONCEPTO              !  FECHA !        DEBE      !       HABER      !   SALDO  DEUDOR  !  SALDO  ACREEDOR !"
? REPL("-",137)
