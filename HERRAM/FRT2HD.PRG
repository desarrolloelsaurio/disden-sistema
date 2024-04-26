PROCEDURE FRT2HD
PRIVATE DRIVE,A,CANTIDAD,messG,PREVESC,PREVDELE,PREVPATH,PREVTALK
***** messages ***********************
dime MESSG[5]
MESSG[1]='PROJECT'
MESSG[2]='DRIVE'
MESSG[3]='DIRECTORY'
MESSG[4]='SOURCE PROJECT TO TRANSFER'
MESSG[5]=' NOW TRANSFERING '
*************************************
set talk off
set esca on
SET DELE ON
SET PATH TO \SISTEMAS\HERRAM,\SISTEMAS\VENTANAS
SET SAFE OFF
clea
DEFI WIND WIN FROM 0,0 TO 6,70 DOUB
=CENTWIN("WIN")
@ 1,1 SAY MESSG[1]
@ $+1,1 SAY MESSG[2]
@ $+1,1 SAY MESSG[3]
proyecto=getfile("pjx",MESSG[4])
IF !EMPTY(PROYECTO) .AND. LAST()#27
   @ 1,15 SAY PROYECTO
   @ $+1,15 GET DRIVE PICT 'X' DEFA " "
   READ
   IF LAST()#27 .AND. !EMPTY(DRIVE)
      * ACTI SCRE
      * HIDE WIND WIN
      *DRIV=GETDIR(DRIVE+":")
      driv=space(50)
      @ $,15 get driv
      read
      IF !EMPTY(DRIV)
         DRIVE=alltrim(DRIV)
         ACTI WIND WIN
         @ $+1,15 SAY DRIVE
         use (PROYECTO)
         GO TOP
         S_DRIVE=LEFT(name,rat('\',name)-1)
         set path to (s_drive)
         skip
         defi wind batalan from 16,1 to 22,79 TITL MESSG[5]
         acti wind batalan
         scan while !eof()
            IF !DELE() .AND. UPPER(TYPE)="R"
               a=alltrim(substr(name,rat('\',name)+1))
                     ? ALLTRIM(NAME)
                     ?? ' - '
                     ?? DRIVE+"\"+A
                     IF FILE(NAME) 
                        COPY FILE (NAME) TO (DRIVE+"\"+A)
                     ENDIF
                     ************************
                     * COPIA SPR DE EXISTIR *
                     ************************
                     FT=ALLTRIM(NAME)
                     FUT=LEFT(FT,LEN(FT)-2)+"PR"
                     IF UPPER(TYPE)="S" .AND. FILE(FUT)
                        AX=LEFT(A,LEN(A)-2)+"PR"                     
                        COPY FILE (FUT) TO (DRIVE+"\"+AX)
                     ENDIF
                     **************
                     * COPIA BASE *
                     **************
                     HDIR=ALLTRIM(OUTFILE)
                     HDIR=LEFT(HDIR,RAT("\",HDIR))
                     FT=HDIR+ALLTRIM(NAME)
                     EXT=IIF(UPPER(TYPE)="S","SC",IIF(UPPER(TYPE)="R","FR","MN"))+"X"
                     FT=LEFT(FT,LEN(FT)-3)+EXT
                     A=LEFT(A,LEN(A)-3)+EXT
                     IF FILE(FT)
                     COPY FILE (FT) TO (DRIVE+"\"+A)
                     ENDIF
                     ***************
                     * COPIA MEMOS *
                     ***************
                     A=LEFT(A,LEN(A)-1)+"T"
                     FT=LEFT(FT,LEN(FT)-1)+"T"
                     IF FILE(FT)                     
                     COPY FILE (FT) TO (DRIVE+"\"+A)
                     ENDIF
                  ENDIF

         ENDSCAN
         RELE WIND BATALAN
         USE
      ENDIF
   ENDIF
ENDIF
RELE WIND WIN
SET PATH TO
CLEA
RETURN
