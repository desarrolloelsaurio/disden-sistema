PROCEDURE PRX2HD1
	PRIVATE DRIVE,A,CANTIDAD,messG,PREVESC,PREVDELE,PREVPATH,PREVTALK,FILELIK
	***** messages ***********************
	dime MESSG[7]
	MESSG[1]='PROJECT'
	MESSG[2]='DRIVE'
	MESSG[3]='DIRECTORY'
	MESSG[4]='SOURCE PROJECT TO TRANSFER'
	MESSG[5]=' NOW TRANSFERING '
	MESSG[6]='FILES LIKE '
	MESSG[7]=' AUTOTRANSFER '
	*************************************
	set talk off
	set esca on
	SET DELE ON
	SET PATH TO \SISTEMAS\HERRAM,\SISTEMAS\VENTANAS
	SET SAFE OFF
	clea
	=MOVECENT(0,0,7,70,"WIN",MESSG[7])
	@ 1,1 SAY MESSG[1]
	@ $+1,1 SAY MESSG[2]
	@ $+1,1 SAY MESSG[3]
	@ $+1,1 SAY MESSG[6]
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
			@ $+1,15 get driv
			read
			IF !EMPTY(DRIV)
				DRIVE=alltrim(DRIV)
				ACTI WIND WIN
				STORE SPACE(8) TO FILELIK
				@ $,15 SAY DRIVE
				@ $+1,15 GET FILELIK MESS "Files Like"
				read
				if !empty(filelik) .and. last()#27
					filelik=alltrim(filelik)
					use (PROYECTO)
					GO TOP
					S_DRIVE=LEFT(name,rat('\',name)-1)
					set path to (s_drive)
					skip
					defi wind batalan from 16,1 to 22,79 TITL MESSG[5]
					acti wind batalan
					scan while !eof()
						IF !DELE()
							a=alltrim(substr(name,rat('\',name)+1))
							if filelik=left(a,len(filelik))
								IF UPPER(TYPE)="P"
									? ALLTRIM(NAME)
									?? ' - '
									?? DRIVE+"\"+A
									COPY FILE (NAME) TO (DRIVE+"\"+A)
								ELSE
									IF UPPER(TYPE)="S" .OR. UPPER(TYPE)='R' .OR. UPPER(TYPE)='M'
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
								ENDIF
							ENDIF
						ENDIF
					ENDSCAN
					RELE WIND BATALAN
					USE
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	RELE WIND WIN
	SET PATH TO
	CLEA
RETURN
