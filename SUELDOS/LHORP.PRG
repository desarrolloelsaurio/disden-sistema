*:*********************************************************************
*:
*:        Program: LHORP.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: HOR.PRG                       
*:               : QADI.PRG                      
*:               : QRET.PRG                      
*:               : QSAL.PRG                      
*:
*:          Calls: LHORP1.PRG
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:               : LHORP2.PRG
*:               : LHORP3.PRG
*:
*:        Indexes: TMP.IDX
*:               : &INDICE
*:
*:      Documented 04/23/91 at 21:00               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LHORP.PRG
*-- Fecha   : 01/07/91 11:07am
*-- Version : G. REINER
*-- Notas   : DERIVA A PROGRAMAS DE LISTADO DE HORAS TRABAJADAS POR PANTALLA
********************************************************************************
PARAMETER bsc,fl,flva,flti,fun
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   respuesta=0
   IF &fun<>0
      GOTO respuesta
      SELE liq
      @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
      INDEX ON legajo FOR filtcon=bsc .AND. registro=respuesta TO tmp
      MAX=3
      DECL co[MAX]
      tt='Listado de '+flti+' - '+ALLTRIM(&flva)
      co[1]='  Legajo  '
      co[2]=PADC('Empleado',30,' ')
      co[3]=PADC('Cantidad',acdigi,' ')
      DO lhorp1
      RELE co,ct,gt,gto,ctt,cgt,gt,rgt,pgt,tgt
      SELE liq
      indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      SET INDEX TO &indice
   ENDIF
CASE BAR()=2
   respuesta=0
   IF eliemp(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      fisc='EMPLEADO=xcos .and. FILTCON=BSC'
      MAX=2
      DECL co[MAX]
      tt='Listado de '+flti+' - Empleado '+ALLTRIM(emp->apynom)+' - Legajo '+ALLTRIM(emp->legajo)
      co[1]=PADC(flti,20,' ')
      co[2]=PADC('Cantidad',acdigi,' ')
      SELE liq
      DO lhorp2
      RELE co
   ENDIF
CASE BAR()=3
   MAX=4
   DECL co[MAX]
   SELE liq
   tt='LISTADO COMPLETO '+flti
   @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
   INDEX ON legajo+STR(registro,4) FOR filtcon=bsc TO tmp
   GOTO TOP
   co[1]='  LEGAJO  '
   co[2]=PADC("EMPLEADO",20)
   co[3]=PADC(flti,20,' ')
   co[4]=PADC('Cantidad',acdigi,' ')
   DO lhorp3
   SELE liq
   indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   SET INDEX TO &indice
   RELE tt,co,MAX
ENDCASE
@ 24,0 SAY SPACE(80)
RETUR
*: EOF: LHORP.PRG
