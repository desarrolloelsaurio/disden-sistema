*:*********************************************************************
*:
*:        Program: CADI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: ADI.PRG                       
*:
*:          Calls: EXISTE         (procedure in PROCESOS.PRG)
*:               : ITHOR1.PRG
*:               : RPER()         (function  in PROCESOS.PRG)
*:               : SINOS()        (function  in PROCESOS.PRG)
*:               : ELIJN()        (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:51               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: CADI.PRG
*-- Fecha   : 17/9/90
*-- Version : G. REINER
*-- Notas   : CORRIGE ADICIONALES
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ff=RECNO()
sigue=.T.
DEFI WIND win FROM 10,13 TO 16,76 TITL " Correcci�n de Adicionales " SHAD COLOR SCHE 8
DEFI WIND win1 FROM 1,1 TO 3,3
DEFI WIND win2 FROM 1,1 TO 3,3
DEFI WIND win3 FROM 1,1 TO 3,3
DEFI WIND win4 FROM 1,1 TO 3,3
DEFI WIND win5 FROM 1,1 TO 3,3
STORE 'Corr. Adicionales - ' TO me1
SCATTER MEMVAR
respu=''
formmes=''
formqui=''
DEFI WIND win FROM 6,16 TO 11,79 TITL " Correcci�n de Adicionales " SHAD COLOR SCHE 8
ACTI WIND win
@ 1,1 SAY "Denominaci�n Adicional" COLOR SCHE 3
@ 2,1 SAY "Texto Adicional para Liquidaci�n" COLOR SCHE 3
@ 1,41 GET m->adicional PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESS me1+'Denom. "interna" adicional - [ENTER] para terminar'
READ
IF LASTKEY()<>27
   IF ISALPHA(m->adicional)
      m->adicional=PROPER(m->adicional)
      IF adicional<>m->adicional
         SET DELE OFF
         SEEK ALLTRIM(m->adicional)
         SET DELE ON
         IF FOUND()
            ACTI SCRE
            @ 24,0 SAY PADC('Adicional '+ALLTRIM(m->adicional)+' existe - ENTER para continuar',80,' ')
            ACTI WIND win
            DO existe WITH ' Adicional'
            DO WHILE INKEY()=0
            ENDDO
            sigue=.F.
         ENDIF
      ENDIF
   ELSE
      sigue=.F.
   ENDIF
   IF sigue
      @ 2,41 GET m->aditexto PICTURE "XXXXXXXXXXXXXXXXXXXX";
         MESS me1+'Denominaci�n del adicional para el recibo'
      READ
      DEFI WIND win1 FROM 9,16 TO 14,79 TITL " Forma de pago del Adicional " SHAD COLOR SCHE 8
      ACTI WIND win1
      @ 1,1 SAY "Forma de Pago" COLOR SCHE 3
      @ 2,1 SAY "Monto" COLOR SCHE 3
      m->aditipo=IIF(m->aditipo='P',"Porcentual","Fijo      ")
      @ 1,41 GET m->aditipo PICTURE "@M Porcentual,Fijo";
         MESS me1+'Forma de c�lculo del Adicional'
      READ
      vez=1
      IF m->aditipo='F'
         DO WHILE m->adimonto=0 .OR. vez=1
            vez=2
            @ 2,41 GET m->adimonto PICTURE "99999999999.99";
               MESS me1+'Monto fijo del Adicional'
            READ
         ENDDO
      ELSE
         @ 2,1 SAY "Porcentaje" COLOR SCHE 3
         @ 2,41 GET m->adimonto PICTURE "99999999999.99";
            MESS me1+'Porcentaje directo sobre haberes'
         READ
         IF LASTKEY()<>27
            IF m->adimonto=0
               MOVE WIND win BY -5,-15
               MOVE WIND win1 BY -5,-10
               DEFI WIND win2 FROM 7,0 TO 13,79 TITL " F�rmula para empleados quincenales " SHAD COLOR SCHE 8
               ACTI WIND win2
               STORE ALLTRIM(adiformqui) TO fq
               @ 1,1 GET fq
               CLEAR GETS
               SELE VAR
               ACTI SCRE
               @ 24,0 SAY PADC(me1+' F�rmula para quincenales',80,' ')
               DO ithor1 WITH 'VARPOP',varpop,fq,1,1,'WIN2'
               formqui=respu+SPACE(200-LEN(respu))
               ACTI WIND win2
               @ 1,1 GET formqui;
                  MESS me1+' F�rmula para quincenales - Corrija f�rmula'
               READ
               DEFI WIND win3 FROM 10,0 TO 16,79 TITL " F�rmula para empleados mensuales " SHAD COLOR SCHE 8
               ACTI WIND win3
               STORE ALLTRIM(adi->adiformmes) TO fq
               @ 1,1 GET fq
               CLEAR GETS
               SET MESS TO me1+' Ingrese f�rmula para empleados mensuales'
               DO ithor1 WITH 'VARPOP',varpop,fq,1,1,'WIN3'
               formmes=respu+SPACE(200-LEN(respu))
               ACTI WIND win3
               @ 1,1 GET formmes;
                  MESS me1+' F�rmula para mensuales - Arregle f�rmula'
               READ
            ENDIF
         ENDIF
      ENDIF
      DEFI WIND win4 FROM 12,15 TO 22,69 TITL " Detalles del Adicional " SHAD COLOR SCHE 8
      ACTI WIND win4
      @ 1,1 SAY "Per�odo del Pago" COLOR SCHE 3
      @ 2,1 SAY "Tiene retenciones ?" COLOR SCHE 3
      @ 3,1 SAY "Tiene aportes ?" COLOR SCHE 3
      @ 4,1 SAY "Conforma el B�sico ?" COLOR SCHE 3
      @ 5,1 SAY "Se borra despu�s de cada liquidaci�n ?" COLOR SCHE 3
      @ 6,1 SAY "Vencimiento del Adicional" COLOR SCHE 3
      @ 7,1 SAY "Empresa" COLOR SCHE 3
      m->adiper=rper(m->adiper)
      IF m->adiempresa<>0
         GOTO m->adiempresa IN jan
         es=jan->empresa
      ELSE
         es='Todas las Empresas'
      ENDIF
      @ 1,40 GET m->adiper PICTURE "@M Siempre,1� Quinc,2� Quinc,Aguinaldo,Retroact,Cada Tanto";
         MESS me1+' Cu�ndo se paga el adicional '+ALLTRIM(m->adicional)+' ?'
      pt1=sinos(m->adiret)
      @ 2,40 GET m->adiret PICTURE pt1;
         MESS me1+' El adicional '+ALLTRIM(m->adicional)+' tiene retenciones ?'
      pt2=sinos(m->adiapo)
      @ 3,40 GET m->adiapo PICTURE pt2;
         MESS me1+' '+ALLTRIM(m->adicional)+' tiene aportes ?'
      pt3=sinos(m->adiconf)
      @ 4,40 GET m->adiconf PICTURE pt3;
         MESS me1+' '+ALLTRIM(m->adicional)+' integra el B�sico Conformado ?'
      pt4=sinos(m->adireset)
      @ 5,40 GET m->adireset PICTURE pt4;
         MESS me1+' Se borra de legajo despu�s de cada liquidaci�n ?'
      @ 6,40 GET m->adivenc;
         MESS me1+' Fecha tope de pago del adicional '+ALLTRIM(m->adicional)
      @ 7,40 GET es;
         MESS me1+' [TECLA] Y [ENTER] para Coregir'
      READ
      IF LASTKEY()<>27
         IF jan->empresa<>es
            m->adiempresa=elijn(' del Adicional')
            IF m->adiempresa<>0
               GOTO m->adiempresa
               es=empresa
            ELSE
               es='Todas las empresas'
            ENDIF
            ACTI WIND win4
            @ 7,40 GET es
            CLEAR GETS
         ENDIF
         IF m->adiper='R'
            DEFI WIND win5 FROM 15,20 TO 20,60 TITL " Detalles del Adicional " SHAD COLOR SCHE 8
            ACTI WIND win5
            CLEA
            @ 1,1 SAY "Mes de la retroactividad" COLOR SCHE 3
            @ 2,1 SAY "Quincena de la retroactividad" COLOR SCHE 3
            @ 1,32 GET m->adimes PICTURE "99" RANGE 1,13;
               MESS me1+' Retroactivo a qu� mes ?'
            @ 2,32 GET m->adiqui PICTURE "99" RANGE 1,2;
               MESS me1+' Retroactivo a qu� quincena de '+meses[M->ADImes]+' ?'
            READ
         ELSE
            IF m->adiper='C'
               DEFI WIND win4 FROM 15,20 TO 21,60 TITL " Detalles del Adicional " SHAD COLOR SCHE 8
               ACTI WIND win5
               CLEA
               @ 1,1 SAY "Cantidad de veces por a�o ?" COLOR SCHE 3
               @ 2,1 SAY "Contador de veces" COLOR SCHE 3
               @ 1,41 GET m->adivez PICTURE "99" RANGE 1,26;
                  MESS me1+' Cantidad de Per�odos por a�o ?'
               @ 2,41 GET m->adicont PICTURE "99" RANGE 1,26;
                  MESS me1+' Posici�n inicial del contador'
               READ
            ENDIF
         ENDIF
         SET MESS TO me1+'Grabando los datos ingresados'
         SELE adi
         GOTO ff
         GATHER MEMVAR
         REPLACE adiformmes WITH formmes
         REPLACE adiformqui WITH formqui
         REPLACE aditexto WITH PROPER(m->aditexto)
         CLEA
      ENDIF
   ENDIF
ENDIF
RELE WIND win,win1,win2,win3,win4,win5
RELE respu,formqui,formmes,es,filtro,fq,sigue,ff,vez,pt1,pt2,pt3,pt4
RELE ALL LIKE adi* EXCEPT adipop
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: CADI.PRG
