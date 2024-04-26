********************************************************************************
*-- Programa: Q_DEU.PRG
*-- Fecha   : 05-13-92 03:16am
*-- Version : G. REINER
*-- Notas   : CALCULA LA DEUDA DE UN CLIENTE Y DEVUELVE EN VAR1 Y 2
********************************************************************************
PARAMETER CLNT,VAR1,VAR2,NOPAG,FECHACOR
PRIVATE CLNT,AREA,NOPAG,FECHACOR
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
   STORE NUL TO (VAR1),(VAR2)
   M.AREA=ALIAS()
   SELE CCL
   IF EMPTY(NDX(1))
      SET ORDER TO TAG CODCLI
   ENDIF
   IF SEEK(CLNT)
      SCAN WHILE CCL.CODCLI=CLNT
         IF EMPTY(FECHACOR) .OR. CCL.FECHAOP<=FECHACOR
            IF CCL.COMPRRE='NC' .OR. CCL.COMPRRE='RE'
               STORE abs(MONTO)+EVAL(VAR2) TO (VAR2)
            ELSE
               IF EMPTY(FECHACOR) 
                  STORE MONTO+EVAL(VAR1) TO (VAR1)
               ELSE
                  IF FECHAVE<=FECHACOR .AND. PAGADA
                     STORE MONTO+EVAL(VAR1) TO (VAR1)                  
                  ENDIF
               ENDIF
               IF NOPAG
                  IF !PAGADA
                     POS_ARR=IIF(TYPE("FAXT[1,3]")='U',NUL,ASCAN(FAXT,NUMERORE))
                     IF EMPTY(POS_ARR)
                        PUNTERO=PUNTERO+1
                        DIME FAXT[PUNTERO,3]
                        FAXT[PUNTERO,1]=CCL.NUMERORE
                        FAXT[PUNTERO,2]=CCL.MONTO-CCL.CUOTA
                     ELSE
                        POS_ARR=INT(POS_ARR/3)+1
                        STORE FAXT[POS_ARR,2]+MONTO TO FAXT[POS_ARR,2]
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
         ENDIF
      ENDSCAN
      if type("FAXT")#'U'
         =ASORT(FAXT)
      ENDIF
   ENDIF
   SELE (M.AREA)
ELSE
   STORE 0 TO DEBE,HABER
   STORE 'DEBE' TO VAR1,VAR2
ENDIF
RETURN  EVAL(VAR1)-EVAL(VAR2)
