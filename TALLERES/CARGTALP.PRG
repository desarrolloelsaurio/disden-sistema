#DEFINE TEX_CALC "CALCULANDO - ESPERE POR FAVOR" && TEX_CALC
PROCEDURE CARGTALP
           SELE TMP
           GO TOP
           ELTAL=TMP.TALLER
           ELNUM=TMP.NUMERO
           STORE 1 TO TOTCOR
           STORE NUL TO TOTCAN                 
           SCAN
              IF ELTAL#TMP.TALLER
                 M.CANTIDAD=M.TOTCAN
                 M.ORDENES=M.TOTCOR
                 M.TALCOD=M.ELTAL
                 =AGRABAR("TMP1")
                 ELTAL=TMP.TALLER
                 ELNUM=TMP.NUMERO                 
                 STORE 1 TO TOTCOR
                 STORE NUL TO TOTCAN                 
              ENDIF
              IF ELNUM#TMP.NUMERO
                 ELNUM=TMP.NUMERO
                 TOTCOR=TOTCOR+1
              ENDIF
              TOTCAN=TOTCAN+TMP.EEC-TMP.SSC
           ENDSCAN
           SELE TMP1
           REPL ALL TALLERES WITH SAYGRL(TMP1.TALCOD,"PER","TALCOD","PER.CLIENTE")
           CALC MAX(ORDENES) TO MAXOR
           CALC MAX(CANTIDAD) TO MAXCAN
	       =UNTALK()
	       =UNWORK()
           =WIN0()
           =REF()
           REN=4
           SCAN
           @ REN,0 SAY TALCOD
           @ REN,20 SAY REPL("X",ORDENES)
           ?? " ("
           ?? ALLTRIM(STR(ORDENES))+")"
           @ REN+1,0 SAY LEFT(TALLERES,18)
           @ REN+1,20 SAY REPL("°",INT(CANTIDAD*60/MAXCAN))
           @ REN+2,0 SAY REPL("-",20)
           @ REN+2,20 SAY REPL("Ä",60)
           FOR A=0 TO 59 STEP 10
           @ REN+2,A+20 SAY "Á"
           NEXT
           REN=REN+3
           IF REN>21
              =INKEY(0)
              CLEA
              =ref()
              REN=4
           ENDIF
           ENDSCAN
           =INKEY(0)           
           =RELEWIN("WIN")
RETURN