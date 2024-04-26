*:*********************************************************************
*:
*:        Program: IGAS.PRG
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
*-- Programa: IGAS.PRG
*-- Fecha   : 10/26/90 / 12:40:18
*-- Version : G. REINER - GENERADOR
*-- Notas   : INGRESA TIPO DE ADELANTO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 12,20 TO 17,62 TITL " Ingreso Tipo de Adelanto " SHAD COLOR SCHE 8
SELE gas
me1=" Ingreso Tipo de Adelanto "
DO WHILE .T.
   ACTI WIND win
   SCATTER MEMVAR BLANK
   @ 1,1 SAY "TIPO DE ADELANTO" COLOR SCHE 3
   @ 2,1 SAY "EMPRESA" COLOR SCHE 3
   @ 1,20 GET m->gasto;
      PICTURE "XXXXXXXXXXXXXXXXXXXX";
      MESS me1+"- [ENTER] para Men£"
   READ
   IF ISALPHA(ALLTRIM(m->gasto))
      m->gasto=PROPER(m->gasto)
      @ 2,1 SAY "EMPRESA" COLOR SCHE 3
      respuesta=0
      ACTI SCREEN
      DO WHILE elijn('del Tipo de Adelanto')=0
      ENDDO
      GOTO respuesta
      ACTI WINDOW win
      @ 2,20 GET jan->empresa
      CLEAR GETS
      m->empresa=respuesta
      SELECT gas
      SET DELE OFF
      SEEK ALLTRIM(m->gasto)
      SET DELE ON
      IF .NOT. FOUND()
         APPEND BLANK
         GATHER MEMVAR
      ELSE
         IF gas->empresa<>m->empresa
            APPEND BLANK
            GATHER MEMVAR
         ELSE
            ACTI SCREEN
            @ 24,0 SAY PADC("Tipo de Adelanto "+ALLTRIM(m->gasto)+' existe - Enter para continuar',80,' ')
            ACTI WIND win
            DO existe WITH " Tipo de Adelanto"
            DO WHILE INKEY()=0
            ENDDO
            CLEAR
         ENDIF
      ENDIF
   ELSE
      EXIT
   ENDIF
   CLEAR
ENDDO
RELE WIND win
RELE gasto,empresa,me1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IGAS.PRG
