do case
case bar()=1
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
case bar()=2
   STORE 0 TO jodesh1
   STORE SPACE(20) TO jamesh
   DEFINE WINDOW fic FROM 10,0 TO 14,77 DOUBLE TITL 'Fechas l¡mite para el Listado' SHADOW COLOR SCHE 8
   ACTI WINDOW fic
   @ 1,10 SAY "Mes a Listar " GET jodesh1 MESS 'Mes Inicial a Listar - [ESC] para Men£'
   READ
   RELE WIND fic
   IF LASTKEY()<>27 .AND. jodesh1<>0                 
      jodesh2=jodesh1
      DO opemp
      DO opsue
      DO kk1 WITH 8,25,'Tipo de Listado Hist¢rico de Sueldos'
      ON SELE POPU caca1 DO lhissi3
      ACTI POPU caca1
      RELE POPU caca1
    ENDIF
endcase
return

