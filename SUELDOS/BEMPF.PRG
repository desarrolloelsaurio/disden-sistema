*:*********************************************************************
*:
*:        Program: BEMPF.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPF.PRG                      
*:
*:          Calls: MINUS()        (function  in PROCESOS.PRG)
*:               : MEMPF.PRG
*:
*:      Documented 04/23/91 at 20:53               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: bEMPF.PRG
*-- Fecha   : 11/05/90 06:35am
*-- Version : G. REINER - GENERADOR
*-- Notas   : borra PARIENTES DEL EMPLEADO
********************************************************************************
ff=RECNO()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ulpr=PROGRAM()
DEFINE WINDOW win FROM 5,14 TO 18,79 TITL " Correcci¢n Familiares de "+ALLTRIM(emp->apynom)+' ' SHAD COLOR SCHE 8
SELE epar
borro=.F.
me1=" Correcci¢n Familiares de "+ALLTRIM(emp->apynom)
SCAN FOR epar->empleado=ff
   SCATTER MEMVAR
   psc=minus(ALLTRIM(m->apynom))
   m->apy=SUBSTR(m->apynom,psc)+SPACE(30)
   m->apynom=LEFT(m->apynom,psc-2)+SPACE(30)
   DO mempf
   ulpr=PROGRAM()
   ACTI SCRE
   @ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
   ACTI WIND win
   sigue='NO'
   @ 10,5 SAY 'Es Este el que Borra ? '
   @ 10,30 GET sigue PICTURE '@M NO,SI';
      MESS 'Cambie Opciones con la Barra Espaciadora'
   READ
   IF sigue<>"SI"
      LOOP
   ELSE
      SELE epar
      DELE RECO RECNO()
      borro=.T.
   ENDIF
   SELE epar
ENDSCAN
RELE WIND win
IF borro
   SELE epar
   @ 24,0 SAY PADC('Espere por favor - Reconstruyendo el Archivo',80,' ') COLO SCHE 19
   PACK
ENDIF
@ 24,0 SAY SPACE(80)
RELE empleado,parentesco,apynom,fechanac,tipodoc,nrodoc,tipoest,comprob,me1,ff,sigue,psc,prtsc,tsc,tdc,borro
RETURN
*: EOF: BEMPF.PRG
