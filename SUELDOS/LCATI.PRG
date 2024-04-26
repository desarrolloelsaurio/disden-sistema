*:*********************************************************************
*:
*:        Program: LCATI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CAT.PRG                       
*:
*:          Calls: LCATI1.PRG
*:               : ELICON()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:49               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lcati.prg
*-- Fecha   : 01/12/91 06:59pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE CATEGORIAS POR IMPRESORA
********************************************************************************
ulpr=PROGRAM()
@ 24,0 SAY PADC('Preparando datos para Impresi¢n',80,' ')
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   tt='Listado de Categor¡as'
   MAX=5
   DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
   co[1]=' N§ '
   co[2]='     CATEGORIA      '
   co[3]=PADC('SUELDO/JORNAL',acdigi)
   co[4]='PER.'
   co[5]=PADC("CONVENIO",20,' ')
   fisc='.T.'
   DO lcati1
CASE BAR()=2
   IF elicon(" a Listar")<>0
      GOTO respuesta
      tt='Listado de Categor¡as del Convenio '+ALLTRIM(con->convenio)
      fisc='convenio=respuesta'
      SELE cat
      MAX=4
      DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
      co[1]=' N§ '
      co[2]='     CATEGORIA      '
      co[3]=PADC('SUELDO/JORNAL ',acdigi)
      co[4]='PER.'
      DO lcati1
   ENDIF
ENDCASE
RELE tt,MAX,ct,co
RETURN
*: EOF: LCATI.PRG
