*:*********************************************************************
*:
*:        Program: RDIA.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: DIA.PRG
*:
*:        Indexes: TMP.IDX
*:               : &INDICE
*:
*:      Documented 04/23/91 at 21:00               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: RDIA.PRG
*-- Fecha   : 03/09/91 04:24pm
*-- Version : G. REINER
*-- Notas   : GENERA REGISTRO DE HORAS TRABAJADAS DIARIAS A LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE dia
@ 24,0 SAY PADC(" Ordenando el Archivo ",80) COLO SCHE 19
INDEX ON legajo+STR(thor,2)+STR(fecha,2) TO tmp
SET INDEX TO tmp
DIME cosa[3],cosa1[3]
STORE 1 TO vez
STORE .F. TO hizo
SCATTER TO cosa
rcd1=RECNO()
SCAN
   IF vez=2
      SCATTER TO cosa1
      IF cosa[1]=cosa1[1] .AND. cosa[2]=cosa1[2] .AND. cosa[3]=cosa1[3]
         STORE .T. TO hizo
         rcd2=RECNO()
         DELE RECO MIN(rcd1,rcd2)
         GOTO rcd2
      ENDIF
      SCATTER TO cosa
      STORE RECNO() TO rcd1
   ELSE
      STORE 2 TO vez
   ENDIF
ENDSCAN
PACK
RELE cosa,cosa1,vez,rcd1
@ 24,0 SAY PADC(" Sumando Conceptos ",80) COLO SCHE 19
DIME ttl[recc("THOR")]
STORE 0 TO ttl
GOTO TOP
STORE empleado TO mpl
SCAN
   rcd=RECNO()
   IF mpl<>dia->empleado
      GOTO mpl IN emp
      SELE liq
      FOR A=1 TO RECC("THOR")
         IF ttl[a]<>0
            GOTO A IN thor
            APPE BLAN
            REPL empresa WITH jannro
            REPL empleado WITH RECNO("EMP")
            REPL legajo WITH emp->legajo
            REPL filtcon WITH 10
            REPL archivo WITH 'THOR'
            REPL registro WITH A
            REPL unidad WITH ttl[a]
            REPL fechaven WITH DATE()
            REPL INFORMA WITH thor->horinfo='SI'
            REPL cencos WITH emp->ccos
         ENDIF
      NEXT
      SELE dia
      STORE 0 TO ttl
      STORE dia->empleado TO mpl
   ENDIF
   SELE dia
   GOTO rcd
   STORE ttl[dia->thor]+dia->horas TO ttl[dia->thor]
ENDSCAN
GOTO mpl IN emp
SELE liq
FOR A=1 TO RECC("THOR")
   IF ttl[a]<>0
      GOTO A IN thor
      APPE BLAN
      REPL legajo WITH emp->legajo
      REPL filtcon WITH 10
      REPL archivo WITH 'THOR'
      REPL registro WITH A
      REPL unidad WITH ttl[a]
      REPL fechaven WITH DATE()
      REPL INFORMA WITH thor->horinfo='SI'
      REPL empleado WITH RECNO("EMP")
      REPL cencos WITH emp->ccos
   ENDIF
NEXT
SELE dia
indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
INDEX ON legajo+STR(fecha,2) TO (PATH+'\'+indice)
RELE mpl,ttl,fez,A
RETURN
*: EOF: RDIA.PRG
