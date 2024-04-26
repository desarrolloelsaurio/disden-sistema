********************************************************************************
*-- Programa: AGUINA.PRG
*-- Fecha   : 01/25/91 05:51pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LOS PROGRAMAS DE CALCULO DE AGUINALDO
********************************************************************************
ulpr=PROGRAM()
=CABPAN()
DO CASE
CASE BAR()=1
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro<>0
      DO calsac
      IF LASTKEY()<>27
         DO actagu
         IF LASTKEY()<>27
            DO opemp
            DO opsue
            IF quialiq=1
               css1=0
               css2=7
            ELSE
               css1=6
               css2=13
            ENDIF
            DEFI POPU caca1 FROM 5,40 MESSAGE ' L¡mites del C lculo ' SHADOW COLOR SCHE 3
            DEFI BAR 1 OF caca1 PROM ' \<Todos los Empleados'
            DEFI BAR 2 OF caca1 PROM ' \<Un Empleado'
            IF calsac='P'
               ON SELE POPU caca1 DO csac1 WITH css1,css2
            ELSE
               ON SELE POPU caca1 DO csac2 WITH css1,css2
            ENDIF
            ACTI POPU caca1
            RELE POPU caca1
         ENDIF
      ENDIF
   ENDIF
CASE BAR()=2
   DO opemp
   SELE emp
   SET ORDER TO ordlis
   DEFINE WINDOW win FROM 4,5 TO 21,62 DOUBLE TITL ' Verifica S.A.C. ' SHAD COLOR SCHE 8
   BROWSE FIELD legajo/R,apynom/R:20/H='Empleado',mejorsuel/H='Mejor Sueldo':p="9999999999.99",periodos:p="99" NOAPPEND NODELETE NOMENU WINDOW win
CASE BAR()=3
   DO opliq
   DO opemp
   DO opcat
   DO opTHOR
   DO opemp
   SELE liq
   DEFI POPU caca1 FROM 6,40 MESSAGE ' L¡mites para Generar Registro de S.A.C. ' SHADOW COLOR SCHE 3
   DEFI BAR 1 OF caca1 PROM ' \<Todos los Empleados'
   DEFI BAR 2 OF caca1 PROM ' \<Un Empleado'
   IF calsac='P'
      ON SELE POPU caca1 DO gsac1
   ELSE
      ON SELE POPU caca1 DO gsac2
   ENDIF
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=5
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro<>0
      DO opemp
      DO opsue
      STORE 'NO' TO sobrehab,sobreadi
      STORE mesaliq TO sobremes
      STORE quialiq TO sobrequi
      STORE 0 TO sobrepor
      @ 24,0 SAY PADC('Forma de C lculo del Retroactuvo',80,' ')
      DEFINE WINDOW fic FROM 7,0 TO 17,77 DOUBLE TITL ' Forma de C lculo del Retroactivo ' SHADOW COLOR SCHE 8
      ACTI WINDOW fic
      @ 1,1 SAY "CALCULA SOBRE HABERES ?     " GET sobrehab;
         MESS '[ESC] para Men£'
      @ 2,1 SAY "CALCULA SOBRE ADICIONALES ? " GET sobreadi;
         MESS '[ESC] para Men£'
      @ 4,1 SAY "MES BASE PARA CALCULO       " GET sobremes;
         MESS 'Mes sobre el que calcular  el retroactivo - [ESC] para Men£'
      @ 5,1 SAY "QUINCENA BASE PARA CALCULO  " GET sobrequi;
         MESS 'Quincena sobre la que calcular  el retroactivo - [ESC] para Men£'
      @ 7,1 SAY "PORCENTAJE DEL AJUSTE       " GET sobrepor PICT '9999.99';
         MESS 'Porcentaje del ajuste retroactivo - [ESC] para Men£'
      READ
      RELE WINDOW fic
      @ 24,0 SAY SPACE(80)
      IF LASTKEY()<>27 .AND. sobremes>0 .AND. sobremes<14 .AND. sobrequi>0 .AND. sobrequi<3 .AND. sobrepor>0
         IF sobreadi="SI" .OR. sobrehab='SI'
            DO opemp
            DO opsue
            DO kk1 WITH 7,20,"L¡mites del C lculo de Retroactividades"
            ON SELE POPU caca1 DO cretr
            ACTI POPU caca1
            RELE POPU caca1
         ENDIF
      ENDIF
   ENDIF
CASE BAR()=6
DO opjan
IF jannro=0
   DO elijan
ENDIF
IF jannro<>0
   DO opemp
   MAX=3
   DIME co[MAX]
   tt='Retroactivos calculados'
   co[1]='  Legajo  '
   co[2]=PADC("Empleado",30)
   co[3]=PADC("Retroactivo",acdigi)
   DO lretri
ENDIF
CASE BAR()=7
DO opjan
IF jannro=0
   DO elijan
ENDIF
IF jannro<>0
   DO opadi
   STORE 0 TO respuesta
   IF eliadi(" a Cargar Valores Retroactivos")<>0
      GOTO respuesta
      @ 24,0 SAY PADC(" Generando Registro de Retroactivo ",80,'*') COLO SCHE 19
      tiho=RECNO()
      DO opliq
      DO opemp
      SCAN
         rc=RECNO()
         IF emp.haberret+emp.adicret>0
            SELE liq
            APPE BLAN
            REPL empresa WITH emp.jan,legajo WITH emp.legajo,filtcon WITH 20,archivo WITH 'ADI',registro WITH tiho,unidad WITH emp.haberret+emp.adicret
            REPL fechaven WITH adi.adivenc,INFORMA WITH .F.,cencos WITH emp.ccos,empleado WITH RECNO("EMP")
            SELE emp
         ENDIF
         GOTO rc
      ENDSCAN
   ENDIF
ENDIF
ENDCASE
ulpr=PROGRAM()
RELE css1,css2
RETURN
