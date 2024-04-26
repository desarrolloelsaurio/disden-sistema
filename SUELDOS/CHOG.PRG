********************************************************************************
*-- Programa: chog.prg
*-- Fecha   : 02/16/91 04:07pm
*-- Version : g. reiner
*-- Notas   : Deriva a Correcci¢n de Horas Trabajadas por Concepto
*--           DO CHOG WITH '9','Horas Trabajadas','THOR->HORTIPOHOR','ELITHOR(" a Corregir")','OPTHOR',10
********************************************************************************
PARAMETER pm1,pm2,pm3,pm4,pm5,pm6
ulp=ulpr
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO chor WITH pm1,pm2,pm3
CASE BAR()=2
   @ 24,0 SAY PADC("Ordenando el Archivo de Liquidaci¢n",80) COLO SCHE 19
   STORE 0 TO respuesta
   IF &pm4<>0
      GOTO respuesta
      cs=respuesta
      SELE emp
      SET ORDER TO
      SELE VAL(pm1)
      SET ORDER TO
      SELE liq
      IF ulp='ADELAN'
         INDEX ON legajo TO tmp FOR filtcon>pm6 .AND. registro=cs
      ELSE
         INDEX ON legajo TO tmp FOR filtcon=pm6 .AND. registro=cs
      ENDIF
		goto top
		if .not. eof()
      	SET RELA TO registro INTO VAL(pm1)
      	SET RELA TO empleado INTO emp ADDI
      	DEFINE WINDOW win FROM 3,0 TO 22,79 DOUBLE TITL ' Correcci¢n '+pm2+' ' SHAD COLOR SCHE 8
      	BROWSE FIELD emp->legajo/R,emp->apynom/R:20,&pm3/R,unidad,fechaven NOAPPEND NODELETE NOMENU WINDOW win
		endif
	   SELE VAL(pm1)
		USE
		DO (PM5)
   ENDIF
   SET RELA TO
   SELE emp
   SET ORDER TO ordlis
CASE BAR()=4
   DO chor3 WITH pm1,pm2,pm3
CASE BAR()=5
   @ 24,0 SAY PADC("Ordenando el Archivo de Liquidaci¢n",80) COLO SCHE 19
   STORE 0 TO respuesta
   IF &pm4<>0
      GOTO respuesta
      SELE emp
      SET ORDER TO
      SELE VAL(pm1)
      dx=NDX(VAL(pm1))
      SELE liq
      INDEX ON legajo TO tmp FOR filtcon=pm6 .AND. registro=RECNO(VAL(pm1))
		goto top
		if .not. eof()
      	SET RELA TO registro INTO VAL(pm1)
      	SET RELA TO empleado INTO emp ADDI
      	DEFINE WINDOW win FROM 3,0 TO 22,79 DOUBLE TITL ' Correcci¢n '+pm2+' ' SHAD COLOR SCHE 8
      	BROWSE FIELD emp->legajo/R,emp->apynom/R:20,&pm3/R,valor1:H="Monto Especial",fechaven NOAPPEND NODELETE NOMENU WINDOW win
		endif
	   SELE VAL(pm1)
   	SET INDEX TO &dx
   ENDIF
   SET RELA TO
   SELE emp
   SET ORDER TO ordlis
ENDCASE
SELE liq
indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
SET INDEX TO &indice
@ 24, 0 SAY SPACE(80)
RELE ulp
RETURN
*: EOF: CHOG.PRG
