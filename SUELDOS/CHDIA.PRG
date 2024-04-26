*:*********************************************************************
*:
*:        Program: CHDIA.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: DIA.PRG                       
*:
*:          Calls: CHDIA1.PRG
*:               : MAXIOM()       (function  in PROCESOS.PRG)
*:               : ELITHOR()      (function  in PROCESOS.PRG)
*:
*:        Indexes: TMP.IDX
*:
*:      Documented 04/23/91 at 21:00               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: chdia.prg
*-- Fecha   : 02/27/91 06:03pm
*-- Version : g. reiner
*-- Notas   : Deriva a Correcci¢n de Horas Trabajadas por fecha
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO chdia1
CASE BAR()=2
   STORE DAY(DATE()) TO respuesta
   DEFINE WINDOW fic FROM 10,0 TO 14,77 DOUBLE TITL ' Fecha a Listar ' SHADOW COLOR SCHE 8
   ACTI WINDOW fic
   @ 1,10 SAY "INGRESE FECHA ('0' PARA MENU) " GET respuesta
   READ
   RELE WIND fic
   IF respuesta<>0 .AND. LAST()<>27
      @ 24,0 SAY PADC("Ordenando el Archivo de Liquidaci¢n",80) COLO SCHE 19
      SELE thor
      SET ORDER TO
      SELE emp
      SET ORDER TO
      SELE dia
      SET RELA TO thor INTO thor
      SET RELA TO empleado INTO emp ADDI
      IF ordlis=2
         INDEX ON legajo+thor->hortipohor FOR fecha=respuesta TO tmp
      ELSE
         INDEX ON emp->apynom+thor->hortipohor FOR fecha=respuesta TO tmp
      ENDIF
      maxiom=maxiom(DATE())
      DEFINE WINDOW win FROM 2,9 TO 21,78 DOUBLE TITL ' Correcci¢n '+ALLTRIM(thor->hortipohor)+' ' SHAD COLOR SCHE 8
      BROWSE FIELD emp->legajo/R,emp->apynom/R:20/H="Empleado",thor->hortipohor/R/H="Tipo de Hora",horas/H="Cantidad":B=0,24,fecha/H="D¡a":B=1,m->maxiom NOAPPEND NODELETE NOMENU WINDOW win
      SET INDEX TO
      SET RELA TO
      SELE emp
      SET ORDER TO ordlis
      SELE thor
      SET ORDER TO 1
      RELE maxiom
   ENDIF
CASE BAR()=3
   @ 24,0 SAY PADC("Ordenando el Archivo de Liquidaci¢n",80) COLO SCHE 19
   STORE 0 TO respuesta
   IF elithor(" a Corregir")<>0
      GOTO respuesta
      SELE emp
      SET ORDER TO
      SELE dia
      SET RELA TO empleado INTO emp
      IF ordlis=2
         INDEX ON legajo+STR(fecha,2) FOR thor=RECNO("THOR") TO tmp
      ELSE
         INDEX ON emp->apynom+STR(fecha,2) FOR thor=RECNO("THOR") TO tmp
      ENDIF
      maxiom=maxiom(DATE())
      DEFINE WINDOW win FROM 3,21 TO 22,68 DOUBLE TITL ' Correcci¢n '+ALLTRIM(thor->hortipohor)+' ' SHAD COLOR SCHE 8
      BROWSE FIELD emp->legajo/R,emp->apynom/R:20/H="Empleado",horas/H="Cantidad":B=0,24,fecha/H="D¡a":B=1,m->maxiom NOAPPEND NODELETE NOMENU WINDOW win
      SET INDEX TO
   ENDIF
   SET RELA TO
   SELE emp
   SET ORDER TO ordlis
ENDCASE
RELE maxiom
@ 24, 0 SAY SPACE(80)
RETURN
*: EOF: CHDIA.PRG
