******************************************************************************
*-- Programa: lhisi.prg
*-- Fecha   : 04/11/91 11:12am
*-- Version : g. reiner
*-- Notas   : deriva a las operaciones de listados hist¢ricos de conceptos
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
STORE BAR() TO tipo
DO opjan
IF jannro=0
   DO elijan
ENDIF
IF jannro<>0
   DO opemp
   DO opcat
   DO opcon
   DO opccos
   DO opthor
   DO opadi
   DO opret
   DO opsal
   DO ophis
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
      IF LASTKEY()<>27
         RELE WINDOW fic
         @ 24,0 SAY PADC(" Ordenando el Archivo ",80,"*") COLO SCHE 19
         DO CASE
         CASE BAR()=1
            STORE 0 TO respuesta
            IF &elija[quecosa]<>0
               SELE ali[quecosa]
               @ 24,0 SAY PADC(" Ordenando el Archivo ",80,"*") COLO SCHE 19
               GOTO respuesta
               IF jodesh1<=jodesh2
                  SELE his
                  IF jodesh1=jodesh2
                     IF jamesh='A'
                        INDEX ON legajo TO tmp FOR filtcon=filtco[quecosa] .AND. mes=jodesh1 .AND. registro=respuesta
                     ELSE
                        INDEX ON legajo TO tmp FOR filtcon=filtco[quecosa] .AND. registro=respuesta .AND. mes=jodesh1 .AND. quincena=VAL(jamesh)
                     ENDIF
                     GOTO TOP
                     IF .NOT. EOF()
                        DO lhisi1
                     ENDIF
                  ELSE
                     INDEX ON legajo+STR(mes,2)+STR(quincena,1) TO tmp FOR filtcon=filtco[quecosa] .AND. mes>=jodesh1 .AND. mes<=jodesh2 .AND. registro=respuesta
                     GOTO TOP
                     IF .NOT. EOF()
                        DO lhisi2
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
         CASE BAR()=2
            STORE 0 TO respuesta
            IF eliemp("a Listar")<>0
               GOTO respuesta
               STORE emp->legajo TO lgj
               @ 24,0 SAY PADC(" Ordenando el Archivo ",80,"*") COLO SCHE 19
               IF jodesh1<=jodesh2
                  SELE his
                  jamesh='A'
                  IF jodesh1=jodesh2
                     INDEX ON registro TO tmp FOR filtcon=filtco[quecosa] .AND. mes=jodesh1 .AND. legajo=lgj
                     GOTO TOP
                     IF .NOT. EOF()
                        DO lhisi3
                     ENDIF
                  ELSE
                     INDEX ON registro TO tmp FOR filtcon=filtco[quecosa] .AND. mes>=jodesh1 .AND. mes<=jodesh2 .AND. legajo=lgj
                     GOTO TOP
                     IF .NOT. EOF()
                        DO lhisi3
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
         CASE BAR()=3 .OR. BAR()=4
            @ 24,0 SAY PADC(" Ordenando el Archivo ",80,"*") COLO SCHE 19
            IF jodesh1<=jodesh2
               SELE his
               jamesh='A'
               IF jodesh1=jodesh2
                  INDEX ON registro TO tmp FOR filtcon=filtco[quecosa] .AND. mes=jodesh1
                  GOTO TOP
                  IF .NOT. EOF()
                     DO lhisi3
                  ENDIF
               ELSE
                  INDEX ON registro TO tmp FOR filtcon=filtco[quecosa] .AND. mes>=jodesh1 .AND. mes<=jodesh2
                  GOTO TOP
                  IF .NOT. EOF()
                     DO lhisi3
                  ENDIF
               ENDIF
            ENDIF
         CASE BAR()=5
            STORE 0 TO cn1,cn2
            STORE 0 TO respuesta
            IF eliret(" a Listar")<>0
               STORE respuesta TO cn1
               STORE 0 TO respuesta
               cn2=eliret(" a Listar")
               IF cn2=0
                  cn2=cn1
               ENDIF
               STORE SPACE(70) TO tt
               STORE 0 TO respuesta
               DEFINE WINDOW fic FROM 10,0 TO 15,79 DOUBLE TITL 'T¡tulo del Listado' COLOR SCHE 8
               ACTI WINDOW fic
               @ 1,10 SAY "INGRESE TITULO DEL LISTADO" COLOR SCHE 3
               @ 2,4 GET tt MESS 'T¡tulo del Listado - [ESC] para Men£'
               READ
               rele wind fic
               IF LASTKEY()<>27 .AND. .NOT. EMPTY(tt)
                  IF jodesh1<=jodesh2
                     @ 24,0 SAY PADC(" Ordenando el Archivo ",80,"*") COLO SCHE 19
                     sele his
                     IF jodesh1=jodesh2
                     	IF jamesh='A'
                        	INDEX ON legajo TO tmp1 FOR filtcon=30 .AND. mes=jodesh1 .AND. (registro=cn1 .OR. registro=cn2)
								else
                        	INDEX ON legajo TO tmp1 FOR filtcon=30  .AND. mes=jodesh1 .AND. quincena=VAL(jamesh) .AND. (registro=cn1 .OR. registro=cn2)
								endif
							ELSE
                        INDEX ON legajo TO tmp1 FOR filtcon=30 .AND. mes>=jodesh1 .AND. mes<=jodesh2 .AND. (registro=cn1 .OR. registro=cn2)
                     ENDIF
                     GOTO TOP
                     IF .NOT. EOF()
                        SELE emp
                        SET ORDER TO
                        DO opsue
                        SET RELA TO empleado INTO emp
                        IF jodesh1=jodesh2
                           INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. empleado<>0 .AND. haberret+adicret<>0
                        ELSE
                           INDEX ON emp->apynom TO tmp FOR mes>=jodesh1 .AND. mes<=jodesh2 .AND. empleado<>0 .AND. haberret+adicret<>0
                        ENDIF
                        GOTO TOP
                        IF .NOT. EOF()
                           IF cn1=cn2
                              STORE 0 TO cn2
                           ENDIF
                           DO lhisi5
                        ENDIF
                        SELE his
                        set index to
                        SELE sue
                        USE
                        DO opsue
                        SELE emp
                        USE
                        DO opemp
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
         case bar()=6
            do lhisi6 with 'T'
         case bar()=7
            DO LHISI6 WITH 'H'
         ENDCASE
         else
         rele wind fic
      ENDIF
      else
      rele wind fic
  ENDIF
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LHISI.PRG
