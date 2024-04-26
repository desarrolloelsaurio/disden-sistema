********************************************************************************
*-- Programa: lEMPfi.PRG
*-- Fecha   : 11/03/90 01:05am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS POR IMPRESORA DE FAMILIARES DE EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo=BAR()
DO CASE
CASE BAR()=1 .OR. BAR()=4
   SELE epar
   IF dijo=4
      tt='Listado de Empleados con Parientes en la Empresa'
      fisc='empresa'
      MAX=8
   ELSE
      tt='Listado de Empleados - Parentescos'
      fisc='.t.'
      MAX=9
   ENDIF
   DECL co[MAX]
   co[1]=PADC('Empleado',30)
   co[2]='           Pariente           '
   co[3]='     Parentesco     '
   co[4]='T.Doc.'
   co[5]=' N§ Docum '
   co[6]='Tipo Escolarid'
   co[7]='Comp'
   co[8]='Fc. Nac.'
   IF dijo=1
      co[9]='EM'
   ENDIF
   DO lempfi1
   RELE co,MAX,tt
CASE BAR()=2
   SELE par
   xcos=0
   STORE 0 TO respuesta
   IF elipar('a Listar')<>0
      GOTO respuesta
      xcos=respuesta
      fisc='epar.parentesco=XCOS'
      tt='Listado de Empleados - Parentesco: '+ALLTRIM(par.parentesco)
      MAX=8
      DECL co[MAX]
      co[1]=PADC('Empleado',30)
      co[2]=PADC(ALLTRIM(par.parentesco),30)
      co[3]='T.Doc.'
      co[4]=' N§ Docum '
      co[5]='Tipo Escolarid'
      co[6]='Comp'
      co[7]='Fc. Nac.'
      co[8]='MP'
      DO lempfi1
      RELE co,fisc,tt
   ENDIF
CASE BAR()=3
   SELE epar
   tt='Listado de Cumplea¤os'
   MAX=5
   DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
   co[1]='           Empleado           '
   co[2]='           Pariente           '
   co[3]='     Parentesco     '
   co[4]='Fc. Nac.'
   co[5]='Edad'
   DO lempfi2
   RELE co,tt
ENDCASE
RETURN
