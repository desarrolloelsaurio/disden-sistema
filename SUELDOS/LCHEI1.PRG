@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
STORE .t. TO SIGUE
IF M->CHEBA='Comercial Israelita'
	store 1 to bcook
else
   if m->cheba='Municipal de Rosario'
      store 2 to bcook
   else
		if m->cheba='Coinag'
			store 3 to bcook
		else
			if m->cheba='Provincial de Sta Fe'
			   store 4 to bcook
			else
				store .f. to sigue
			endif
		endif
	endif
endif
if sigue .and. m->CHEnu>0 .and. .not. empty(m->chefe)
	dime linea[4,5],tabes[4,7]
	*** banco comercial israelita
	linea[1,1]=3
	linea[1,2]=3
	linea[1,3]=1
	linea[1,4]=0
	linea[1,5]=1
	tabes[1,1]=59+TABULA
	tabes[1,2]=35+TABULA
	tabes[1,3]=39+TABULA
	tabes[1,4]=58+TABULA
	tabes[1,5]=22+TABULA
	tabes[1,6]=45+tabula
	tabes[1,7]=28+tabula
	*** banco municipal de rosario
	linea[2,1]=2
	linea[2,2]=3
	linea[2,3]=1
	linea[2,4]=1
	linea[2,5]=0
	tabes[2,1]=59+TABULA
	tabes[2,2]=35+TABULA
	tabes[2,3]=39+TABULA
	tabes[2,4]=60+TABULA
	tabes[2,5]=17+TABULA
	tabes[2,6]=38+tabula
	tabes[2,7]=16+tabula
	*** banco coinag
	linea[3,1]=1
	linea[3,2]=4
	linea[3,3]=1
	linea[3,4]=1
	linea[3,5]=1
	tabes[3,1]=59+TABULA
	tabes[3,2]=31+TABULA
	tabes[3,3]=37+TABULA
	tabes[3,4]=57+TABULA
	tabes[3,5]=23+TABULA
	tabes[3,6]=46+tabula
	tabes[3,7]=28+tabula
	*** banco provincial de santa fe
	linea[4,1]=2
	linea[4,2]=3
	linea[4,3]=1
	linea[4,4]=1
	linea[4,5]=1
	tabes[4,1]=56+TABULA
	tabes[4,2]=22+TABULA
	tabes[4,3]=24+TABULA
	tabes[4,4]=46+TABULA
	tabes[4,5]=17+TABULA
	tabes[4,6]=38+TABULA
	tabes[4,7]=17+tabula
ulpr=program()
DO WHILE .NOT. PRIN()
   DO impresor
   IF LAST()=27
      RETURN TO MASTER
   ENDIF
ENDDO
@ 24,0 SAY PADC('IMPRIMIENDO LOS CHEQUES REQUERIDOS - [TECLA] Interrumpe',80,'*') COLOR SCHE 19
ON KEY DO abpr
SET DEVICE TO PRINT
SET CONSOLE OFF
SET PRINTER ON
_PEJECT="NONE"
_PLINENO=0
_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{18}{18}'
	_PLENGTH=18
_PeCODE='{27}{64}'
_PLOFFSET=0
_RMARGIN=132
_PADVANCE="LINEFEEDS"
_PCOPIES=1
iom=str(day(chefe),2)
jodesh=meses[month(chefe)]
shana=RIGHT(str(year(chefe),4),2)
largo=130-tabes[bcook,6]
if m->cheno='SI'
	store linea[BCOOK,1]-1 to linea[BCOOK,1]
endif
PRINTJOB
   SCAN
	??? CHR(18)
		FOR A=1 TO linea[BCOOK,1]
			?
		NEXT
		if m->cheno='SI'
			? emp->legajo at tabula+2
		endif
		? STR(EMP->TOTAL,ACDIGI,2) AT TABES[BCOOK,1]
		FOR A=1 TO linea[BCOOK,2]
			?
		NEXT
		? iom AT TABES[BCOOK,2]
		?? jodesh AT TABES[BCOOK,3]
		?? shana AT TABES[BCOOK,4]
		FOR A=1 TO linea[BCOOK,3]
			?
		NEXT
		if m->cheno='SI'
			?
		else
			? alltrim(emp->apynom) at tabes[bcook,5]
		endif
		FOR A=1 TO linea[BCOOK,4]
			?
		NEXT
		tx=AUSS+' '+nux(emp->total)
		IF LEN(tx)<=largo
		   tx1=PADR(tx,largo,'*')
		   tx2=REPLICATE("*",largo)
		ELSE
		   FOR A=largo TO 1 STEP -1
      		IF SUBSTR(tx,A,1)=" "
		         tx1=PADR(LEFT(tx,A-1),largo,"*")
      		   tx2=PADR(SUBSTR(tx,A+1),largo,"*")
		         EXIT
      		ENDIF
		   NEXT
		ENDIF
		??? CHR(15)
		? tx1 at tabes[bcook,6]
		FOR A=1 TO linea[BCOOK,5]
			?
		NEXT
		? tx2 at tabes[bcook,7]
		repl emp->mejorsuel with chenu
		store chenu+1 to chenu
		eject page
   ENDSCAN
   EJECT PAGE
   ?
ENDP
SET DEVI TO SCRE
SET CONS ON
SET PRINT OFF
SET MESS TO
ON KEY LABEL shift-f1 DO hlp
_RMARGIN=80
_WRAP=.F.
RELE casos,largo,largoim
endif
@ 24,0 SAY SPACE(80)
RETURN
