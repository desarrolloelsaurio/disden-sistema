********************************************************************************
*-- Programa: ICUR.PRG
*-- Fecha   : 06/04/91 11:01am
*-- Version : g. reiner
*-- Notas   : INGRESA Curva
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   RESPUESTA='nada#3#60#Operaciones a Efectuar#3#\<Ingresa#A\<grega#\<Graba#\<Anula'
	=DEFPOP()
   ON SELE POPU nada DO resp1
   DEFI WIND win FROM icurr,icurc TO icurr+icurla,icurc+icuran TITL " Ingreso Curva " SHAD COLOR SCHE 8
   SELE cur
   STOR " Ingreso Curva - " TO me1
   STOR 17 TO COL
   STOR 0 TO kok
   DO WHIL .T.
      ACTI WIND win
      CLEA
      SCAT MEMV BLAN
      @ 1,2 SAY "Curvas" COLO SCHE 3
      @ 1,COL GET m.curva PICT "@!" MESS me1+'[ENTER] para Men£'
      READ
      IF LEN(ALLTRIM(m.curva))#0
         SELE cur
         SET DELE OFF
         SEEK m.curva
         SET DELE ON
         ACTI SCRE
         RELE curve
         DIME curve[19,3]
         FOR A=1 TO 19
            STORE SPACE(10) TO curve[a,1]
            STORE 0 TO curve[a,2],curve[a,3]
         ENDFOR
         IF FOUND()
            COPY TO ARRAY Curve FOR m.curva=curva
         ENDIF
         fincur=19
         DEFI WIND win1 FROM 0,icurc+icuran-5 TO 24,21+icurc+icuran TITL " Ingreso Curvas " SHAD COLOR SCHE 8
         ACTI WIND win1
				 DO MCUR
         DO WHILE .T.
            FOR A=1 TO fincur
               @ A+2,5 GET curve[a,2]   PICT '99.99'
               @ A+2,16 GET curve [a,3] PICT '999.99'
            ENDFOR
            CLEA GETS
            STORE 0 TO respuesta
            ACTI SCRE
            ACTI POPU nada
            ACTI WIND win1
            DO CASE
            CASE BAR()=1
               FOR A=1 TO 19
                  @ A+2,5  GET curve[a,2]  PICT '99.99'  MESS '[CTRL] Y - Borra'
                  @ A+2,16 GET curve [a,3] PICT '999.99' MESS '[CTRL] Y - Borra'
               ENDFOR
               READ
            CASE BAR()=2
               FOR A=1 TO fincur
                  @ A+2,5 GET curve[a,2]   PICT '99.99'  MESS '[CTRL] Y - Borra'
                  @ A+2,16 GET curve [a,3] PICT '999.99' MESS '[CTRL] Y - Borra'
               ENDFOR
               READ
            CASE BAR()=3
               ACTI SCRE
               do flok with "cur"
               @ 24,0 SAY PADC(espere,80,'*') COLO SCHE 19
               DELE FOR CURVA=M.CURVA
               STORE "" TO CTRL
               FOR A=1 TO 19
                  IF CURVE[A,2]#0 .AND. CURVE[A,3]#0
                     IF AT(STR(CURVE[A,2],10,2),CTRL)=0
                        CTRL=CTRL+STR(CURVE[A,2],10,2)
                        APPE BLAN
                        =repuse()
                        REPL CURVA WITH M.CURVA
                        REPL TALLE WITH CURVE[A,2]
                        REPL CANTIDAD WITH CURVE[A,3]
                     ENDIF
                  ENDIF
				ENDFOR
               UNLO IN CUR
               RELE WIND WIN1
               EXIT
            CASE BAR()=4
               RELE WIND win1
               EXIT
            ENDCASE
         ENDDO
      ELSE
         EXIT
      ENDIF
   ENDDO
   =IIF(EMPTY(kok),.T.,IAUD('ING '+ALLTRIM(STR(kok))+' Curvas'))
   RELE WIND WIN
   RELE POPU NADA
ELSE
=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
