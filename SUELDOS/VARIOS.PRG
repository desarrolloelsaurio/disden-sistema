********************************************************************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 10/25/90 09:32pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LOS PROGRAMAS DE A/B/M/L VARIOS
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
@ 24,0 SAY PADC('Espere por Favor',80,' ')
DO CASE
CASE BAR()=1
   ulpr='ELIJAN'
   DO elijan
CASE BAR()=2
   ulpr='CCOS'
   DO opjan
   DO opccos
   SELE ccos
   DO grl WITH 4,8,'Men£ de Centros de Costo'
   ON SELE POPUP grl DO ccos
   ACTI POPUP grl
CASE BAR()=3
   ulpr='CONV'
   DO opcon
   SELE con
   DO grl WITH 5,8,'Men£ de Convenios'
   ON SELE POPUP grl DO CONV
   ACTI POPUP grl
CASE BAR()=4
   ulpr='CAT'
   DO opcon
   DO opcat
   SELE cat
   DO grl WITH 4,8,'Men£ de Categor¡as'
   DEFI BAR 10 OF grl PROM ' Actualizaci¢n \<Monto '
   DEFI BAR 11 OF grl PROM '------------------------' SKIP
   DEFI BAR 12 OF grl PROM ' Restaura \<Archivo'
   ON SELE POPUP grl DO cat
   ACTI POPUP grl
CASE BAR()=5
   ulpr='ESP'
   DO opesp
   SELE esp
   DO grl WITH 5,8,'Men£ de Especialidades'
   ON SELE POPUP grl DO esp
   ACTI POPUP grl
CASE BAR()=6
   ulpr='PAR'
   DO oppar
   SELE par
   DO grl WITH 9,8,'Men£ de Parentescos'
   ON SELE POPUP grl DO par
   ACTI POPUP grl
CASE BAR()=7
   ulpr='GAS'
   DO opjan
	=OPGAS()
   SELE gas
   DO grl WITH 10,8,'Men£ de Tipo de Adelanto'
   ON SELE POPUP grl DO gas
   ACTI POPUP grl
CASE BAR()=9
   ulpr='VAR'
   DO opvar
   SELE VAR
   DO grl WITH 10,8,'Men£ de Constantes de Liquidaci¢n'
   ON SELE POPUP grl DO VAR
   ACTI POPUP grl
CASE BAR()=11
   ulpr='THOR'
   DO opjan
   DO opvar
   DO opthor1
   SELE thor
   DO grl WITH 11,8,'Men£ de Tipo de Horas'
   ON SELE POPUP grl DO thor
   ACTI POPUP grl
   SELE thor
   USE
CASE BAR()=12
   ulpr='ADI'
   DO opjan
   DO opvar
   DO opadi
   DO grl WITH 10,10,'Men£ de Adicionales'
   ON SELE POPUP grl DO adi
   ACTI POPUP grl
CASE BAR()=13
   ulpr='RET'
   DO opjan
   DO opvar
   DO opret
   DO grl WITH 10,8,'Men£ de Retenciones'
   ON SELE POPUP grl DO ret
   ACTI POPUP grl
CASE BAR()=14
   ulpr='SAL'
   DO opsal
   DO grl WITH 8,8,'Men£ de Salario Familiar'
   DEFI BAR 10 OF grl PROM ' Actualizaci¢n \<Monto '
   DEFI BAR 11 OF grl PROM '------------------------' SKIP
   DEFI BAR 12 OF grl PROM ' Restaura \<Archivo'
   ON SELE POPUP grl DO sal
   ACTI POPUP grl
CASE BAR()=16
   DO backup
ENDCASE
RETURN
*: EOF: VARIOS.PRG
