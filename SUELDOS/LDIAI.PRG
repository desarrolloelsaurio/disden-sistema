*:*********************************************************************
*:
*:        Program: LDIAI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: DIA.PRG                       
*:
*:          Calls: ELITHOR()      (function  in PROCESOS.PRG)
*:               : LDIAI1.PRG
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:               : LDIAI2.PRG
*:               : LDIAI3.PRG
*:               : LDIAI4.PRG
*:               : LDIAI5.PRG
*:
*:        Indexes: TMP.IDX
*:               : &INDICE
*:
*:      Documented 04/23/91 at 21:00               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LDIAI.PRG
*-- Fecha   : 01/07/91 11:07am
*-- Version : G. REINER
*-- Notas   : DERIVA A PROGRAMAS DE LISTADO DE HORAS TRABAJADAS POR IMPRESORA
********************************************************************************
uli=ulpr
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo1=BAR()
DO CASE
CASE BAR()=1
   respuesta=0
   IF elithor(" a Listar")<>0
      GOTO respuesta
      MAX=4
      DECL co[MAX]
      tt='Listado de Horas Trabajadas - Tipo '+ALLTRIM(thor->hortipohor)
      co[1]='  Legajo  '
      co[2]=PADC('Empleado',30,' ')
      co[3]='D¡a'
      co[4]=PADC('Cantidad',acdigi,' ')
      SELE dia
      @ 24,0 SAY PADC(" Indexando el Archivo ",80) COLO SCHE 19
      INDEX ON legajo+STR(fecha,2) TO tmp FOR thor=respuesta
      DO ldiai1
      indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      SELE dia
      SET INDEX TO &indice
   ENDIF
CASE BAR()=2
   respuesta=0
   IF eliemp(" a Listar")<>0
      GOTO respuesta
      MAX=3
      DECL co[MAX]
      tt='Listado de Horas Trabajadas  - Empleado '+ALLTRIM(emp->apynom)+' - Legajo '+ALLTRIM(emp->legajo)
      co[1]=PADC('Tipo de Hora',20,' ')
      co[2]='D¡a'
      co[3]=PADC('Cantidad',acdigi,' ')
      SELE dia
      @ 24,0 SAY PADC(" Indexando el Archivo ",80) COLO SCHE 19
      INDEX ON fecha TO tmp FOR legajo=emp->legajo
      DO ldiai2
      indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      SELE dia
      SET INDEX TO &indice
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   DEFINE WINDOW fic FROM 10,0 TO 14,77 DOUBLE TITL ' D¡a a Listar ' SHADOW COLOR SCHE 8
   ACTI WINDOW fic
   @ 1,10 SAY "INGRESE DIA ('0' PARA MENU) " GET respuesta MESS 'D¡a a Listar'
   READ
   RELE WINDOW fic
   IF LASTKEY()<>27 .AND. respuesta>0 .AND. respuesta<32
      SELE dia
      tt='LISTADO HORAS TRABAJADAS - D¡a '+ALLTRIM(STR(respuesta,2))
      @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
      INDEX ON legajo TO tmp FOR fecha=respuesta
      GOTO TOP
      IF .NOT. EOF()
         DO ldiai3
      ENDIF
      SELE dia
      indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      SET INDEX TO &indice
      RELE tt,co,MAX
   ENDIF
CASE BAR()=4
   tt='LISTADO COMPLETO HORAS TRABAJADAS POR TIPO DE HORA/EMPLEADO'
   @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
   SELE dia
   INDEX ON legajo+STR(thor,4) TO tmp
   DO ldiai3
   indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   SET INDEX TO &indice
   RELE tt,co,MAX
CASE BAR()=5
   tt='LISTADO COMPLETO HORAS TRABAJADAS POR TIPO DE HORA/FECHA'
   @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
   SELE dia
   INDEX ON thor TO tmp
   DO ldiai4
   indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   SET INDEX TO &indice
   RELE tt,co,MAX
CASE BAR()=6
   tt='LISTADO COMPLETO HORAS TRABAJADAS POR TIPO DE EMPLEADO/FECHA'
   @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
   SELE dia
   INDEX ON legajo+STR(thor,4) TO tmp
   DO ldiai5
   indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   SET INDEX TO &indice
   RELE tt,co,MAX
ENDCASE
RELE uli
RETURN
*: EOF: LDIAI.PRG
