*:*********************************************************************
*:
*:        Program: CGAS.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: GAS.PRG                       
*:
*:          Calls: ELIJN()        (function  in PROCESOS.PRG)
*:               : EXISTE         (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:50               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: CGAS.PRG
*-- Fecha   : 10/26/90 / 12:40:18
*-- Version : G. REINER - GENERADOR
*-- Notas   : CORRIGE TIPO DE ADELANTO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 13,20 TO 18,62 TITL " Correcci¢n Tipo de Adelanto " SHAD COLOR SCHE 8
SELE gas
ff=RECNO()
sigue=.T.
me1=" Correcci¢n Tipo de Adelanto "
ACTI WIND win
SCATTER MEMVAR
@ 1,1 SAY "TIPO DE ADELANTO" COLOR SCHE 3
@ 2,1 SAY "EMPRESA" COLOR SCHE 3
GOTO m->empresa IN jan
caca=LEFT(jan->empresa,20)
@ 2,20 GET caca
CLEAR GETS
@ 1,20 GET m->gasto;
   PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESS me1+"- [ESC] para Men£"
READ
IF LASTKEY()<>27
   IF ISALPHA(ALLTRIM(m->gasto))
      m->gasto=PROPER(m->gasto)
      @ 2,1 SAY "EMPRESA" COLOR SCHE 3
      @ 2,20 GET caca;
         PICTURE 'XXXXXXXXXXXXXXXXXXXX';
         MESS me1+'[Tecla y ENTER] para Corregir'
      READ
      IF jan->empresa<>caca
         respuesta=0
         DO WHILE elijn(' del Tipo de Adelanto')=0
         ENDDO
         GOTO respuesta
         ACTI WINDOW win
         @ 2,20 GET jan->empresa
         CLEAR GETS
         m->empresa=respuesta
      ENDIF
      SELECT gas
      SET DELE OFF
      SEEK ALLTRIM(m->gasto)
      SET DELE ON
      IF FOUND()
         IF gas->empresa=m->empresa
            ACTI SCREEN
            @ 24,0 SAY PADC("Tipo de Adelanto "+ALLTRIM(m->gasto)+' existe - Enter para continuar',80,' ')
            ACTI WIND win
            DO existe WITH " Tipo de Adelanto"
            DO WHILE INKEY()=0
            ENDDO
            CLEAR
            sigue=.F.
         ENDIF
      ENDIF
   ELSE
      sigue=.F.
   ENDIF
   IF sigue
      SELE gas
      GOTO ff
      GATHER MEMVAR
   ENDIF
ENDIF
RELE WIND win
RELE gasto,empresa,me1,ff,sigue,caca
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: CGAS.PRG
