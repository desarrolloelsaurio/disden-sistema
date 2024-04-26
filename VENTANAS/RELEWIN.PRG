FUNCTION RELEWIN
PARAMETER WN
IF EMPTY(PARAMETER())
   WN=WONTOP()
ENDIF
#IF "Wind" $ VERS()
   RELE WIND (M.WN)
#ELSE
releno=relleno()
IF !EMPTY(WN) .AND. WEXIST(WN)
   PRIVATE WN,CW1,RW1,CW2,RW2,NUMERO,VEZ,A,B,LARGO
   IF LEN(SYS(17))=5
      M.CW1=WLCOL((M.WN))
      M.RW1=WLROW((M.WN))
      M.RW2=RW1+WROWS((M.WN))
      M.CW2=CW1+WCOLS((M.WN))
      M.NUMERO=INT(RAND()*8)+1
      DO CASE
      CASE M.NUMERO=8
         M.LARGO=M.CW2-M.CW1+1
         FOR B=0 TO 2
            FOR A=M.RW1+B TO M.RW2 STEP 3
               WN1='WIX0'+ALLTRIM(STR(A))
               DEFI WIND (WN1) FROM A,M.CW1 TO A,M.CW2+1 NONE
               ACTI WIND (WN1)
               @ 0,0,0,M.LARGO BOX REPL(releno,9) B+
            NEXT
         NEXT
         RELE WIND (M.WN)
         FOR A=M.RW1 TO M.RW2
            WN1='WIX0'+ALLTRIM(STR(A))
            RELE WIND (WN1)
         NEXT
      CASE M.NUMERO=7
         M.LARGO=M.RW2-M.RW1+1
         FOR B=0 TO 2
            FOR A=M.CW1+B TO M.CW2 STEP 3
               WN1='WIX0'+ALLTRIM(STR(A))
               DEFI WIND (WN1) FROM M.RW1,A TO M.RW2+1,A NONE
               ACTI WIND (WN1)
               @ 0,0,M.LARGO,0 BOX REPL(releno,9) B+
            NEXT
         NEXT
         RELE WIND (M.WN)
         FOR A=M.CW1 TO M.CW2
            WN1='WIX0'+ALLTRIM(STR(A))
            RELE WIND (WN1)
         NEXT
      CASE M.NUMERO=6
         =WIN01(M.RW2,-1,0)
      CASE M.NUMERO=5
         M.VEZ=25-M.RW1
         =WIN01(M.VEZ,1,0)
      CASE M.NUMERO=4
         M.VEZ=80-M.CW1
         =WIN01(M.VEZ,0,1)
      CASE M.NUMERO=3
         =WIN01(M.CW2,0,-1)
         OTHERWISE
         DO WHILE M.RW1<M.RW2-2 .OR. M.CW1<M.CW2-2
            M.RW1=M.RW1+IIF(M.RW1<M.RW2,1,0)
            M.RW2=M.RW2+IIF(M.RW2>M.RW1,-1,0)
            M.CW1=M.CW1+IIF(M.CW1<M.CW2,1,0)
            M.CW2=M.CW2+IIF(M.CW2>M.CW1,-1,0)
            ZOOM WIND (WN) NORM FROM M.RW1,M.CW1 TO M.RW2,M.CW2
         ENDDO
      ENDCASE
   ENDIF
   RELE WIND (M.WN)
ENDIF
#ENDIF
RETURN .T.
