* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : TITM2.PRG                                                �
* � COMENTARIO    :                                                          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-13-93                                                    �
* � HORA       : 08:56:33pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION TITM2
CLEA
@ 0,0 SAY TIT
if !EMPTY(KREPORTE)
   @ $+1,0 SAY "Reporte: "+KREPORTE
   store C+1 to C
ELSE
   =TITLIM(79)
endif
@ $+1,0 SAY TITSHIT("FECHA: "+TRAN(DATE(),PICFEC),"Pag.: "+str(NPAG,4))
? REPL("-",43)
? PAIPD+str(MCOD,8)+" "+MNOM+PAIPI
? REPL("-",79)
? "ASIE MOVI  CONCEPTO   FECHA          DEBE       HABER   SAL DEUDOR SAL ACREEDOR"
? REPL("-",79)
RETURN
