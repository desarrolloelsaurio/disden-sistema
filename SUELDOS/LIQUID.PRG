***********************************************************************
*-- Programa: LIQUID.PRG
*-- Fecha   : 12/15/90 07:42pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE LIQUIDACION DE SUELDOS Y JORNALES
***********************************************************************
ulpr=PROGRAM()
STORE BAR() TO punto
@ 24,0 SAY PADC('Espere por Favor',80,' ')
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
DO CASE
CASE BAR()=1 .OR. BAR()=2 .OR. BAR()=3
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opadi
      DO opcat
      DO opcon
      DO opesp
		=OPGAS()
      DO opliq
      DO opret
      DO opsal
      DO opthor
      DO opvar
      DO opemp
      IF BAR()=3
         DEFI POPU caca2 FROM 4,50 MESSAGE "L¡mites del C lculo" SHAD COLO SCHE 3
         DEFI BAR 1 OF caca2 PROM ' \<Un Empleado'
         DEFI BAR 2 OF caca2 PROM ' Por \<Centro de Costos '
         ON SELE POPU caca2 DO rliq
         ACTI POPU caca2
         RELE POPU caca2
      ELSE
         DO acredon
         DO cliq WITH punto
      ENDIF
   ENDIF
CASE BAR()=5
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opadi
      DO opcat
      DO opcon
      DO opesp
	  =OPGAS()
      DO opccos
      DO opret
      DO opsal
      DO opthor
      DO opvar
      DO opemp
      DO opliq
      DO kk1 WITH 7,15,'Rango del Listado por Pantalla'
      ON SELE POPU caca1 DO lliqp
      ACTI POPU caca1
      RELE POPU caca1
   ENDIF
CASE BAR()=6
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opadi
      DO opcat
      DO opcon
      DO opesp
		=OPGAS()
      DO opccos
      DO opret
      DO opsal
      DO opthor
      DO opvar
      DO opemp
      DO opliq
      DO kk1 WITH 5,15,'Rango del Listado por Impresora'
      DEFI BAR 7 OF caca1 PROM ' \<Desde'
      ON SELE POPU caca1 DO lliqi
      ACTI POPU caca1
      RELE POPU caca1
   ENDIF
case bar()=8
   DEFI POPU caca2 FROM 6,15 MESSAGE 'Emisi¢n de Cheques' SHADOW COLOR SCHE 3
   DEFI BAR 1 OF caca2 PROM ' \<Emisi¢n de Cheques'
   DEFI BAR 2 OF caca2 PROM ' \<Listado Cheques Emitidos '
   DEFI BAR 3 OF caca2 PROM ' \<Datos de los Cheques'
   DEFI BAR 4 OF caca2 PROM ' \<Alinea Impresora'
   on sele popu caca2 do che
   acti popu caca2
   rele popu caca2
CASE BAR()=10
   @ 24,0 SAY PADC(" Empresa que Generar  Hist¢rico ",80,' ') COLOR I/W*
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO ophis
      DO opemp
      DO opliq
      DO ghis
   ENDIF
CASE BAR()=11
	if confi(.t.,"CONFIRMA EFECTUAR FIN DE LIQUIDACION ")
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opthor
      DO opadi
      DO opret
      DO opsal
		=OPGAS()
      DO opliq
      DO opemp
      DO ACTLIQ
      IF LASTKEY()#27
      DO fliq
      ENDIF
   ENDIF
   ENDIF
CASE BAR()=13
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DEFINE WINDOW win FROM 10,0 TO 14,77 DOUBLE TITL ' Borrar Archivo de Liquidaci¢n de '+ALLTRIM(janname) SHAD COLOR SCHE 8
      @ 24,0 SAY PADC(" Cuidado con lo que Hace ! ",80,'*') COLOR I/W*
      ACTI WIND win
      respuesta='NO'
      @ 1,1 SAY 'Borra archivo de Liquidaci¢n ' GET respuesta PICTURE "@m NO,SI"
      READ
      IF respuesta='SI'
         ACTI SCRE
         @ 24,0 SAY PADC(" Borrando Archivo de Liquidaci¢n ",80,'*') COLOR I/W*
         DO opliq
         ZAP
      ENDIF
      RELE WIND win
   ENDIF
CASE BAR()=15
   IF jannro#0
      @ 24,0 SAY PADC(" Ordenando el Archivo de Liquidaci¢n ",80,'*') COLO SCHE 19
      SELE 15
      indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      A=PATH+'\'+indice
      USE &a
      INDEX ON legajo+STR(filtcon,2)+STR(registro,4) TO &indice
      USE
      DO opliq
   ENDIF
CASE BAR()=16
   DO problema
ENDCASE
RELE punto
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY SPACE(80)
ulpr=PROGRAM()
RETURN
