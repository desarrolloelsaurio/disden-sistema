********************************************************************************
*-- Programa: IEMPF.PRG
*-- Fecha   : 05/11/90 /  4:44:24
*-- Version : G. REINER - GENERADOR
*-- Notas   : INGRESO PARIENTES DEL EMPLEADO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ff=RECNO()
DEFINE WINDOW win FROM 7,14 TO 19,79 TITL " Ingrese Familiares de "+ALLTRIM(emp.apynom)+' ' SHAD COLOR SCHE 8
SELE epar
me1=" Familiares de "+ALLTRIM(emp.apynom)+' '
psc=minus(emp.apynom)
DO WHILE .T.
   ACTI WIND win
   SCATTER MEMVAR BLANK
   m.apynom=LEFT(emp.apynom,psc-1)+SPACE(31-psc)
   m.apy=SPACE(30)
   @ 1,1 SAY "Apellido" COLOR SCHE 3
   @ 2,1 SAY "Nombre" COLOR SCHE 3
   @ 3,1 SAY "Relaci¢n" COLOR SCHE 3
   @ 4,1 SAY "Tipo de Documento" COLOR SCHE 3
   @ 5,1 SAY "N§ de Documento" COLOR SCHE 3
   @ 6,1 SAY "Fecha de Nacimiento" COLOR SCHE 3
   @ 7,1 SAY "Tipo de Estudios" COLOR SCHE 3
   @ 8,1 SAY "Comprobante de Esc." COLOR SCHE 3
   @ 9,1 SAY "Trabaja en la Empresa" COLOR SCHE 3
   @ 1,23 GET m.apynom;
      PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      MESS me1+"- Apellido"
   READ
   IF ISALPHA(ALLTRIM(m.apynom)) .AND. LASTKEY()<>27
      @ 2,23 GET m.apy;
         PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
         MESS me1+"- [Ctrl] [Y] y [ENTER] para Men£"
      READ
      respuesta=0
      ACTI SCREEN
      respuesta=0
      DO WHILE elipar('del Empleado')=0
      ENDDO
      GOTO respuesta
      ACTI WIND win
      @ 3,23 GET par.parentesco
      CLEAR GETS
      m.parentesco=respuesta
      ACTI SCREEN
      @ 1,60 MENU tdoc,5 TITL ' Tipo de Documento ' SHAD
      respuesta=0
      DO WHILE respuesta=0
         READ MENU TO respuesta
      ENDDO
      m.tipodoc=respuesta
      ACTI WIND win
      @ 4,23 GET tdoc[m.tipodoc]
      CLEAR GETS
      @ 5,23 GET m.nrodoc;
         PICTURE "99.999.999";
         MESS me1+"- N§ de Documento"
      @ 6,23 GET m.fechanac;
         PICTURE "@D";
         MESS me1+"- Fecha de Nacimiento"
      READ
      ACTI SCREEN
      @ 1,60 MENU tesc,6 TITL ' Tipo de Estudios ' SHAD
      respuesta=0
      DO WHILE respuesta=0
         READ MENU TO respuesta
      ENDDO
      m.tipoest=respuesta
      ACTI WIND win
      @ 7,23 GET tesc[m.tipoest]
      CLEAR GETS
      IF tesc[m.tipoest]<>'No'
         @ 8,23 GET m.comprob;
            PICTURE "@M SI,NO";
            MESS me1+"- Comprobante de Escolaridad"
         READ
      ELSE
         m.comprob='  '
      ENDIF
      STORE 'NO' TO nada
      @ 9,23 GET nada PICTURE "@m NO,SI";
         MESS me1+"- Es tambi‚n empleado ? "
      READ
      SELECT epar
      m.apynom=UPPER(ALLTRIM(m.apynom))+' '+PROPER(ALLTRIM(m.apy))
      m.empleado=ff
      APPEND BLANK
      GATHER MEMVAR
      REPL empresa WITH nada='SI'
      sigue='SI'
      CLEA
      @ WROW()/2,1 SAY 'Sigue con '+ALLTRIM(emp.apynom)
      @ WROW()/2,WCOL()-15 GET sigue PICTURE '@M SI,NO';
         MESS 'Cambie Opciones con la Barra Espaciadora'
      READ
      IF sigue<>"SI"
         EXIT
      ENDIF
   ELSE
      EXIT
   ENDIF
   CLEAR
ENDDO
RELE WIND win
@ 24,0 SAY SPACE(80)
RETURN
