*:*********************************************************************
*:
*:        Program: LSUEI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: PLANIL.PRG                    
*:
*:          Calls: ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:               : LSUEI2.PRG
*:               : LSUEI1.PRG
*:
*:      Documented 04/23/91 at 20:47               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lsuei.prg
*-- Fecha   : 01/14/91 04:07am
*-- Version : G. REINER
*-- Notas   : lista sueldos pagados en el periodo por impresora
********************************************************************************
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
STORE .F. TO nada
DO CASE
CASE BAR()=1
   fisc='emp->total<>0'
   tt='Sueldos Pagados en el Per¡odo '+peraliq
   STORE .T. TO nada
CASE BAR()=2
   respuesta=0
   IF elicat(" a Listar")<>0
      GOTO respuesta
      fisc='emp->cat=recno("cat") .and. total<>0'
      tt='Sueldos Categor¡a:'+ALLTRIM(categoria)+' - Per¡odo '+peraliq
      STORE .T. TO nada
   ENDIF
CASE BAR()=3
   respuesta=0
   IF elicon(" a Listar")<>0
      GOTO respuesta
      fisc='emp->jan=jannro .and. emp->con=recno("CON") .and. total<>0'
      tt='Sueldos Convenio:'+ALLTRIM(convenio)+' - Per¡odo '+peraliq
      STORE .T. TO nada
   ENDIF
CASE BAR()=4
   respuesta=0
   IF eliccos(" a Listar")<>0
      GOTO respuesta
      fisc='emp->jan=jannro .and. emp->ccos=recno("CCOS") .and. total<>0'
      tt='Sueldos C. Costo:'+ALLTRIM(cencos)+' - Per¡odo '+peraliq
      STORE .T. TO nada
   ENDIF
CASE BAR()=5
   respuesta=0
   IF eliesp(" a Listar")<>0
      GOTO respuesta
      fisc='emp->jan=jannro .and. emp->ESP=recno("ESP") .and. total<>0'
      tt='Sueldos Especialidad:'+ALLTRIM(especiali)+' - Per¡odo '+peraliq
      STORE .T. TO nada
   ENDIF
CASE BAR()=6
   DO lsuei2
case bar()=7
   do lsuein
ENDCASE
IF nada
   MAX=12
   DECL co[MAX],ct[MAX]
   co[1]='  Legajo  '
   co[2]=PADC('Empleado',15,' ')
   co[3]=PADC('Hab. C/Desc',acdigi,' ')
   co[4]=PADC('Hab. S/Desc',acdigi,' ')
   co[5]=PADC('Adi. C/Desc',acdigi,' ')
   co[6]=PADC('Adi. S/Desc',acdigi,' ')
   co[7]=PADC('Retenciones',acdigi-1,' ')
   co[8]=PADC('Salario Familiar',acdigi-1,' ')
   co[9]=PADC('Redondeo',7,' ')
   co[10]=PADC('Neto a Percibir',acdigi,' ')
   co[11]=PADC('Adelantos',acdigi-1,' ')
   co[12]=PADC('Pagado',acdigi,' ')
   DO lsuei1
   RELE co,ct
ENDIF
RELE nada
RETURN
*: EOF: LSUEI.PRG
