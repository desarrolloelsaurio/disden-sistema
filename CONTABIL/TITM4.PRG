* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : TITM4.PRG                                                บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-13-93                                                    บ
* บ HORA       : 08:56:20pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
