*:*********************************************************************
*:
*:        Program: OPCON.PRG
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
*:        Indexes: CONVENIO.IDX
*:
*:      Documented 04/11/91 at 11:20               FoxDoc  version 2.01
*:*********************************************************************
*****************************
* ABRE ARCHIVO DE CONVENIOS *
*****************************
@ 24,0 SAY PADC('Abriendo archivo de Convenio',80,' ') COLO SCHE 19
SELE 3
IF ALIAS()<>'CON'
   USE (PATH+'\CONVENIO') INDEX (PATH+'\CONVENIO') ALIAS con
ENDIF
IF conpop
   DEFI POPU conpop FROM 0,58 PROM FIELD con->convenio MESS ' Elija el Convenio ' SHAD COLOR SCHE 3
   ON SELE POPU conpop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: OPCON.PRG
