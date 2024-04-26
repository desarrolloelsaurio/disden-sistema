********************************************************************************
*-- Programa: Q_PAG.PRG
*-- Fecha   : 05-13-92 03:16am
*-- Version : ADAPTACION LIBRE DE R.'EL BATA' SOBRE UN ORIGINAL DE G. REINER
*-- Notas   : CALCULA LA DEUDA DE UN PROVEED. Y DEVUELVE EN VAR1 Y 2
*-- Modificaci¢n GOYO (solo para decir que es muy ingenioso lo suyo)
********************************************************************************
PARAMETER PRVD,VAR1,VAR2,NOPAG
PRIVATE PRVD,AREA,NOPAG
IF !EMPTY(PARAMETER())
   IF SYS(102)='OFF'
      =MEN_LIN("CALCULANDO - ESPERE POR FAVOR")
   ENDIF
   IF PARAMETER()<2
      STORE 'HABER' TO VAR1
   ENDIF
   IF PARAMETER()<3
      STORE 'DEBE' TO VAR2
   ENDIF
   STORE NUL TO (VAR1),(VAR2)
   M.AREA=ALIAS()
   SELE CCP
   IF EMPTY(NDX(1))
      SET ORDER TO TAG PROCOD
   ENDIF
   IF SEEK(PRVD)
      SCAN WHILE CCP.PROCOD=PRVD
         IF inlist(CCP.COMPRRE,'NC','RE','OP')
            STORE ABS(MONTO)+EVAL(VAR2) TO (VAR2)
         ELSE
            STORE ABS(MONTO)+EVAL(VAR1) TO (VAR1)
            IF NOPAG
               IF !PAGADA
                  POS_ARR=IIF(TYPE("FAXT[1,3]")='U',NUL,ASCAN(FAXT,NUMERORE))
                  IF EMPTY(POS_ARR)
                     PUNTERO=PUNTERO+1
                     DIME FAXT[PUNTERO,3]
                     FAXT[PUNTERO,1]=CCP.NUMERORE
                     FAXT[PUNTERO,2]=CCP.MONTO-CCP.CUOTA
                  ELSE
                     POS_ARR=INT(POS_ARR/3)+1
                     STORE FAXT[POS_ARR,2]+MONTO TO FAXT[POS_ARR,2]
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
   STORE 0 TO HABER,DEBE
   STORE 'HABER' TO VAR1,VAR2
ENDIF
RETURN  EVAL(VAR1)-EVAL(VAR2)
