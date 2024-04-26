********************************************************************************
*-- Programa: IRET.PRG
*-- Fecha   : 17/9/90
*-- Version : G. REINER
*-- Notas   : INGRESA RETENCIONES
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLO I
@ 0,46 SAY PADC(PROGRAM(),10,' ') colo i
DEFI WIND win FROM 3,16 TO 22,79 TITL " Ingreso de datos Retenciones " SHAD COLO SCHE 8
ACTI WIND win
DEFI WIND win1 FROM 7,0 TO 13,79 TITL " Ingrese la F¢rmula " SHAD COLO SCHE 8
STORE 'Ingreso de Retenciones - ' TO me1
DO WHILE .T.
   SCATTER MEMVAR BLANK
   respu=''
   formmes=''
   formqui=''
   @ 1,1 SAY "Denominaci¢n Retenci¢n                   " COLO SCHE 3
   @ 2,1 SAY "Texto Retenci¢n para Liquidaci¢n         " COLO SCHE 3
   @ 3,1 SAY "Forma de Pago                            " COLO SCHE 3
   @ 4,1 SAY "Monto                                    " COLO SCHE 3
   @ 5,1 SAY "F¢rmula para Quincenales                 " COLO SCHE 3
   @ 6,1 SAY "F¢rmula para Mensuales                   " COLO SCHE 3
   @ 7,1 SAY "Per¡odo del Pago                         " COLO SCHE 3
   @ 8,1 SAY "Se paga en SAC ?                         " COLO SCHE 3
   @ 9,1 SAY "Se paga en despido ?                     " COLO SCHE 3
   @ 10,1 SAY "Mes de la retroactividad                 " COLO SCHE 3
   @ 11,1 SAY "Quincena de la retroactividad            " COLO SCHE 3
   @ 12,1 SAY "Cantidad de veces por a¤o ?              " COLO SCHE 3
   @ 13,1 SAY "Contador de veces                        " COLO SCHE 3
   @ 14,1 SAY "Vencimiento de la Retenci¢n              " COLO SCHE 3
   @ 15,1 SAY "Se borra despu‚s de cada liquidaci¢n ?   " COLO SCHE 3
   @ 16,1 SAY "Empresa                                  " COLO SCHE 3
   @ 1,41 GET m->retencion PICTURE "XXXXXXXXXXXXXXXXXXXX";
      MESS me1+'Denom. "interna" Retenci¢n - ENTER para terminar';
      COLO SCHE 8
   READ
   IF ISALPHA(m->retencion)
      m->retencion=UPPER(m->retencion)
      SET MESS TO me1+'Chequeando existencia de Retenci¢n '+ALLTRIM(m->retencion)

      SEEK ALLTRIM(m->retencion)
      IF .NOT. FOUND()
         @ 2,41 GET m->rettexto PICTURE "XXXXXXXXXXXXXXXXXXXX";
            MESS me1+'Denominaci¢n de la Retenci¢n para el recibo';
            COLO SCHE 8
         m->rettipo=SPACE(10)
         @ 3,41 GET m->rettipo PICTURE "@M Porcentual,Fijo";
            MESS me1+'Forma de c lculo de la Retenci¢n';
            COLO SCHE 8
         READ
         IF m->rettipo='F'
            DO WHILE m->retmonto=0
               @ 4,41 GET m->retmonto PICTURE "99999999999.99";
                  MESS me1+'Monto fijo de la Retenci¢n';
                  COLO SCHE 8
               READ
            ENDDO
         ELSE
            @ 4,1 SAY "Porcentaje" COLO SCHE 3
            @ 4,41 GET m->retmonto PICTURE "99999999999.99";
               MESS me1+'Porcentaje directo sobre haberes';
               COLO SCHE 8
            READ
            IF m->retmonto=0
               STORE "" TO fq
               SELE VAR
               SET MESS TO me1+' Ingrese f¢rmula para empleados quincenales'
               DO ithor1 WITH 'VARPOP',varpop,fq,1,1,'WIN1'
               formqui=respu+SPACE(200-LEN(respu))
               ACTI WIND win1
               @ 1,1 GET formqui;
                  MESS me1+' F¢rmula para quincenales - Arregle f¢rmula';
                  COLO SCHE 8
               READ
               DEAC WIND win1
               @ 5,41 GET formqui PICTURE "@S20";
                  COLO SCHE 8
               CLEAR GETS
               STORE "" TO fq
               SET MESS TO me1+' Ingrese f¢rmula para empleados mensuales'
               DO ithor1 WITH 'VARPOP',varpop,fq,1,1,'WIN1'
               formmes=respu+SPACE(200-LEN(respu))
               ACTI WIND win1
               @ 1,1 GET formmes;
                  MESS me1+' F¢rmula para mensuales - Arregle f¢rmula';
                  COLO SCHE 8
               READ
               DEAC WIND win1
               @ 6,41 GET formmes PICTURE '@S20';
                  COLO SCHE 8
               CLEAR GETS
            ENDIF
         ENDIF
         STORE SPACE(10) TO m->retper
         @ 7,41 GET m->retper PICTURE "@M 1¦ Quinc,2¦ Quinc,Siempre,Retroact,Cada Tanto";
            MESS me1+' Cu ndo se paga la Retenci¢n '+ALLTRIM(m->retencion)+' ?';
            COLO SCHE 8
         @ 8,41 GET m->retsac PICTURE "@M SI,NO";
            MESS me1+' '+ALLTRIM(m->retencion)+' se paga en SAC ?';
            COLO SCHE 8
         @ 9,41 GET m->retdes PICTURE "@M SI,NO";
            MESS me1+' '+ALLTRIM(m->retencion)+' se paga en despido ?';
            COLO SCHE 8
         READ
         IF m->retper='R'
            @ 10,41 GET m->retmes PICTURE "99" RANGE 1,13;
               MESS me1+' Retroactivo a qu‚ mes ?';
               COLO SCHE 8
            @ 11,41 GET m->retqui PICTURE "99" RANGE 1,2;
               MESS me1+' Retroactivo a qu‚ quincena de '+meses[mes]+' ?';
               COLO SCHE 8
            READ
         ELSE
            IF m->retper='C'
               @ 12,41 GET m->retvez PICTURE "99" RANGE 1,26;
                  MESS me1+' Cantidad de Per¡odos en que se paga por a¤o ?';
                  COLO SCHE 8
               @ 13,41 GET m->adicont PICTURE "99" RANGE 1,26;
                  MESS me1+' Posici¢n inicial del contador';
                  COLO SCHE 8
               READ
            ENDIF
         ENDIF
         @ 14,41 GET m->retvenc;
            PICTURE '@D';
            MESS me1+' Fecha tope de pago de la Retenci¢n '+ALLTRIM(m->retencion);
            COLO SCHE 8
         @ 15,41 GET m->retreset PICTURE "@M SI,NO";
            MESS me1+' Se borra de legajo despu‚s de cada liquidaci¢n ?';
            COLO SCHE 8
         READ
         ACTI SCREEN
         respuesta=0
         SELE janut
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
            DO infic WITH ' Empresa a la que pertenece la Retenci¢n '+ALLTRIM(m->retencion)+' ',RECCOUNT()
            filtro=respuesta
         ENDIF
         IF respuesta<>0
            GOTO filtro
            es=empresa
         ELSE
            es='Todas las empresas'
         ENDIF
         m->retempresa=filtro
         ACTI WIND win
         @ 16,41 SAY LEFT(es,20) COLO I/W
         SET MESS TO me1+'Grabando los datos ingresados'
         SELE ret
         APPE BLAN
         REPLACE retformmes WITH formmes
         REPLACE retformqui WITH formqui
         GATHER MEMVAR
         CLEA
      ELSE
         SET MESS TO 'Retenci¢n '+ALLTRIM(m->retencion)+' existe - ENTER para continuar'
         DO existe WITH ' Retenci¢n'
         DO WHILE INKEY()=0
         ENDDO
      ENDIF
   ELSE
      EXIT
   ENDIF
ENDDO
RELE WIND win,win1
RELE respu,formqui,formmes,es,filtro,fq
RELE ALL LIKE ret* EXCEPT retpop
@ 24,0 say space(80)
RETURN
