********************************************************************************
*-- Programa: EMPF.PRG
*-- Fecha   : 11/03/90 01:05am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DE DATOS FAMILIARES EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=10
   DO kk WITH 13,30
   ON SELE POPU caca DO xempf
   ACTI POPU caca
CASE BAR()=7
   DEFI POPU caca FROM 8,38 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca PROM ' \<Listado Completo'
   DEFI BAR 2 OF caca PROM ' \<Por Parentesco'
   DEFI BAR 3 OF caca PROM ' \<Cumplea¤os'
   DEFI BAR 4 OF caca PROM ' \<Trabajan en la Empresa '
   ON SELE POPU caca DO lempfi
   ACTI POPU caca
CASE BAR()=8
   DEFI POPU caca FROM 8,38 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca PROM ' \<Muestra Ficha'
   DEFI BAR 2 OF caca PROM ' \<Listado Completo'
   DEFI BAR 3 OF caca PROM ' \<Por Parentesco'
   DEFI BAR 4 OF caca PROM ' \<Cumplea¤os'
   DEFI BAR 5 OF caca PROM ' \<Trabajan en la Empresa '
   ON SELE POPU caca DO lempfp
   ACTI POPU caca
OTHERWISE
   dijo=BAR()
   STORE 0 TO respuesta
   IF eliemp('a Procesar')<>0
      GOTO respuesta
      IF dijo=1
         DO iempf
      ELSE
         IF dijo=2
            DO cempf
         ELSE
            IF dijo=4
               DO bempf
            ELSE
               DO bempft
            ENDIF
         ENDIF
      ENDIF
   ENDIF
ENDCASE
RELE dijo
ulpr=PROGRAM()
RETURN
