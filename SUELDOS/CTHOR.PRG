*:*********************************************************************
*:
*:        Program: CTHOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: THOR.PRG                      
*:
*:          Calls: EXISTE         (procedure in PROCESOS.PRG)
*:               : ITHOR1.PRG
*:               : SINOS()        (function  in PROCESOS.PRG)
*:               : ELIJN()        (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:51               FoxDoc  version 2.01
*:*********************************************************************
**********************************************************************
*-- Programa: CTHOR PRG
*-- Fecha   : 10/9/90
*-- Version : G  REINER
*-- Notas   : CORRECCION TIPO DE HORA
**********************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
sigue=.T.
@ 0,34 SAY TIME() COLO I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFI WIND win FROM 10,15 TO 15,70 TITL ' Correcci¢n Tipo de Hora Trabajada ' DOUBLE SHAD COLOR SCHE 8
DEFI WIND win1 FROM 13,18 TO 18,73 TITL ' Corrija la Forma de C lculo ' SHAD COLOR SCHE 8
DEFI WIND win2 FROM 7,0 TO 13,79 TITL ' C '
DEFI WIND win3 FROM 7,0 TO 13,79 TITL ' C '
DEFI WIND win4 FROM 7,0 TO 13,79 TITL ' C '
DEFI WIND win5 FROM 7,0 TO 13,79 TITL ' C '
me1='Corr. tipo de hora - '
respu=""
DEFI WIND win FROM 10,15 TO 15,70 TITL ' Correcci¢n Tipo de Hora Trabajada ' DOUBLE SHAD COLOR SCHE 8
DEFI WIND win1 FROM 13,18 TO 18,73 TITL ' Corrija la Forma de C lculo ' SHAD COLOR SCHE 8
DEAC WIND ALL
ACTI WIND win
CLEA
SCATTER MEMVAR
formqui=ALLTRIM(horformqui)
formmes=ALLTRIM(horformmes)
xortipo=IIF(hortipo='M',"Monto Fijo","Porcentaje")
@ 1,1 SAY "Denominaci¢n Interna Hora" COLO SCHE 3
@ 2,1 SAY "Denominaci¢n Hora" COLO SCHE 3
@ 1,33 GET  m->hortipohor PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESS me1+'[ESC] para Men£'
READ
IF LASTKEY()<>27
   IF hortipohor<>m->hortipohor
      IF ISALPHA(m->hortipohor)
         SET MESS TO me1+'Chequeando existencia Tipo de Hora '+ALLTRIM(m->hortipohor)
         SEEK ALLTRIM(PROPER(m->hortipohor))
         IF FOUND()
            DO existe WITH ' Tipo de Hora'
            DO WHILE INKEY()=0
            ENDDO
            sigue=.F.
         ENDIF
      ELSE
         sigue=.F.
      ENDIF
   ENDIF
   IF sigue
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
         IF LASTKEY()<>27
            IF xortipo='P'
               @ 2,1 SAY "Porcentaje        " COLOR SCHE 3
            ELSE
               @ 2,1 SAY "Monto Fijo        " COLOR SCHE 3
            ENDIF
            @ 2,30 GET m->hormonto;
               PICTURE "99999999999.99";
               MESS me1+"- '0' para  Ingresar F¢rmula"
            READ
            IF xortipo='P' .AND. m->hormonto=0
               MOVE WIND win BY -8,0
               MOVE WIND win1 BY -9,0
               respu=""
               SELE VAR
               ACTI SCRE
               DEFI WIND win2 FROM 6,0 TO 13,79 TITL ' F¢rmula de C lculo para Quincenales' SHAD COLOR SCHE 8
               @ 24,0 SAY PADC(me1+'F¢rmula para empleados quincenales',80,' ')
               ACTI WIND win2
               @ 1,1 GET formqui
               CLEAR GETS
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
               @ 1,1 GET formmes
               CLEAR GETS
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
         ELSE
            EXIT
         ENDIF
      ENDDO
      IF LASTKEY()<>27
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
         pt1=sinos(m->horret)
         @ 1,33 GET m->horret PICTURE pt1;
            MESS me1+' El tipo de hora '+ALLTRIM(m->hortipohor)+' tiene retenciones ?'
         pt2=sinos(m->horapo)
         @ 2,33 GET m->horapo PICTURE pt2;
            MESS me1+' El tipo de hora '+ALLTRIM(m->hortipohor)+' tiene aportes ?'
         pt3=sinos(m->horbon)
         @ 3,33 GET m->horbon PICTURE pt3;
            MESS me1+' El tipo de hora '+ALLTRIM(m->hortipohor)+' es bonificable ? '
         pt4=sinos(m->horinfo)
         @ 4,33 GET m->horinfo PICTURE pt4;
            MESS me1+' Se informa la '+ALLTRIM(m->hortipohor)+' al legajo ? '
         pt5=sinos(m->horreset)
         @ 5,33 GET m->horreset PICTURE pt5;
            MESS me1+' Se borra despu‚s de la liquidaci¢n ?'
         pt6=sinos(m->horproduc)
         @ 6,33 GET m->horproduc PICTURE pt6;
            MESS me1+' Se incluye la hora en Premio a la Producci¢n ?'
         pt7=sinos(m->horpremio)
         @ 7,33 GET m->horpremio PICTURE pt7;
            MESS me1+' Se incluye la hora en Otros Premios ?'
         pt8=sinos(m->horpresen)
         @ 8,33 GET m->horpresen PICTURE pt8;
            MESS me1+' Se incluye la hora en Presentismo ?'
         READ
         IF LASTKEY()<>27
            respuesta=0
            m->horempresa=elijn(" del Tipo de Hora")
            IF m->horempresa<>0
               GOTO respuesta
               es=empresa
            ELSE
               es='Todas las empresas'
            ENDIF
            DEFI WIND win5 FROM 7,0 TO 13,78 TITL ' Empresa ' SHAD COLOR SCHE 8
            ACTI WIND win5
            @ 3,33 SAY LEFT(es,20) COLO I/W
            SELE thor
            GOTO ff
            GATHER MEMVAR
            REPLACE horformqui WITH formqui
            REPLACE horformmes WITH formmes
            REPLACE hortipo WITH xortipo
            REPLACE hortexto WITH PROPER(m->hortexto)
            SELE VAR
            SET ORDER TO 1
            SELE thor
         ENDIF
      ENDIF
   ENDIF
ENDIF
RELE WIND win,win1,win2,win3,win4,win5
RELE pt1,pt2,pt3,pt4,pt5,pt6,pt7,pt8
RELE ALL LIKE hor*
RELE xortipo,formqui,formmes,ff,sigue
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: CTHOR.PRG
