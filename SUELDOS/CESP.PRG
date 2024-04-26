*********************************************
*-- Programa: CESP.PRG
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : CORRIGE DATOS GRUPOS DE ESPECIALIDADES
*********************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ff=RECNO()
DEFINE WINDOW win FROM 10,20 TO 14,60 DOUBLE TITL ' Correcci¢n Datos Especialidades ' SHAD COLOR SCHE 8
me1=' Correcci¢n Datos Especialidades '
ACTI WINDOW win
@ 1,2 SAY "ESPECIALIDAD" COLOR SCHE 3
SCATTER MEMVAR
@ 1,17 GET m->especiali PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESS me1+'- [ESC] para Men£'
READ
IF LASTKEY()<>27
   IF especiali<>m->especiali
      m->especiali=PROPER(m->especiali)
      IF ISALPHA(m->especiali)
         SET DELE OFF
         SEEK ALLTRIM(m->especiali)
         SET DELE ON
         IF FOUND()
            SET MESS TO 'ESPECIALIDAD '+ALLTRIM(m->vespeciali)+' EXISTE - ENTER PARA CONTINUAR'
            DO existe WITH ' ESPECIALIDAD'
            DO WHILE INKEY()=0
            ENDDO
            CLEA
         ELSE
            GOTO ff
            GATHER MEMVAR
         ENDIF
      ENDIF
   ENDIF
ENDIF
RELE WIND win
@ 24,0 SAY SPACE(80)
RELE ff,especiali,me1
RETURN
