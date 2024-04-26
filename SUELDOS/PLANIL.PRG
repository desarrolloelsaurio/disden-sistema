********************************************************
*-- Programa: PLANIL.PRG
*-- Fecha   : 01/05/91 07:50pm
*-- Version : G. REINER
*-- Notas   : DERIVA A PROGRAMAS DE LISTADOS Y PLANILLAS
********************************************************
ulpr=PROGRAM()
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
CASE BAR()=1
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
   DEFI POPU caca1 FROM 8,30 MESSAGE ' Tipo de Planilla de Sueldos y Jornales ' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca1 PROM ' Planilla \<Vertical '
   DEFI BAR 2 OF caca1 PROM ' Planilla \<Apaisada'
   DEFI BAR 3 OF caca1 PROM ' Apaisada \<C/Renglones '
   ON SELE POPU caca1 DO pla1
   ACTI POPU caca1
   RELE POPU caca1
   ENDIF
CASE BAR()=2
   DO opjan
   DO elijan
   IF jannro#0
      DO lplai WITH "C:\SUELDOS\PL"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'N'+RIGHT(ptn[jannro],1)+LEFT(janname,1)+'.TXT'
   ENDIF
CASE BAR()=4
   DO opcat
   DO opcon
   DO opccos
   DO opemp
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO kk2 WITH 5,30,'L¡mites del Listado'
      ON SELE POPU caca1 DO lsuei
      DEFI BAR 6 OF caca1 PROM ' \<Resumen'
      DEFI BAR 7 OF caca1 PROM ' Sobr\<es Negativos'
      ACTI POPU caca1
      RELE POPU caca1
   ENDIF
CASE BAR()=5
   DO opemp
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO lsuep
   ENDIF
CASE BAR()=7
   ulpr="LCAMI"
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opccos
      DO opcat
      DO opcon
      DO opemp
      DO kk2 WITH 7,30,'L¡mites del Listado de Cambios'
      ON SELE POPU caca1 DO lcami
      ACTI POPU caca1
      RELE POPU caca1
   ENDIF
CASE BAR()=8
   ulpr="PNOV"
   DEFI POPU caca1 FROM 8,30 MESSAGE ' Concepto para el Ingreso de Novedades ' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca1 PROM ' \<Horas Trabajadas'
   DEFI BAR 2 OF caca1 PROM ' \<Adicionales'
   DEFI BAR 3 OF caca1 PROM ' \<Retenciones'
   DEFI BAR 4 OF caca1 PROM ' \<Salario Familiar '
   ON SELE POPU caca1 DO pnov
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=9
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opemp
		=OPGAS()
      DO opliq
      DO ladei1
   ENDIF
CASE BAR()=11
   flag=.T.
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opcat
      DO opcon
      DO opesp
      DO opthor
      DO opvar
      DO opemp
      DO opliq
   DEFI POPU caca2 FROM 11,30 MESSAGE ' Tipo de Resumen de Horas ' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Listado \<Montos'
   DEFI BAR 2 OF caca2 PROM ' \<Listado \<Horas'
   DEFI BAR 3 OF caca2 PROM ' \<Resumen por C. Costo '
   ON SELECTION POPUP caca2 DO lhori5 WITH 10,'THOR','THOR.HORTIPOHOR','Horas Trabajadas ','ELITHOR(" a Listar")',9,'Tipo de Hora'
   ACTI POPU caca2
   RELE POPU caca2
   ENDIF
CASE BAR()=12
   flag=.F.
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opcat
      DO opcon
      DO opesp
      DO opret
      DO opADI
      DO opemp
      DO opliq
   DEFI POPU caca2 FROM 11,30 MESSAGE ' Tipo de Resumen de Adicionales ' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Listado \<Adicionales'
   DEFI BAR 2 OF caca2 PROM '------------------------' SKIP
   DEFI BAR 3 OF caca2 PROM ' \<Resumen por C. Costo '
   ON SELECTION POPUP caca2 DO lhori5 WITH 20,'ADI','ADI.ADITEXTO','Adicionales ','ELIADI(" a Listar")',10,"Adicional"
   ACTI POPU caca2
   RELE POPU caca2
  ENDIF
CASE BAR()=13
   flag=.F.
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opcat
      DO opcon
      DO opesp
      DO opret
      DO opADI
      DO opemp
      DO opliq
			DO LHORI9
  ENDIF
CASE BAR()=14
   flag=.F.
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opRET
      DO opcat
      DO opcon
      DO opesp
      DO opsal
      DO opemp
      DO opliq
   DEFI POPU caca2 FROM 11,30 MESSAGE ' Tipo de Resumen de Leyes Sociales ' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Listado \<Retenciones'
   DEFI BAR 2 OF caca2 PROM ' \<Resumen Retenciones por C. Costo '
   DEFI BAR 3 OF caca2 PROM ' Listado \<Aportes'
   DEFI BAR 4 OF caca2 PROM ' Res\<umen Aportes por C. Costo '
   DEFI BAR 5 OF caca2 PROM '----------------------------------' SKIP
   DEFI BAR 6 OF caca2 PROM ' \<Listado Especial'
   ON SELE POPU caca2 DO lhori6 WITH 30,'RET','RET.RETTEXTO','Retenciones ','ELIRET(" a Listar")',11,"Retenci¢n"
   ACTI POPU caca2
   RELE POPU caca2
   ENDIF
CASE BAR()=15
   flag=.T.
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opcat
      DO opcon
      DO opesp
      DO opSAL
      DO opvar
      DO opemp
      DO opliq
   DEFI POPU caca2 FROM 11,30 MESSAGE ' Tipo de Resumen de Salario Familiar ' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Listado \<Montos'
   DEFI BAR 2 OF caca2 PROM ' \<Listado \<Casos'
   DEFI BAR 3 OF caca2 PROM ' \<Resumen por C. Costo '
   ON SELECTION POPUP caca2 DO lhori5 WITH 40,'SAL','SAL.SALARIO','Salario Familiar ','ELISAL(" a Listar")',12,"Rubro"
   ACTI POPU caca2
   RELE POPU caca2
   ENDIF
CASE BAR()=17
      DO opadi
      DO opcat
      DO opcon
      DO opesp
		=OPGAS()
      DO opliq
      DO OPCCOS
      DO opret
      DO opsal
      DO opthor
      DO opvar
      DO opemp
   DEFI POPU caca2 FROM 17,30 MESSAGE ' Tipo de Minuta Contable ' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Minuta Tipo \<1'
   DEFI BAR 2 OF caca2 PROM ' Minuta Tipo \<2'
   DEFI BAR 3 OF caca2 PROM ' \<Planilla Control '
   ON SELECTION POPUP caca2 DO GMIN
   ACTI POPU caca2
   RELE POPU caca2
case bar()=19
   flag=.T.
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro#0
      DO opcat
      DO opcon
      DO opesp
      DO opSAL
      DO opvar
      DO opemp
      DO opliq
      DO CASPYMAR
   ENDIF
ENDCASE
ulpr=PROGRAM()
RETURN
