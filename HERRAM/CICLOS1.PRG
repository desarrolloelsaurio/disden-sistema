PARAMETER programa,LINEAS,CONOJO,EXTENSION
SET TALK OFF
IF EMPTY(PARAMETERS()) .OR. PROGRAMA='?'
	 CLEA
	 ? 'PROGRAMA   : CICLOS1'
	 ? 'USO        : GENERA DIBUJOS DE CICLOS, PONE NUMERO DE LINEAS Y EVALUA IFS '
	 ? 'PARAMETROS : PROGRAMA,LINEAS,CONJO,EXTRNSION'
	 ?
	 ? '             PROGRAMA  : CARACTER - EL NOMBRE DEL PROGRDIMIENTO A PROCESAR'
	 ? '             LINEAS    : LOGICA   - INCLUYE NUMERO DE LINEAS ? '
	 ? '             CONOJO    : LOGICA   - NUMERA LOS IFS CUYA LINEA TERMINA EN '
	 ? '                         DOBLE & OJO '
	 ? '             EXTENSION : CARACTER - LA EXTENSION DEL PROGRAMA GENERADO SI '
     ? '                         NO SE QUIERE LA EXTENSION .DIB'
ELSE
clea
x=""
for a=1 to 12
   x=x+chr(a)
endfor

exaant=set("exact")
set exact off

store "" to A
store '0' to cantif
STORE 0 TO RENGLON
fuente=programa+".prg"
? 'FUENTE:'+FUENTE
respaldo=programa+".bak"
copy file (fuente) to (respaldo)
IF !EMPTY(EXTENSION)
EXTENSION=UPPER(EXTENSION)
ENDIF
fuente=programa+IIF(!EMPTY(EXTENSION) .AND. LEFT(EXTENSION,3) # 'PRG','.'+ALLTRIM(LEFT(EXTENSION,3)),".dib")
SET TALK ON
DEFI WIND WIN FROM 0,40 TO 3,79 DOUB
ACTI WIND WIN
SET TALK WIND WIN
? 'SALIDA:'+FUENTE
erase (fuente)
Frespaldo=fOPEN(respaldo,0)
ffuente=fcreate(fuente,0)
? 'FUENTE:'+FUENTE
col='   '
do while !feof(frespaldo)
STORE RENGLON+1 TO RENGLON
   a=fgets(frespaldo)
   a=chrtran(a,x,"")
   a=alltrim(a)
   IF !EMPTY(A)
      b=upper(a)
      if b="IF " .OR. B="#IF"
				 if CONOJO .AND. right(a,3)='OJO'
            A=left(COL,len(col)-3)+' '+cantif+cantif+A
						=PONER()
            COL=left(col,len(col)-3)+' '+cantif+'    '
						cantif=chr(asc(cantif)+1)
				 else
            A=left(COL,len(col)-3)+' ÚÄ'+A
						=PONER()
            COL=left(col,len(col)-3)+' ³    '
				 endif
      ELSE
         if b="DO WH" .OR. b="SCAN"
            A=left(COL,len(col)-3)+' ÉÍ'+A
						=PONER()
            COL=left(COL,len(col)-3)+' º    '
         else
            if B="PRIN" .OR. B="DO CASE"
               A=left(COL,len(col)-3)+' ÕÍ'+A
							 =PONER()
               COL=left(COL,len(col)-3)+' Ø    '
            else
               if B="FOR "
                  A=left(COL,len(col)-3)+' ÖÄ'+A
									=PONER()
                  COL=left(COL,len(col)-3)+' ×    '
               else
                  IF B='ELSE' .OR. B='#ELS'
                     A=left(COL,len(col)-6)+' ÃÄ'+A
										 =PONER()
                  ELSE
                     IF B="ENDP" .OR. B="ENDC"
                        COL=left(COL,len(col)-6)+'   '
                        A=left(COL,len(col)-3)+' ÔÍ'+A
												=PONER()
                     ELSE
                        IF B="ENDF" .OR. B="NEXT"
                           COL=left(COL,len(col)-6)+'   '
                           A=left(COL,len(col)-3)+' ÓÄ'+A
													 =PONER()
                        ELSE
                           IF B='ENDS' .OR. B='ENDD'
                              COL=left(COL,len(col)-6)+'   '
                              A=left(COL,len(col)-3)+' ÈÍ'+A
															=PONER()
                           ELSE
                              IF B='ENDI' .OR. B="#END"
                                 COL=left(COL,len(col)-6)+'   '
                                 A=left(COL,len(col)-3)+' ÀÄ'+A
																 =PONER()
                              ELSE
                                 IF B="CASE "
                                    COL=left(COL,len(col)-3)
                                    A=LEFT(COL,LEN(COL)-3)+"<Ø>"+A
																		=PONER()
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
																			 =PONER()
                                    ELSE
                                       A=COL+A
																			 =PONER()
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
=FCLOSE(Ffuente)
=fclose(frespaldo)
RELE WIND WIN
set exact &exaant
CLEA
ENDIF
SET TALK OFF
RETURN
FUNCTION PONER
RETURN(fputs(ffuente,IIF(LINEAS,STR(RENGLON,5)+' : '+A,A)))
