*:*********************************************************************
*:
*:        Program: ICAT.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CAT.PRG                       
*:
*:          Calls: ELICON()       (function  in PROCESOS.PRG)
*:               : EXISTE         (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:49               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ICAT.PRG
*-- Fecha   : 10/26/90 /  0:12:04
*-- Version : G. REINER - GENERADOR
*-- Notas   : INGRESO DE CATEGORIAS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 7,20 TO 14,73 TITL " Ingreso de Categor¡as " SHAD COLOR SCHE 8
SELE cat
me1=" Ingreso de Categor¡as "
DO WHILE .T.
   ACTI WIND win
   SCATTER MEMVAR BLANK
   @ 1,1 SAY "CATEGORIA" COLOR SCHE 3
   @ 2,1 SAY "SUELDO MENSUAL O JORNAL" COLOR SCHE 3
   @ 3,1 SAY "PERIODO DE PAGO" COLOR SCHE 3
   @ 4,1 SAY "CONVENIO" COLOR SCHE 3
   @ 1,30 GET m->categoria;
      PICTURE "XXXXXXXXXXXXXXXXXXXX";
      MESS me1+"- [ENTER] para Men£"
   READ
   IF ISALPHA(ALLTRIM(m->categoria))
      m->categoria=PROPER(m->categoria)
      @ 2,1 SAY "SUELDO MENSUAL O JORNAL" COLOR SCHE 3
      @ 2,30 GET m->sueldo;
         PICTURE "99999999999.99";
         MESS me1+"- Monto del Sueldo o Jornal"
      @ 3,1 SAY "PERIODO DE PAGO" COLOR SCHE 3
      m->periodo='Quincenal'
      @ 3,30 GET m->periodo;
         PICTURE "@M Mensual  ,Quincenal";
         MESS me1+"- Mensual o Quincenal"
      READ
      respuesta=0
      DO WHILE elicon(" de la Categor¡a")=0
      ENDDO
      GOTO respuesta
      m->convenio=respuesta
      ACTI WIND win
      @ 4,30 GET con->convenio
      CLEAR GETS
      SELECT cat
      SET DELE OFF
      SEEK m->categoria
      SET DELE ON
      IF .NOT. FOUND() .OR. (FOUND() .AND. m->convenio<>cat->convenio)
         APPEND BLANK
         GATHER MEMVAR
      ELSE
         ACTI SCREEN
         @ 24,0 SAY PADC("CATEGORIA "+ALLTRIM(m->categoria)+' existe - Enter para continuar',80,' ')
         ACTI WIND win
         DO existe WITH " CATEGORIA"
         DO WHILE INKEY()=0
         ENDDO
         CLEAR
      ENDIF
   ELSE
      EXIT
   ENDIF
   CLEAR
ENDDO
RELE WIND win
RELE categoria,sueldo,periodo,me1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: ICAT.PRG
