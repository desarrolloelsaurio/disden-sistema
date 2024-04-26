FUNCTION TITM1
? TIT
if !EMPTY(KREPORTE)
   ? "Reporte: "+KREPORTE
   store C+1 to C
ELSE
   =TITLIM(135)   
endif
=ARRASTIT(135)
? TITSHIT("FECHA: "+TRAN(DATE(),PICFEC),"Pag.: "+str(NPAG,4),135)
? REPL("-",43)
? PAIPD+str(MCOD,8)+" "+MNOM+PAIPI
? REPL("-",135)
? "! ASIE ! MOVI !             CONCEPTO             !  FECHA !        DEBE      !       HABER      !   SALDO  DEUDOR  !  SALDO  ACREEDOR !"
? REPL("-",135)
RETURN
