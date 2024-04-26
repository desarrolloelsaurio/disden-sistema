*:*********************************************************************
*:
*:        Program: LQADEI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: ADELAN.PRG
*:
*:          Calls: LGENIET.PRG
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:48               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lqadei.prg
*-- Fecha   : 01/13/91 02:04am
*-- Version : G. REINER
*-- Notas   : deriva a listados de deuda de empleados
********************************************************************************
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   STORE DATE() TO respuesta
   @ 24,0 SAY PADC('Fecha L¡mite para el Listado',80,' ')
   DEFINE WINDOW win FROM 10,0 TO 14,77 DOUBLE TITL 'Fecha L¡mite para el Listado' SHAD COLOR SCHE 8
   ACTI WINDOW win
   @ 1,10 SAY "INGRESE FECHA [ESC] para Men£ " GET respuesta
   READ
   RELE WIND win
   IF LASTKEY()<>27
      store respuesta to fechi
      store 0 to respuesta
      if eligas(" a Listar")<>0
	 goto respuesta
	 rgs=recno()
	 SELE liq
	 index on legajo to tmp for filtcon>70 .and. fechaven<=FECHI .and. registro=rgs
         MAX=4
         DECL co[MAX]
         tt='Listado de Adelanto Tipo:'+alltrim(gas->gasto)+' - Vencimiento '+DTOC(fechi)
         co[1]='  Legajo  '
         co[2]=PADC('Empleado',30,' ')
         co[3]=PADC('N§ Adelanto',10,' ')
         co[4]=PADC('Monto',acdigi,' ')
         DO lqadei1
         indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
         set index to &INDICE
         RELE co
      endif
   ENDIF
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp(" a Listar")<>0
      GOTO respuesta
      PRS=EMP->LEGAJO
      SELE liq
      MAX=4
      DECL co[MAX]
      tt='Adelantos - Empleado:'+ALLTRIM(emp->apynom)+' - '+ALLTRIM(emp->legajo)
      co[1]=PADC('Tipo Adelanto',20,' ')
      co[2]=PADC('N§ Adelanto',10,' ')
      co[3]=PADC('Fecha Ve',8,' ')
      co[4]=PADC('Monto',acdigi,' ')
      DO lqadei2
      RELE co
   ENDIF
CASE BAR()=3
   STORE DATE() TO respuesta
   @ 24,0 SAY PADC('Fecha L¡mite para el Listado',80,' ')
   DEFINE WINDOW win FROM 10,0 TO 14,77 DOUBLE TITL 'Fecha L¡mite para el Listado' SHAD COLOR SCHE 8
   ACTI WINDOW win
   @ 1,10 SAY "INGRESE FECHA [ESC] para Men£ " GET respuesta
   READ
   RELE WIND win
   IF LASTKEY()<>27
      store respuesta to fechi
      ttl1='con vencimiento hasta el '+dtoc(fechi)
		DO LQADEI3
	ENDIF
ENDCASE
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LQADEI.PRG
