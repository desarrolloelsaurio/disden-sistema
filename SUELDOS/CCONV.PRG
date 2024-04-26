*:*********************************************************************
*:
*:        Program: CCONV.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CONV.PRG                      
*:
*:          Calls: EXISTE         (procedure in PROCESOS.PRG)
*:               : SINO()         (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:49               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ICONV.PRG
*-- Fecha   : 10/26/90 / 19:30:43
*-- Version : G. REINER - GENERADOR
*-- Notas   : CORRIGE CONVENIOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 8,15 TO 16,70 TITL " Correcci¢n Convenios " SHAD COLOR SCHE 8
ff=RECNO()
me1=" Correcci¢n Convenios "
sigue=.T.
ACTI WIND win
SCATTER MEMVAR
@ 1,1 SAY "CONVENIO" COLOR SCHE 3
@ 2,1 SAY "PORC. AUMENTO Hs. NOCTURNAS" COLOR SCHE 3
@ 2,33 GET m->pornoct;
   PICTURE "999.99"
@ 3,1 SAY "Cant. D¡as en el Mes" COLOR SCHE 3
@ 3,33 GET m->maxdias;
   PICTURE "999999"
@ 4,1 SAY "Cant. Horas en el Mes" COLOR SCHE 3
@ 4,33 GET m->maxhoras;
   PICTURE "999999"
@ 5,1 SAY "Calcula s/B sico Conformado ?" COLOR SCHE 3
xasconf=IIF(basconf,'SI','NO')
@ 5,33 GET xasconf
CLEAR GETS
@ 1,33 GET m->convenio;
   PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESS me1+"- [ESC] para Men£"
READ
IF LASTKEY()<>27
   IF ISALPHA(ALLTRIM(m->convenio))
      IF convenio<>m->convenio
         m->convenio=PROPER(m->convenio)
         SET DELE OFF
         SEEK ALLTRIM(m->convenio)
         SET DELE ON
         IF FOUND()
            ACTI SCREEN
            @ 24,0 SAY PADC("CONVENIO "+ALLTRIM(m->convenio)+' existe - Enter para continuar',80,' ')
            ACTI WIND win
            DO existe WITH " CONVENIO"
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
      @ 2,1 SAY "PORC. AUMENTO Hs. NOCTURNAS" COLOR SCHE 3
      @ 2,33 GET m->pornoct;
         PICTURE "999.99";
         MESS me1+"- Porc. Aumento por Hs. Nocturnas"
      @ 3,1 SAY "Cant. D¡as en el Mes" COLOR SCHE 3
      @ 3,33 GET m->maxdias;
         PICTURE "999999";
         MESS me1+"- Cant. D¡as para C lculo Vacaciones"
      @ 4,1 SAY "Cant. Horas en el Mes" COLOR SCHE 3
      @ 4,33 GET m->maxhoras;
         PICTURE "999999";
         MESS me1+"- Horas en el Mes para Hs. Extras"
      @ 5,1 SAY "Calcula s/B sico Conformado ?" COLOR SCHE 3
      ptr=sino(m->basconf)
      @ 5,33 GET m->xasconf;
         PICTURE ptr;
         MESS me1+"- Adicionales van al B sico ?"
      READ
      SELECT con
      GOTO ff
      m->basconf=(xasconf='SI')
      GATHER MEMVAR
   ENDIF
ENDIF
RELE WIND win
RELE convenio,pornoct,maxdias,maxhoras,basconf,me1,xasconf,ff,sigue,ptr
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: CCONV.PRG
