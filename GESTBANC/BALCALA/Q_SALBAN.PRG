********************************************************************************
*-- Programa: Q_SALBAN.PRG
*-- Fecha   : 05-13-92 03:16am
*-- Version : G. REINER
*-- Notas   : CALCULA LA DEUDA DE UN CLIENTE Y DEVUELVE EN VAR1 Y 2
********************************************************************************
PARAMETER BNCO,VAR1,VAR2,FISCO
PRIVATE BNCO,AREA
IF !EMPTY(PARAMETER())
   IF SYS(102)='OFF'
      =MEN_LIN("CALCULANDO - ESPERE POR FAVOR")
   ENDIF
   IF PARAMETER()<2
      STORE 'DEBE' TO VAR1
   ENDIF
   IF PARAMETER()<3
      STORE 'HABER' TO VAR2
   ENDIF
   IF PARAMETER()<4
      STORE '.T.' TO fisco
   ENDIF
   STORE NUL TO (VAR1),(VAR2)
   M.AREA=ALIAS()
   SELE CAJ
   SET ORDER TO TAG CAJA
   IF SEEK(BNCO)
      SCAN WHILE CAJ.CAJA=BNCO 
      if eval(fisco)
         IF CAJ.MONTO>0
            STORE MONTO+EVAL(VAR2) TO (VAR2)
         ELSE
            STORE ABS(MONTO)+EVAL(VAR1) TO (VAR1)
         ENDIF
      endif   
      ENDSCAN
   ENDIF
   SELE (M.AREA)
ELSE
   STORE 0 TO DEBE,HABER
   STORE 'DEBE' TO VAR1,VAR2
ENDIF
RETURN  EVAL(VAR1)-EVAL(VAR2)
