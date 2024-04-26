********************************************************************************
*-- Programa: acat.prg
*-- Fecha   : 01/12/91 07:10pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZACION DE MONTOS CATEGORIAS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   SELE con
   SET ORDER TO
   SELE cat
   SET RELA TO convenio INTO con
   DEFINE WINDOW win FROM 3,6 TO 22,73 DOUBLE TITL " Correcci¢n Categor¡as " SHAD COLOR SCHE 8
   BROWSE FIELD cat->categoria/R,con->convenio/R,sueldo,periodo=IIF(periodo='Q','Quin','Mens') FREEZE sueldo NOAPPEND NODELETE NOMENU WINDOW win
   SET RELA TO
   SELE con
   SET ORDER TO 1
   RELE WIND win
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicon(" a Actualizar")<>0
      GOTO respuesta
      fl=RECNO("con")
      STORE 0 TO respuesta
      STORE ' ' TO signo
      @ 24,0 SAY PADC("Ingrese el Monto o el Porcentaje a Actualizar",80,' ')
      DEFINE WINDOW fic FROM 10,0 TO 15,79 DOUBLE TITL " Monto o Porcentaje de Actualizaci¢n " SHAD COLOR SCHE 8
      ACTI WINDOW fic
      @ 1,2 SAY "Monto o Porcentaje ('0' PARA MENU) " GET respuesta PICTURE '9999999999.99'
      @ 2,2 SAY "Monto fijo o Porcentaje            " GET signo PICTURE "@M +,-,%"
      READ
      RELE WINDOW fic
      IF respuesta<>0
         SELE cat
         @ 24,0 SAY PADC("Actualizando Categor¡as",80,' ') COLOR I/W+
         IF signo='+'
            REPLACE ALL sueldo WITH sueldo+respuesta FOR convenio=fl
         ELSE
            IF signo='-'
               REPLACE ALL sueldo WITH sueldo-respuesta FOR convenio=fl
            ELSE
               REPLACE ALL sueldo WITH sueldo+sueldo*respuesta/100 FOR convenio=fl
            ENDIF
         ENDIF
      ENDIF
      RELE fl,signo
   ENDIF
CASE BAR()=3
   DO acat1
ENDCASE
@ 24,0 SAY SPACE(80)
RETURN
