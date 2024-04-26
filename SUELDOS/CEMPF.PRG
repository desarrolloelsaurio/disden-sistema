*:*********************************************************************
*:
*:        Program: CEMPF.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPF.PRG                      
*:
*:          Calls: MINUS()        (function  in PROCESOS.PRG)
*:               : MEMPF.PRG
*:               : ELIPAR()       (function  in PROCESOS.PRG)
*:               : SINOS()        (function  in PROCESOS.PRG)
*:               : SINO()         (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:53               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: CEMPF.PRG
*-- Fecha   : 11/05/90 06:35am
*-- Version : G. REINER - GENERADOR
*-- Notas   : CORRECCION PARIENTES DEL EMPLEADO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,'Û')
ff=RECNO()
DEFINE WINDOW win FROM 5,14 TO 19,79 TITL " Correcci¢n Familiares de "+ALLTRIM(emp->apynom)+' ' SHAD COLOR SCHE 8
SELE epar
me1=" Correcci¢n Familiares de "+ALLTRIM(emp->apynom)
SCAN FOR epar->empleado=ff
   ACTI WIND win
   SCATTER MEMVAR
   psc=minus(ALLTRIM(m->apynom))
   m->apy=SUBSTR(m->apynom,psc)+SPACE(30)
   m->apynom=LEFT(m->apynom,psc-2)+SPACE(30)
   DO mempf
   ulpr=PROGRAM()
   sigue='NO'
   @ 11,5 SAY 'Es Este el que Corrige '
   @ 11,30 GET sigue PICTURE '@M NO,SI';
      MESS 'Cambie Opciones con la Barra Espaciadora - [ESC] para Men£'
   READ
   IF LASTKEY()=27
      EXIT
   ELSE
      IF sigue<>"SI"
         LOOP
      ELSE
         @ 1,23 GET m->apynom;
            PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            MESS me1+"- Apellido - [ESC] para Men£"
         READ
         IF ISALPHA(ALLTRIM(m->apynom))
            @ 2,23 GET m->apy;
               PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
               MESS me1+"- Nombre"
            prntsc=par->parentesco
            @ 3,23 GET prntsc;
               MESS me1+'- [TECLA] Y [ENTER] para Corregir'
            READ
            IF prntsc<>par->parentesco
               respuesta=0
               DO WHILE elipar(" del Empleado")=0
               ENDDO
               ACTI WIND win
               @ 3,23 GET par->parentesco
               CLEAR GETS
               m->parentesco=respuesta
            ENDIF
            tdc=tdoc[m->tipodoc]
            @ 4,23 GET tdc;
               MESS me1+'- [TECLA] Y [ENTER] para Corregir'
            READ
            IF tdc<>tdoc[m->tipodoc]
               ACTI SCREEN
               @ 1,60 MENU tdoc,5 TITL ' Tipo de Documento ' SHAD
               respuesta=0
               DO WHILE respuesta=0
                  READ MENU TO respuesta
               ENDDO
               m->tipodoc=respuesta
               ACTI WIND win
               @ 4,23 GET tdoc[m->tipodoc]
               CLEAR GETS
            ENDIF
            @ 5,23 GET m->nrodoc;
               PICTURE "99.999.999";
               MESS me1+"- N§ de Documento"
            @ 6,23 GET m->fechanac;
               PICTURE "@D";
               MESS me1+"- Fecha de Nacimiento"
            tsc=tesc[m->tipoest]
            @ 7,23 GET tsc;
               MESS me1+'- [TECLA] Y [ENTER] para Corregir'
            READ
            IF tsc<>tesc[m->tipoest]
               ACTI SCREEN
               @ 1,60 MENU tesc,6 TITL ' Tipo de Estudios ' SHAD
               respuesta=0
               DO WHILE respuesta=0
                  READ MENU TO respuesta
               ENDDO
               m->tipoest=respuesta
               ACTI WIND win
               @ 7,23 GET tesc[m->tipoest]
               CLEAR GETS
            ENDIF
            IF tesc[m->tipoest]<>'No'
               pt1=sinos(m->comprob)
               @ 8,23 GET m->comprob;
                  PICTURE pt1;
                  MESS me1+"- Comprobante de Escolaridad"
               READ
            ELSE
               m->comprob='  '
            ENDIF
            nada=IIF(m->empresa,"SI","NO")
            pico=sino(m->empresa)
            @ 9,23 GET nada PICTURE pico
            READ
            SELECT epar
            m->apynom=UPPER(ALLTRIM(m->apynom))+' '+PROPER(ALLTRIM(m->apy))
            GATHER MEMVAR
            REPL empresa WITH nada="SI"
         ENDIF
         CLEAR
      ENDIF
   ENDIF
ENDSCAN
RELE WIND win
RELE empleado,parentesco,apynom,fechanac,tipodoc,nrodoc,tipoest,comprob,me1,ff,sigue,psc,prtsc,tsc,tdc,pt1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: CEMPF.PRG
