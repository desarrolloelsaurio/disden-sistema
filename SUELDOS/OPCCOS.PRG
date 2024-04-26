*:*********************************************************************
*:
*:        Program: OPCCOS.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:      Called by: LHISI.PRG
*:
*:          Calls: RESP1.PRG
*:
*:           Uses: &A                 Alias: HIS
*:
*:        Indexes: CENCOS.IDX
*:
*:      Documented 04/11/91 at 11:20               FoxDoc  version 2.01
*:*********************************************************************
*********************************
* ABRE ARCHIVO CENTRO DE COSTOS *
*********************************
@ 24,0 SAY PADC('Abriendo archivo de Centro de Costo',80,' ') COLO SCHE 19
SELE 2
IF ALIAS()<>'CCOS'
   USE (PATH+'\CENCOS') INDEX (PATH+'\CENCOS') ALIAS ccos
ENDIF
IF jannro=0
   SET FILTER TO
ELSE
   SET FILTER TO ccos->empresa=jannro
ENDIF
IF cospop
   DEFI POPU cospop FROM 0,50 PROM FIELD ccos->cencos MESS 'Elija el Centro de Costos' SHAD COLOR SCHE 3
   ON SELE POPU cospop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: OPCCOS.PRG
