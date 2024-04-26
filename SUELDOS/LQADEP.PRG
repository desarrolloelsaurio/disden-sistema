********************************************************************************
*-- Programa: LQADEP.PRG
*-- Fecha   : 04/25/91 07:43pm
*-- Version : G. REINER
*-- Notas   : DERIVA A PROGRAMAS DE LISTADO DE ADELANTOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   respuesta=0
   IF ELIGAS(" a Listar")<>0
      GOTO respuesta
      SELE liq
      @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
      INDEX ON legajo FOR filtcon>70 .AND. registro=respuesta TO tmp
		goto top
		if .not. eof()
      MAX=4
      DECL co[MAX]
      tt='Listado Completo de Adelantos'
      co[1]='  Legajo  '
      co[2]=PADC('Empleado',30,' ')
		co[3]='Fecha Ve'
      co[4]=PADC('Cantidad',acdigi,' ')
      DO lqadep1
      RELE co
		endif
      SELE liq
      indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      SET INDEX TO &indice
   ENDIF
CASE BAR()=2
   respuesta=0
   IF eliemp(" a Listar")<>0
      GOTO respuesta
      xcos=emp->legajo
      MAX=3
      DECL co[MAX]
      tt='Listado de Adelantos de Sueldo - Empleado '+ALLTRIM(emp->apynom)+' - Legajo '+ALLTRIM(emp->legajo)
      co[1]=PADC("Tipo de Adelanto",20,' ')
      co[2]="Fecha Ve"
      co[3]=PADC('Monto',acdigi,' ')
     SELE liq
      DO lqadep2
      RELE co
   ENDIF
CASE BAR()=3
   MAX=5
   DECL co[MAX]
   SELE liq
   tt='LISTADO COMPLETO '
   @ 24,0 SAY PADC(" Ordenando el Archivo - Espere por Favor ",80,"*") COLOR SCHE 19
   INDEX ON legajo+STR(registro,4) FOR filtcon>70 TO tmp
   GOTO TOP
   co[1]='  LEGAJO  '
   co[2]=PADC("EMPLEADO",20)
   co[3]=PADC("Adelanto",15)
	co[4]='Fecha Ve'
   co[5]=PADC('Monto',acdigi,' ')
   DO lqadep3
   SELE liq
   indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   SET INDEX TO &indice
   RELE tt,co,MAX
ENDCASE
@ 24,0 SAY SPACE(80)
RETUR
