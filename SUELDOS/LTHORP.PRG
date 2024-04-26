*:*********************************************************************
*:
*:        Program: LTHORP.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: THOR.PRG                      
*:
*:          Calls: MTHOR.PRG
*:               : LTHORP1.PRG
*:               : LTHORP2.PRG
*:
*:      Documented 04/23/91 at 20:51               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LTHORP.PRG
*-- Fecha   : 10/31/90 06:02pm
*-- Version : G. REINER
*-- Notas   : DERIVA AL LISTADO DE TIPO DE HORAS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   ACTI SCRE
   @ 24,0 SAY PADC('[ESC] para Men£',80,' ')
   SCAN
      DO mthor WITH 'Muestra'
      DO WHILE INKEY()=0
      ENDDO
      IF LASTKEY()=27
         EXIT
      ENDIF
   ENDSCAN
   RELE WIND win
   RELE ALL LIKE hor*
   RELE me1,ff,sigue,v1
CASE BAR()=2 .OR. BAR()=3
   MAX=3
   dijo=BAR()
   DECL co[MAX]
   tt='Listado de F¢rmulas '+IIF(BAR()=2,'Quincenales','Mensuales')
   co[1]=' N '
   co[2]='    Tipo de Hora    '
   co[3]='                F¢rmula                           '
   DO lthorp1
   RELE co,dijo
CASE BAR()=4
   MAX=7+IIF(jannro=0,1,0)
   DECL co[MAX]
   tt='Listado de Variables'
   co[1]=' N '
   co[2]='    Tipo de Hora    '
   co[3]='Tipo  Pago'
   co[4]='Suma Horas'
   co[5]='Suma Total'
   co[6]='RET.'
   co[7]='APO.'
   IF jannro=0
      co[8]='      Empresa       '
   ENDIF
   DO lthorp2
   RELE co,ct,gt,gto,ctt
ENDCASE
RETURN
*: EOF: LTHORP.PRG
