CLOSE ALL
SET FULL ON
SET TALK OFF
SET SAFE OFF
DO WHILE .T.
   STORE 0 TO M.BORRADO
   DIRNUEVO=GETD("","Subdirectorio que Contiene los Iconos Nuevos")
   IF LAST()#27 .AND. !EMPTY(DIRNUEVO)
      DIREXISTE=GETD("","Subdirectorio que Contiene los Iconos")
      IF LAST()#27 .AND. !EMPTY(DIREXISTE) .AND. DIRNUEVO#DIREXISTE
         IF !EMPTY(ADIR(DIRSCAN,(DIREXISTE+"*."),"D"))
            ****************************
            ***** CARGA ICONOS A REVISAR
            ****************************
            IF !EMPTY(ADIR(PIPO,(DIRNUEVO+"*.ICO")))
               CREATE CURSOR TEMPORAL ;
                 (ARCHIVO C(12),;
                 LARGO N(10),;
                 CONTENIDO M)
               APPE FROM ARRAY PIPO
               SCAN
                  ICOA=fOPEN((DIRNUEVO+"\"+ALLTRIM(ARCHIVO)),0)
                  REPL CONTENIDO WITH fREAD(ICOA,LARGO)
                  =FCLOSE(ICOA)
               ENDSCAN
               ****************************
               FOR A=3 TO ALEN(DIRSCAN,1)
                  ELDNUE=DIREXISTE+ALLTRIM(DIRSCAN[A,1])+"\"
                  WAIT "BUSCANDO EN DIRECTORIO "+ELDNUE WIND NOWA
                  IF !EMPTY(ADIR(PINUE,(ELDNUE+"*.ICO")))
                     CREATE CURSOR TEMPONUE ;
                       (ARCHIVO C(12),;
                       LARGO N(10),;
                       CONTENIDO M)
                     APPE FROM ARRAY PINUE
                     SCAN
                        ICOA=fOPEN((ELDNUE+"\"+ALLTRIM(ARCHIVO)),0)
                        REPL CONTENIDO WITH fREAD(ICOA,LARGO)
                        =FCLOSE(ICOA)
                     ENDSCAN
                     *******
                     SELE TEMPORAL
                  STORE .F. TO M.PASO                     
                     SCAN FOR !EMPTY(ARCHIVO)
                     STORE .T. TO M.PASO
                        SELE TEMPONUE
                        SCAN FOR !EMPTY(ARCHIVO)
                           IF TEMPORAL.LARGO=TEMPONUE.LARGO
                              IF TEMPORAL.CONTENIDO=TEMPONUE.CONTENIDO
                                 CLEA
                                 WAIT TEMPORAL.ARCHIVO+" ES IGUAL A "+TEMPONUE.ARCHIVO WIND NOWA
                                 @ 10,10 SAY (DIRNUEVO+TEMPORAL.ARCHIVO) BITMAP
                                 @ 10,30 SAY (ELDNUE+TEMPONUE.ARCHIVO) BITMAP
                                 @ 13,1 SAY DIRNUEVO+TEMPORAL.ARCHIVO
                                 @ 13,40 SAY ELDNUE+TEMPONUE.ARCHIVO
                                 ERASE (DIRNUEVO+TEMPORAL.ARCHIVO)
                                 REPL TEMPORAL.ARCHIVO WITH " "
                                 STORE BORRADO+1 TO BORRADO
                                 WAIT STR(BORRADO)+" ICONOS BORRADOS" WIND NOWA
                                 EXIT
                              ENDIF
                           ENDIF
                        ENDSCAN
                        SELE TEMPORAL
                     ENDSCAN
                     IF !PASO
                     		EXIT
                     ENDIF
                  ENDIF
                  WAIT STR(BORRADO)+"ICONOS BORRADOS" WIND NOWA
                   IF USED("TEMPONUE")
                  SELE TEMPONUE
                  USE
                  ENDIF
            NEXT
               ENDIF            
         ENDIF
   ENDIF
ELSE
   EXIT
ENDIF
ENDDO
