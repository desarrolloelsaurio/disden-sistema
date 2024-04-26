********************************************************************************
*-- Programa: lEMPfp.PRG
*-- Fecha   : 11/03/90 01:05am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS POR PANTALLA DE FAMILIARES DE EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   SELE emp
   STORE 0 TO respuesta
   IF eliemp('Empleado a Listar')<>0
      GOTO respuesta
      SELE epar
      GOTO TOP
      DO WHILE empleado<>respuesta .AND. .NOT. EOF()
         SKIP
      ENDDO
      IF .NOT. EOF()
         DEFINE WINDOW win FROM 5,14 TO 17,77 TITL " Muestra Familiares de "+ALLTRIM(emp->apynom)+' ' SHAD COLOR SCHE 8
         @ 24,0 SAY PADC('Lista Parentescos - [ESC] para Men£',80,' ')
         SCAN WHILE empleado=respuesta
            SCATTER MEMVAR
            psc=minus(ALLTRIM(m->apynom))
            m->apy=SUBSTR(m->apynom,psc)+SPACE(30)
            m->apynom=LEFT(m->apynom,psc-2)+SPACE(30)
            DO mempf
            ACTI SCRE
            ulpr=PROGRAM()
            @ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
            DO WHILE INKEY()=0
            ENDDO
            IF LASTKEY()=27
               EXIT
            ENDIF
         ENDSCAN
         RELE WIND win
      ENDIF
   ENDIF
CASE BAR()=2
   SELE epar
   tt='Listado de Empleados - Parentescos'
   fisc='.T.'
   MAX=7
   DECL co[MAX]
   co[1]='   Empleado   '
   co[2]='   Pariente   '
   co[3]='  Parentesco  '
   co[4]='T.Doc.'
   co[5]=' N§ Docum '
   co[6]='T. Escol'
   co[7]='Comp'
   DO lempfp1
   RELE co,tt,MAX
CASE BAR()=3
   SELE par
   xcos=0
   STORE 0 TO respuesta
   IF elipar(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      SELE epar
      tt='Listado de Empleados - Parentesco: '+ALLTRIM(par->parentesco)
      MAX=6
      DECL co[MAX]
      co[1]='   Empleado   '
      co[2]=LEFT(par->parentesco,14)
      co[3]='T.Doc.'
      co[4]=' N§ Docum '
      co[5]='Tipo Escolarid'
      co[6]='Comp'
      DO lempfp2
      RELE co,tt,MAX,xcos
   ENDIF
CASE BAR()=4
   SELE epar
   tt='Listado de Cumplea¤os'
   MAX=5
   DECL co[MAX]
   co[1]='      Empleado      '
   co[2]='      Pariente      '
   co[3]='     Parentesco     '
   co[4]='Fc. Nac.'
   co[5]='Edad'
   DO lempfp3
   RELE co,ct,gt,gto,ctt,fisc,xcos
CASE BAR()=5
   SELE epar
   tt='Listado de Empleados con Parientes en la Empresa'
   fisc='empresa'
   MAX=7
   DECL co[MAX]
   co[1]='   Empleado   '
   co[2]='   Pariente   '
   co[3]='  Parentesco  '
   co[4]='T.Doc.'
   co[5]=' N§ Docum '
   co[6]='T. Escol'
   co[7]='Comp'
   DO lempfp1
   RELE co,tt,MAX
ENDCASE
RETURN
