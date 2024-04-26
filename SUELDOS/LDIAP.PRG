*:*********************************************************************
*:
*:        Program: LDIAP.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: DIA.PRG                       
*:
*:          Calls: ELITHOR()      (function  in PROCESOS.PRG)
*:               : LDIAP1.PRG
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:               : LDIAP2.PRG
*:               : LDIAP3.PRG
*:
*:        Indexes: TMP.IDX
*:               : &INDICE
*:
*:      Documented 04/23/91 at 21:00               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LDIAP.PRG
*-- Fecha   : 01/07/91 11:07am
*-- Version : G. REINER
*-- Notas   : DERIVA A PROGRAMAS DE LISTADO DE HORAS TRABAJADAS POR PANTALLA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   respuesta=0
   IF elithor(" a Listar")<>0
      GOTO respuesta
      SELE dia
      @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
      INDEX ON legajo+STR(fecha,2) FOR thor=respuesta TO tmp
      MAX=4
      DECL co[MAX]
      tt='Listado de Horas Trabajadas - '+ALLTRIM(thor->hortipohor)
      co[1]='  Legajo  '
      co[3]='D¡a'
      co[2]=PADC('Empleado',30,' ')
      co[4]=PADC('Cantidad',acdigi,' ')
      DO ldiap1
      RELE co,ct,gt,gto,ctt,cgt,gt,rgt,pgt,tgt
      indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      SELE dia
      SET INDEX TO &indice
   ENDIF
CASE BAR()=2
   respuesta=0
   IF eliemp(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      MAX=3
      DECL co[MAX]
      tt='Listado de Horas Trabajadas - Empleado '+ALLTRIM(emp->apynom)+' - Legajo '+ALLTRIM(emp->legajo)
      co[1]='D¡a'
      co[2]=PADC('Tipo de Hora',20,' ')
      co[3]=PADC('Cantidad',acdigi,' ')
      SELE dia
      DO ldiap2
      RELE co
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   DEFINE WINDOW fic FROM 10,0 TO 14,77 DOUBLE TITL ' D¡a a Listar ' SHADOW COLOR SCHE 8
   ACTI WINDOW fic
   @ 1,10 SAY "INGRESE DIA ('0' PARA MENU) " GET respuesta MESS 'D¡a a Listar'
   READ
   RELE WINDOW fic
   IF LASTKEY()<>27 .AND. respuesta>0 .AND. respuesta<32
      MAX=5
      DECL co[MAX]
      SELE dia
      tt='LISTADO COMPLETO HORAS TRABAJADAS - D¡a '+ALLTRIM(STR(respuesta,2))
      @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
      INDEX ON legajo TO tmp FOR fecha=respuesta
      GOTO TOP
      IF .NOT. EOF()
         co[1]='  LEGAJO  '
         co[2]=PADC("EMPLEADO",20)
         co[3]='D¡a'
         co[4]=PADC('TIPO DE HORA',20,' ')
         co[5]=PADC('Cantidad',acdigi,' ')
         DO ldiap3
      ENDIF
      SELE dia
      indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      SET INDEX TO &indice
      RELE tt,co,MAX
   ENDIF
CASE BAR()=4
   MAX=5
   DECL co[MAX]
   SELE dia
   tt='LISTADO COMPLETO HORAS TRABAJADAS'
   @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
   INDEX ON legajo+STR(fecha,2) TO tmp
   GOTO TOP
   co[1]='  LEGAJO  '
   co[2]=PADC("EMPLEADO",20)
   co[3]='D¡a'
   co[4]=PADC('TIPO DE HORA',20,' ')
   co[5]=PADC('Cantidad',acdigi,' ')
   DO ldiap3
   SELE dia
   indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   SET INDEX TO &indice
   RELE tt,co,MAX
ENDCASE
@ 24,0 SAY SPACE(80)
RETUR
*: EOF: LDIAP.PRG
