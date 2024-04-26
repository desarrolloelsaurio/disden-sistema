ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO elijan
IF jannro<>0
	do opthor
	do opccos
	f2=recc()
   DO opemp
   SET ORDER TO 2
   ff=recc()
   DO opdia
	f1=recc()
   @ 24,0 SAY PADC(" Tratando de solucionar el Problema ",80,"*") COLO SCHE 19
	dele for thor<1 .or. thor>f1
   dele for empleado<1 .or. empleado>ff
	dele for horas<=0
	dele for ccos<1 .or. ccos>f2
   SCAN
      SELE emp
      SEEK dia->legajo
      IF FOUND()
         SELE dia
         REPL empleado WITH RECNO('EMP')
      ELSE
         SELE dia
         DELE RECO RECNO()
      ENDIF
   ENDSCAN
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
