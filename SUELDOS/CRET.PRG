*:*********************************************************************
*:
*:        Program: CRET.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: RET.PRG                       
*:
*:          Calls: EXISTE         (procedure in PROCESOS.PRG)
*:               : ITHOR1.PRG
*:               : RPER()         (function  in PROCESOS.PRG)
*:               : SINOS()        (function  in PROCESOS.PRG)
*:               : ELIJN()        (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:52               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: CRET.PRG
*-- Fecha   : 17/9/90
*-- Version : G. REINER
*-- Notas   : CORRECCION RETENCIONES
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
sigue=.T.
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFI WIND win FROM 10,13 TO 16,76 TITL " Ingreso de Retenciones " SHAD COLOR SCHE 8
DEFI WIND win1 FROM 1,1 TO 3,3
DEFI WIND win2 FROM 1,1 TO 3,3
DEFI WIND win3 FROM 1,1 TO 3,3
DEFI WIND win4 FROM 1,1 TO 3,3
DEFI WIND win5 FROM 1,1 TO 3,3
STORE 'Cor Retenciones - ' TO me1
SCATTER MEMVAR
respu=''
formmes=''
formqui=''
DEAC WIND ALL
DEFI WIND win FROM 6,16 TO 11,79 TITL " Ingreso de Retenciones " SHAD COLOR SCHE 8
ACTI WIND win
@ 1,1 SAY "Denominaci¢n Retenci¢n" COLOR SCHE 3
@ 2,1 SAY "Texto Retenci¢n para Liquidaci¢n" COLOR SCHE 3
@ 1,41 GET m->retencion PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESS me1+'Denom. "interna" Retenci¢n - [ESC] para Men£'
READ
IF LASTKEY()<>27
   IF ISALPHA(m->retencion)
      m->retencion=PROPER(m->retencion)
      IF retencion<>m->retencion
         SET DELE OFF
         SEEK ALLTRIM(m->retencion)
         SET DELE ON
         IF FOUND()
            ACTI SCRE
            @ 24,0 SAY PADC('Retenci¢n '+ALLTRIM(m->retencion)+' existe - ENTER para continuar',80,' ')
            ACTI WIND win
            DO existe WITH ' Retenci¢n'
            DO WHILE INKEY()=0
            ENDDO
            sigue=.F.
         ENDIF
      ENDIF
   ELSE
      sigue=.F.
   ENDIF
   IF sigue
      @ 2,41 GET m->rettexto PICTURE "XXXXXXXXXXXXXXXXXXXX";
         MESS me1+'Denominaci¢n de la Retenci¢n para el recibo'
      READ
      IF LASTKEY()<>27
         DEFI WIND win1 FROM 9,16 TO 14,79 TITL " Forma de pago de la Retenci¢n " SHAD COLOR SCHE 8
         ACTI WIND win1
         @ 1,1 SAY "Forma de Pago" COLOR SCHE 3
         @ 2,1 SAY "Monto" COLOR SCHE 3
         m->rettipo=IIF(m->rettipo='P',"Porcentual","Fijo      ")
         @ 1,41 GET m->rettipo PICTURE "@M Porcentual,Fijo";
            MESS me1+'Forma de c lculo de la Retenci¢n'
         READ
         vez=1
         IF m->rettipo='F'
            DO WHILE m->retmonto=0 .OR. vez=1
               vez=2
               @ 2,41 GET m->retmonto PICTURE "99999999999.99";
                  MESS me1+'Monto fijo de la Retenci¢n'
               READ
            ENDDO
         ELSE
            @ 2,1 SAY "Porcentaje" COLOR SCHE 3
            @ 2,41 GET m->retmonto PICTURE "99999999999.99";
               MESS me1+'Porcentaje directo sobre haberes'
            READ
            IF m->retmonto=0
               MOVE WIND win BY -5,-15
               MOVE WIND win1 BY -5,-10
               DEFI WIND win2 FROM 7,0 TO 13,79 TITL " F¢rmula para empleados quincenales " SHAD COLOR SCHE 8
               STORE ALLTRIM(retformqui) TO fq
               ACTI WIND win2
               @ 1,1 GET fq
               CLEAR GETS
               SELE VAR
               ACTI SCRE
               @ 24,0 SAY PADC(me1+' F¢rmula para quincenales',80,' ')
               DO ithor1 WITH 'VARPOP',varpop,fq,1,1,'WIN2'
               formqui=respu+SPACE(200-LEN(respu))
               ACTI WIND win2
               @ 1,1 GET formqui;
                  MESS me1+' F¢rmula para quincenales - Corrija f¢rmula'
               READ
               DEFI WIND win3 FROM 10,0 TO 16,79 TITL " F¢rmula para empleados mensuales " SHAD COLOR SCHE 8
               STORE ALLTRIM(ret->retformmes) TO fq
               ACTI WIND win3
               @ 1,1 GET fq
               CLEAR GETS
               SET MESS TO me1+' Ingrese f¢rmula para empleados mensuales'
               DO ithor1 WITH 'VARPOP',varpop,fq,1,1,'WIN3'
               formmes=respu+SPACE(200-LEN(respu))
               ACTI WIND win3
               @ 1,1 GET formmes;
                  MESS me1+' F¢rmula para mensuales - Arregle f¢rmula'
               READ
            ENDIF
         ENDIF
         DEFI WIND win4 FROM 12,15 TO 20,69 TITL " Detalles de la Retenci¢n " SHAD COLOR SCHE 8
         ACTI WIND win4
         @ 1,1 SAY "Per¡odo del Pago" COLOR SCHE 3
         @ 2,1 SAY "A qui‚n se descuenta ?" COLOR SCHE 3
         @ 3,1 SAY "Se borra despu‚s de cada liquidaci¢n ?" COLOR SCHE 3
         @ 4,1 SAY "Vencimiento de la Retenci¢n" COLOR SCHE 3
         @ 5,1 SAY "Empresa" COLOR SCHE 3
         m->retper=rper(m->retper)
         IF m->retempresa<>0
            GOTO m->retempresa IN jan
            es=jan->empresa
         ELSE
            es='Todas las Empresas'
         ENDIF
         STORE IIF(m->retquien="O",'Obrero',"Patr¢n") TO m->retquien
         @ 1,40 GET m->retper PICTURE "@M Siempre,1¦ Quinc,2¦ Quinc,Aguinaldo,Retroact,Cada Tanto";
            MESS me1+' Cu ndo se paga la Retenci¢n '+ALLTRIM(m->retencion)+' ?'
         @ 2,40 GET m->retquien PICTURE "@M Obrero,Patr¢n ";
            MESS me1+' Qui‚n Paga la Retenci¢n '+ALLTRIM(m->retencion)
         pt1=sinos(m->retreset)
         @ 3,40 GET m->retreset PICTURE pt1;
            MESS me1+' Se borra de legajo despu‚s de cada liquidaci¢n ?'
         @ 4,40 GET m->retvenc;
            MESS me1+' Fecha tope de pago de la Retenci¢n '+ALLTRIM(m->retencion)
         @ 5,40 GET es
         READ
         IF jan->empresa<>es
            respuesta=0
            IF elijn('de la Retenci¢n')<>0
               GOTO respuesta
               m->retempresa=RECNO()
               es=empresa
            ELSE
               m->retempresa=0
               es='Todas las empresas'
            ENDIF
         ENDIF
         ACTI WIND win4
         @ 5,40 GET es
         CLEAR GETS
         IF m->retper='R'
            DEFI WIND win5 FROM 15,20 TO 21,60 TITL " Detalles de la Retenci¢n " SHAD COLOR SCHE 8
            ACTI WIND win5
            CLEA
            @ 1,1 SAY "Mes de la retroactividad" COLOR SCHE 3
            @ 2,1 SAY "Quincena de la retroactividad" COLOR SCHE 3
            @ 1,30 GET m->retmes PICTURE "99" RANGE 1,13;
               MESS me1+' Retroactivo a qu‚ mes ?'
            @ 2,30 GET m->retqui PICTURE "99" RANGE 1,2;
               MESS me1+' Retroactivo a qu‚ quincena de '+meses[m->retmes]+' ?'
            READ
         ELSE
            IF m->retper='C'
               DEFI WIND win5 FROM 15,20 TO 21,60 TITL " Detalles de la Retenci¢n " SHAD COLOR SCHE 8
               ACTI WIND win5
               CLEA
               @ 1,1 SAY "Cantidad de veces por a¤o ?" COLOR SCHE 3
               @ 2,1 SAY "Contador de veces" COLOR SCHE 3
               @ 1,41 GET m->retvez PICTURE "99" RANGE 1,26;
                  MESS me1+' Cantidad de Per¡odos por a¤o ?'
               @ 2,41 GET m->retcont PICTURE "99" RANGE 1,26;
                  MESS me1+' Posici¢n inicial del contador'
               READ
            ENDIF
         ENDIF
         SET MESS TO me1+'Grabando los datos ingresados'
         SELE ret
         GOTO ff
         GATHER MEMVAR
         REPLACE retformmes WITH formmes
         REPLACE retformqui WITH formqui
         REPL rettexto WITH PROPER(m->rettexto)
         CLEA
      ENDIF
   ENDIF
ENDIF
RELE WIND win,win1,win2,win3,win4,win5
RELE respu,formqui,formmes,es,filtro,fq,sigue,ff,vez
RELE ALL LIKE ret* EXCEPT retpop
RETURN

*: EOF: CRET.PRG
