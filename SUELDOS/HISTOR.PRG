********************************************************************************
*-- Programa: histor.prg
*-- Fecha   : 01/22/91 05:19pm
*-- Version : g. reiner
*-- Notas   : deriva a las operaciones de listados hist¢ricos
********************************************************************************
ulpr=PROGRAM()
@ 0,0 SAY REPLICATE("Û",80) COLOR W
@ 0,1 SAY 'Sueldos y Jornales' COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,58 SAY '|'
@ 0,60 SAY LEFT(janname,19) COLOR I
quecosa=BAR()
DO CASE
CASE BAR()=5
*   STORE 0 TO jodesh1,jodesh2
 *  STORE SPACE(20) TO jamesh
 *  DEFINE WINDOW fic FROM 10,0 TO 16,77 DOUBLE TITL 'Fechas l¡mite para el Listado' SHADOW COLOR SCHE 8
 
 *  ACTI WINDOW fic
 *  @ 3,10 SAY "Quincena a Listar      " GET jamesh
 *  CLEA GETS
 *  @ 1,10 SAY "Mes a Inicial a Listar " GET jodesh1 MESS 'Mes Inicial a Listar - [ESC] para Men£'
 *  @ 2,10 SAY "Mes a Final a Listar   " GET jodesh2 MESS 'Mes Final a Listar - [ESC] para Men£'
 *  READ
 *  IF LASTKEY()<>27 .AND. jodesh1<>0 .AND. jodesh2<>0
 *     IF jodesh1=jodesh2
 *        @ 3,10 SAY "Quincena a Listar      " GET jamesh PICT '@m 1¦ Quincena,2¦ Quincena,Ambas Quincenas'
 *        READ
 *     ELSE
 *        STORE 'A' TO jamesh
 *     ENDIF
 *     RELE WIND fic
 *     IF LASTKEY()<>27
 *        DO opemp
 *        DO opsue
 *        DO kk1 WITH 6,35,'Tipo de Listado Hist¢rico de Sueldos'
 *        ON SELE POPU caca1 DO lhissi
 *        ACTI POPU caca1
 *        RELE POPU caca1
 *     ENDIF
 *     else
 *     rele wind fic
 *  ENDIF
   STORE 0 TO jodesh1,jodesh2
   STORE SPACE(20) TO jamesh
   DEFINE WINDOW fic FROM 10,0 TO 16,77 DOUBLE TITL 'Fechas l¡mite para el Listado' SHADOW COLOR SCHE 8
   ACTI WINDOW fic
   @ 3,10 SAY "Quincena a Listar      " GET jamesh
   CLEA GETS
   @ 1,10 SAY "Mes a Inicial a Listar " GET jodesh1 MESS 'Mes Inicial a Listar - [ESC] para Men£'
   @ 2,10 SAY "Mes a Final a Listar   " GET jodesh2 MESS 'Mes Final a Listar - [ESC] para Men£'
   READ
   IF LASTKEY()<>27 .AND. jodesh1<>0 .AND. jodesh2<>0
      IF jodesh1=jodesh2
         @ 3,10 SAY "Quincena a Listar      " GET jamesh PICT '@m 1¦ Quincena,2¦ Quincena,Ambas Quincenas'
         READ
      ELSE
         STORE 'A' TO jamesh
      ENDIF
      RELE WIND fic
      IF LASTKEY()<>27
         DO opemp
         DO opsue
         DO kk1 WITH 6,35,'Tipo de Listado Hist¢rico de Sueldos'
         ON SELE POPU caca1 DO lhissi1
         ACTI POPU caca1
         RELE POPU caca1
      ENDIF
      else
      rele wind fic
   ENDIF
case bar()=6
   STORE 0 TO jodesh1,jodesh2
   STORE SPACE(20) TO jamesh
   DEFINE WINDOW fic FROM 10,0 TO 16,77 DOUBLE TITL 'Fechas l¡mite para el Listado' SHADOW COLOR SCHE 8
   ACTI WINDOW fic
   @ 3,10 SAY "Quincena a Listar      " GET jamesh
   CLEA GETS
   @ 1,10 SAY "Mes a Inicial a Listar " GET jodesh1 MESS 'Mes Inicial a Listar - [ESC] para Men£'
   READ
   IF LASTKEY()<>27 .AND. jodesh1<>0
      @ 3,10 SAY "Quincena a Listar      " GET jamesh PICT '@m 1¦ Quincena,2¦ Quincena,Ambas Quincenas'
      READ
      RELE WIND fic
      IF LASTKEY()<>27
         DO opemp
				 do opthor
					DO OPADI
					DO OPRET
					DO OPSAL
					DO OPHIS
				 do lhisi7
      ENDIF
      else
      rele wind fic
   ENDIF
CASE BAR()=8
OTHERWISE
   RELE cosa
   DIME cosa[4],filtco[4],elija[4],ali[4],titu[4],vrb[4]
   cosa[1]=' \<Tipo de Hora'
   cosa[2]=' \<Adicional'
   cosa[3]='a \<Retenci¢n-Aporte'
   cosa[4]=' \<Rubro'
   filtco[1]=10
   filtco[2]=20
   filtco[3]=30
   filtco[4]=40
   elija[1]='Elithor(" a Listar")'
   elija[2]='Eliadi(" a Listar")'
   elija[3]='Eliret(" a Listar")'
   elija[4]='Elisal(" a Listar")'
   ali[1]=9
   ali[2]=10
   ali[3]=11
   ali[4]=12
   titu[1]='Horas Trabajadas'
   titu[2]='Adicionales'
   titu[3]='Retenciones-Aportes'
   titu[4]='Salario Familiar'
   vrb[1]='THOR->HORTIPOHOR'
   vrb[2]='ADI->ADICIONAL'
   vrb[3]='RET->RETENCION'
   vrb[4]='SAL->SALARIO'
   DEFI POPU caca2 FROM 3+quecosa,25 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un'+cosa[quecosa]+' '
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Completo '+titu[quecosa]+' '
   IF quecosa=4
      DEFI BAR 4 OF caca2 PROM ' Listado \<Completo Casos'
   ELSE
      IF quecosa=1
         DEFI BAR 4 OF caca2 PROM ' Listado \<Completo Cantidades'
         DEFI BAR 5 OF caca2 PROM '-------------------------------------' skip
         DEFI BAR 6 OF caca2 PROM ' Res\<umen Montos por Centro de Costos '
         DEFI BAR 7 OF caca2 PROM ' Resume\<n Horas por Centro de Costos'
      ELSE
         IF quecosa=3
            DEFI BAR 4 OF caca2 PROM REPL('-',LEN('  Listado Completo '+titu[quecosa])) skip
            DEFI BAR 5 OF caca2 PROM ' Listado E\<special'
         ENDIF
      ENDIF
   ENDIF
   ON SELECTION POPUP caca2 DO lhisi
   ACTI POPU caca2
   RELE POPU caca2
ENDCASE
ulpr=PROGRAM()
@ 24,0 SAY SPACE(80)
RETURN
