PARAMETER programa
clea
x=""
for a=1 to 12
   x=x+chr(a)
endfor
A=""
store 0 to renglon
fuente=programa+".prg"
respaldo=programa+".bak"
copy file (fuente) to (respaldo)
fuente=programa+".dib"
erase (fuente)
Frespaldo=fOPEN(respaldo,0)
ffuente=fcreate(fuente,0)
? FUENTE
col='   '
do while !feof(frespaldo)
	 renglon=renglon+1
   a=fgets(frespaldo)
   a=chrtran(a,x,"")
   a=alltrim(a)
   IF !EMPTY(A)
      b=upper(a)
      if b="IF "
         A=left(COL,len(col)-3)+' ÚÄ'+A
         =ponga(a)
         COL=left(col,len(col)-3)+' ³    '
      ELSE
         if b="DO WH" .OR. b="SCAN"
            A=left(COL,len(col)-3)+' ÉÍ'+A
            =PONGA(A)
            COL=left(COL,len(col)-3)+' º    '
         else
            if B="PRIN" .OR. B="DO CASE"
               A=left(COL,len(col)-3)+' ÕÍ'+A
               =PONGA(A)
               COL=left(COL,len(col)-3)+' Ø    '
            else
               if B="FOR "
                  A=left(COL,len(col)-3)+' ÖÄ'+A
                  =PONGA(A)
                  COL=left(COL,len(col)-3)+' ×    '
               else
                  IF B='ELSE'
                     A=left(COL,len(col)-6)+' ÃÄ'+A
                     =PONGA(A)
                  ELSE
                     IF B="ENDP" .OR. B="ENDC"
                        COL=left(COL,len(col)-6)+'   '
                        A=left(COL,len(col)-3)+' ÔÍ'+A
                        =PONGA(A)
                     ELSE
                        IF B="ENDF" .OR. B="NEXT"
                           COL=left(COL,len(col)-6)+'   '
                           A=left(COL,len(col)-3)+' ÓÄ'+A
                           =PONGA(A)
                        ELSE
                           IF B='ENDS' .OR. B='ENDD'
                              COL=left(COL,len(col)-6)+'   '
                              A=left(COL,len(col)-3)+' ÈÍ'+A
                              =PONGA(A)
                           ELSE
                              IF B='ENDI'
                                 COL=left(COL,len(col)-6)+'   '
                                 A=left(COL,len(col)-3)+' ÀÄ'+A
                                 =PONGA(A)
                              ELSE
                                 IF B="CASE "
                                    COL=left(COL,len(col)-3)
                                    A=LEFT(COL,LEN(COL)-3)+"<Ø>"+A
                                    =PONGA(A)
                                    COL=COL+'   '
                                 ELSE
                                    IF B="EXIT" .OR. B="LOOP"
                                       COSA=""
                                       FOR S=LEN(COL) TO 1 STEP -1
                                          xx=SUBSTR(COL,S,1)
                                          IF xx#"º" .AND. xx#"×"
                                             if xx='³'
                                                cosa="Å"+cosa
                                             else
                                                COSA="Ä"+COSA
                                             endif
                                          ELSE
                                             EXIT
                                          ENDIF
                                       ENDFOR
                                       COSA='<'+COSA
                                       COSA=LEFT(COL,LEN(COL)-LEN(COSA))+COSA
                                       A=COsa+A
                                       =PONGA(A)
                                    ELSE
                                             A=COL+A
                                             =PONGA(A)
                                    endif
                                 ENDIF
                              ENDIF
                           endif
                        ENDIF
                     endif
                  endif
               ENDIF
            ENDIF
         ENDIF
      ENDIF
   ENDIF
ENDdo
? FCLOSE(Ffuente)
? fclose(frespaldo)
CLEA
RETURN
FUNCTION PONGA
PARAMETER XT
RETURN(fputs(ffuente,STR(RENGLON,5)+' : '+XT))
