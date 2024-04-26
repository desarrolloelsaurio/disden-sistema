*:*********************************************************************
*:
*:        Program: ITHOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: THOR.PRG                      
*:
*:          Calls: ITHOR1.PRG
*:               : INFIC.PRG
*:               : EXISTE         (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:50               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: ITHOR PRG
*-- Fecha   : 10/9/90
*-- Version : G  REINER
*-- Notas   : INGRESO DE TIPO DE HORA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLO I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFI WIND win FROM 10,15 TO 15,70 TITL ' Ingreso Tipo de Hora Trabajada ' DOUBLE SHAD COLOR SCHE 8
DEFI WIND win1 FROM 13,18 TO 18,73 TITL ' Ingrese la Forma de C lculo ' SHAD COLOR SCHE 8
DEFI WIND win2 FROM 7,0 TO 13,79 TITL ' Ingrese la F¢rmula de C lculo ' SHAD COLOR SCHE 8
DEFI WIND win3 FROM 7,0 TO 13,79 TITL ' Ingrese la F¢rmula de C lculo ' SHAD COLOR SCHE 8
DEFI WIND win4 FROM 7,0 TO 13,79 TITL ' Ingrese la F¢rmula de C lculo ' SHAD COLOR SCHE 8
DEFI WIND win5 FROM 7,0 TO 13,79 TITL ' Ingrese la F¢rmula de C lculo ' SHAD COLOR SCHE 8
me1='Ing. tipo de hora - '
respu=""
DO WHILE .T.
   DEFI WIND win FROM 10,15 TO 15,70 TITL ' Ingreso Tipo de Hora Trabajada ' DOUBLE SHAD COLOR SCHE 8
   DEFI WIND win1 FROM 13,18 TO 18,73 TITL ' Ingrese la Forma de C lculo ' SHAD COLOR SCHE 8
   DEAC WIND ALL
   ACTI WIND win
   CLEA
   formqui=""
   formmes=""
   xortipo='          '
   SCATTER MEMVAR BLANK
   @ 1,1 SAY "Denominaci¢n Interna Hora" COLO SCHE 3
   @ 2,1 SAY "Denominaci¢n Hora" COLO SCHE 3
   @ 1,33 GET  m->hortipohor PICTURE "XXXXXXXXXXXXXXXXXXXX";
      MESS me1+'[ENTER] para finalizar'
   READ
   IF ISALPHA(m->hortipohor)
      SET MESS TO me1+'Chequeando existencia Tipo de Hora '+ALLTRIM(m->hortipohor)
      SET DELE OFF
      SEEK ALLTRIM(PROPER(m->hortipohor))
      SET DELE ON
      IF .NOT. FOUND()
         m->hortipohor=PROPER(m->hortipohor)
         @ 2,33 GET m->hortexto PICTURE "XXXXXXXXXXXXXXXXXXXX";
            MESS me1+'Nombre de la Hora para el recibo'
         READ
         ACTI WIND win1
         DO WHILE .T.
            CLEA
            @ 1,1 SAY "Tipo de C lculo" COLOR SCHE 3
            @ 2,1 SAY "Monto o Porcentaje" COLOR SCHE 3
            @ 1,30 GET xortipo;
               PICTURE "@m Monto Fijo,Porcentaje";
               MESS me1+"- Monto Fijo o Porcentaje sobre B sico"
            READ
            IF xortipo='P'
               @ 2,1 SAY "Porcentaje        " COLOR SCHE 3
            ELSE
               @ 2,1 SAY "Monto Fijo        " COLOR SCHE 3
            ENDIF
            @ 2,30 GET m->hormonto;
               PICTURE "99999999999.99";
               MESS me1+"- '0' para Ingresar F¢rmula"
            READ
            IF xortipo='P' .AND. m->hormonto=0
               MOVE WIND win BY -8,0
               MOVE WIND win1 BY -9,0
               formqui=""
               respu=""
               SELE VAR
               ACTI SCRE
               DEFI WIND win2 FROM 6,0 TO 13,79 TITL ' F¢rmula de C lculo para Quincenales' SHAD COLOR SCHE 8
               @ 24,0 SAY PADC(me1+' F¢rmula para empleados quincenales',80,' ')
               ACTI WIND win2
               DO ithor1 WITH 'VARPOP',varpop,formqui,1,1,'WIN2'
               formqui=respu+SPACE(200-LEN(respu))
               ACTI WIND win2
               @ 1,1 GET formqui;
                  MESS me1+' F¢rmula para quincenales - Arregle f¢rmula'
               READ
               ACTI SCRE
               DEFI WIND win3 FROM 9,0 TO 16,79 TITL ' F¢rmula de C lculo para Mensuales ' SHAD COLOR SCHE 8
               @ 24,0 SAY PADC(me1+' F¢rmula para empleados mensuales',80,' ')
               ACTI WIND win3
               formmes=""
               respu=""
               DO ithor1 WITH 'VARPOP',varpop,formmes,1,1,'WIN3'
               formmes=respu+SPACE(200-LEN(respu))
               ACTI WIND win3
               @ 1,1 GET formmes;
                  MESS me1+' F¢rmula para mensuales - Arregle f¢rmula'
               READ
               EXIT
            ELSE
               IF m->hormonto<>0
                  EXIT
               ENDIF
            ENDIF
            SELE thor
         ENDDO
         DEFI WIND win4 FROM 10,41 TO 21,79 TITL ' Detalles de la Liquidaci¢n ' SHAD COLOR SCHE 8
         ACTI WIND win4
         @ 1,1 SAY "Tiene retenciones ?               " COLO SCHE 3
         @ 2,1 SAY "Tiene aportes ?                   " COLO SCHE 3
         @ 3,1 SAY "Es bonificable ?                  " COLO SCHE 3
         @ 4,1 SAY "Informa a legajo ?                " COLO SCHE 3
         @ 5,1 SAY "Se Borra cada per¡odo ?           " COLO SCHE 3
         @ 6,1 SAY "Es hora Productiva ?              " COLO SCHE 3
         @ 7,1 SAY "Es hora c/premio Asistencia       " COLO SCHE 3
         @ 8,1 SAY "Es hora c/premio Presentismo ?    " COLO SCHE 3
         @ 1,33 GET m->horret PICTURE "@M SI,NO";
            MESS me1+' El tipo de hora '+ALLTRIM(m->hortipohor)+' tiene retenciones ?'
         @ 2,33 GET m->horapo PICTURE "@M SI,NO";
            MESS me1+' El tipo de hora '+ALLTRIM(m->hortipohor)+' tiene aportes ?'
         @ 3,33 GET m->horbon PICTURE "@M SI,NO";
            MESS me1+' El tipo de hora '+ALLTRIM(m->hortipohor)+' es bonificable ? '
         @ 4,33 GET m->horinfo PICTURE "@M SI,NO";
            MESS me1+' Se informa la '+ALLTRIM(m->hortipohor)+' al legajo ? '
         @ 5,33 GET m->horreset PICTURE "@M SI,NO";
            MESS me1+' Se borra despu‚s de la liquidaci¢n ?'
         @ 6,33 GET m->horproduc PICTURE "@M SI,NO";
            MESS me1+' Se incluye la hora en Premio a la Producci¢n ?'
         @ 7,33 GET m->horpremio PICTURE "@M SI,NO";
            MESS me1+' Se incluye la hora en Otros Premios ?'
         @ 8,33 GET m->horpresen PICTURE "@M SI,NO";
            MESS me1+' Se incluye la hora en Presentismo ?'
         READ
         DEFI WIND win5 FROM 13,25 TO 19,75 TITL ' Variables de Totalizaci¢n ' SHAD COLOR SCHE 8
         DO WHILE .T.
            CLEA
            ACTI WIND win5
            @ 1,1 SAY "Variable p/acumular total horas   " COLO SCHE 3
            @ 2,1 SAY "Variable p/acumular total monto   " COLO SCHE 3
            @ 3,1 SAY "Empresa                           " COLO SCHE 3
            rn=RECNO("thor")
            rn=ALLTRIM(STR(rn,5))
            m->horvarhs='TH'+rn
            m->horvarhs=m->horvarhs+SPACE(14-LEN(m->horvarhs))
            m->horvarmon='TT'+rn
            m->horvarmon=m->horvarmon+SPACE(14-LEN(m->horvarmon))
            @ 1,33 GET m->horvarhs PICTURE "@!ANNNNNNNNNNNNN";
               MESS me1+' Variable para totalizar las horas'
            @ 2,33 GET m->horvarmon PICTURE "@!ANNNNNNNNNNNNN";
               MESS me1+' Variable para totalizar los montos de la hora'
            READ
            IF m->horvarmon=m->horvarhs
               ACTI SCRE
               @ 24,0 SAY PADC(me1+' Las dos variables son iguales',80,'*') COLO SCHE 19
            ELSE
               IF m->horvarmon=' ' .OR. m->horvarhs=' '
                  ACTI SCRE
                  @ 24,0 SAY PADC(me1+' Las variables contienen espacios',80,'*') COLO SCHE 19
               ELSE
                  IF LEN(ALLTRIM(m->horvarmon))<3 .OR. LEN(ALLTRIM(m->horvarhs))<3
                     ACTI SCRE
                     @ 24,0 SAY PADC('Las variables deben contener m s de 2 caracteres',80,'*') COLO SCHE 19
                  ELSE
                     SELE thor
                     SET ORDER TO 3
                     ACTI SCRE
                     @ 24,0 SAY PADC('Chequeando existencia variable '+ALLTRIM(m->horvarmon),80,' ') COLO SCHE 19
                     SEEK ALLTRIM(m->horvarmon)
                     IF FOUND()
                        @ 24,0 SAY PADC('La variable '+ALLTRIM(m->horvarmon)+' existe',80,'*') COLO SCHE 19
                     ELSE
                        SELE VAR
                        SET ORDER TO 2
                        SEEK ALLTRIM(m->horvarmon)
                        IF FOUND()
                           @ 24,0 SAY PADC('La variable '+ALLTRIM(m->horvarmon)+' existe',80,'*') COLO SCHE 19
                        ELSE
                           SELE thor
                           SET ORDER TO 3
                           @ 24,0 SAY PADC('Chequeando existencia variable '+ALLTRIM(m->horvarhs),80,' ') COLO SCHE 19
                           SEEK ALLTRIM(m->horvarhs)
                           IF FOUND()
                              @ 24,0 SAY PADC('La variable '+ALLTRIM(m->horvarhs)+' existe',80,'*') COLO SCHE 19
                           ELSE
                              SELE VAR
                              SET ORDER TO 2
                              SEEK ALLTRIM(m->horvarmon)
                              IF FOUND()
                                 @ 24,0 SAY PADC('La variable '+ALLTRIM(m->horvarmon)+' existe',80,'*') COLO SCHE 19
                              ELSE
                                 EXIT
                              ENDIF
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
            DO WHILE INKEY()=0
               ?? CHR(7)
            ENDDO
            ACTI SCRE
            @ 24,0 SAY SPACE(80)
         ENDDO
         ACTI SCREEN
         respuesta=0
         SELE jan
         IF janpop
            ACTI POPUP janpop
            IF respuesta<>0
               GOTO TOP
               SKIP respuesta-1
               filtro=RECNO()
            ELSE
               filtro=0
            ENDIF
         ELSE
            DO infic WITH 'Empresa a la que pertenece la hora '+ALLTRIM(m->hortipohor),RECCOUNT()
            filtro=respuesta
         ENDIF
         IF respuesta<>0
            GOTO filtro
            es=empresa
         ELSE
            es='Todas las empresas'
         ENDIF
         ACTI WIND win5
         @ 3,33 SAY LEFT(es,20) COLO I/W
         m->horempresa=filtro
         SELE thor
         APPE BLANK
         REPLACE horformqui WITH formqui
         REPLACE horformmes WITH formmes
         GATHER MEMVAR
         REPLACE hortipo WITH xortipo
         REPL hortexto WITH PROPER(m->hortexto)
         SELE VAR
         APPE BLAN
         tph=m->hortipohor
         IF AT("COMUNES",UPPER(tph))<>0
            tph=STUFF(tph,AT("COMUNES",UPPER(tph)),7,"Com.")
         ENDIF
         IF AT("HORAS",UPPER(tph))<>0
            tph=STUFF(tph,AT("HORAS",UPPER(tph)),5,"Hs.")
         ENDIF
         IF AT("NOCTURNAS",UPPER(tph))<>0
            tph=STUFF(tph,AT("NOCTURNAS",UPPER(tph)),9,"Noct.")
         ENDIF
         REPL nombre WITH 'Tt. Mt. '+tph
         REPL contenido WITH 'm->'+m->horvarmon
         APPE BLAN
         REPL nombre WITH 'Tt. '+tph
         REPL contenido WITH 'm->'+m->horvarhs
         RELE tph
         SET ORDER TO 1
         SELE thor
      ELSE
         ACTI SCRE
         @ 24,0 SAY PADC('Tipo de Hora '+ALLTRIM(m->hortipohor)+' existe',80,' ')
         ACTI WIND win
         DO existe WITH ' Tipo de Hora'
         DO WHILE INKEY()=0
         ENDDO
      ENDIF
   ELSE
      EXIT
   ENDIF
ENDDO
RELE WIND win,win1,win2,win3,win4,win5
RELE ALL LIKE hor*
RELE xortipo,formqui,formmes
@ 24,0 SAY SPACE(80)
SET COLOR TO W/B,B,B
RETURN
*: EOF: ITHOR.PRG
