*:*********************************************************************
*:
*:        Program: CONV.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARIOS.PRG                    
*:
*:          Calls: ICONV.PRG
*:               : LGENI.PRG
*:               : LGENP.PRG
*:               : KK             (procedure in PROCESOS.PRG)
*:               : XCONV          (procedure in PROCESOS.PRG)
*:               : OPCON          (procedure in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : CCONV.PRG
*:               : BCONV.PRG
*:               : LLCONV.PRG
*:
*:      Documented 04/23/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: CONV.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA CONVENIO
*	      GENERA POPUP DE ELECCION PARA TRABAJOS CON RESP1 COMO RESPUESTA
*	      DERIVA A LOS PROGRAMAS CORRESPONDIENTES
********************************************************************************
@ 24,0 SAY PADC("Espere por Favor",80,' ')
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO iconv
CASE BAR()=7 .OR. BAR()=8
   PRIVATE tt,MAX
   DECL co[6],ct[6]
   tt='Listado de Convenios'
   MAX=6
   co[1]=' N§ '
   co[2]='     CONVENIO       '
   co[3]='% NOCT'
   co[4]=' DIAS '
   co[5]=' HORAS '
   co[6]='CONF'
   ct[1]='str(recno(),4)'
   ct[2]='convenio'
   ct[3]='str(pornoct,6,2)'
   ct[4]='str(maxdias,6)'
   ct[5]='str(maxhoras,7)'
   ct[6]="iif(basconf,' SI ',' NO ')"
   IF BAR()=7
      DO lgeni
   ELSE
      DO lgenp
   ENDIF
CASE BAR()=10
   ulpr="XCONV"
   DO kk WITH 13,20
   ON SELE POPU caca DO xconv
   ACTI POPU caca
OTHERWISE
   dijo=BAR()
   STORE conpop TO anterior
   IF dijo=5
      SET DELE OFF
      STORE .T. TO conpop
      DO opcon
      SET FILTER TO DELETED()
   ENDIF
   IF elicon(pq[dijo])<>0
      GOTO respuesta
      IF dijo=2
         DO cconv
      ELSE
         IF dijo=4
            DO bconv
         ELSE
            DO llconv
            SET FILTER TO
         ENDIF
      ENDIF
   ENDIF
   SET DELE ON
   STORE anterior TO conpop
ENDCASE
RELE dijo
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ulpr=PROGRAM()
RETURN
*: EOF: CONV.PRG
