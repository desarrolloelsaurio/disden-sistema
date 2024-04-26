COSA=GETFILE("PJX","PROYECTO A ANALIZAR")
IF LAST()#27 .AND. !EMPTY(COSA)
   IF FILE('INFORME.TXT')
      ERASE INFORME.TXT
   ENDIF
   FRESULTADO=FCREATE('INFORME.TXT')
   CNT=2
   USE (COSA)
   SET DELE ON
   SKIP
   SCAN WHILE !EOF()
      A=NAME
      A=SUBSTR(NAME,RAT('\',NAME)+1)
      IF LEFT(A,2)='OP'
         CNT=CNT+1
         fuente=alltrim(NAME)
         Frespaldo=fOPEN(FUENTE,0)
         do while !feof(frespaldo)
            A=FGETS(FRESPALDO)
            IF 'SELE' $ A
               IF !('ON SELE' $ A)
                  NRO=CHRTRAN(A,'SELECT ','')
                  IF VAL(NRO)>0
                     NRO=STR(VAL(NRO),3)
                     A=ALLTRIM(FGETS(FRESPALDO))
                     IF LEFT(A,3)='USE'
                        DO GRABA
                     ELSE
                        A=ALLTRIM(FGETS(FRESPALDO))
                        DO GRABA
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
         ENDdo
         ? fclose(frespaldo)
      ENDIF
   ENDS
   ? FCLOSE(FRESULTADO)
   CLOSE ALL
   FRESULTADO=FOPEN('INFORME.TXT')
   DIME TEXTO[CNT]
   STORE '' TO TEXTO
   PUNTERO=1
   DO WHILE !FEOF(FRESULTADO)
      TEXTO[PUNTERO]=FGETS(FRESULTADO)
      ? TEXTO[PUNTERO]
      PUNTERO=PUNTERO+1
   ENDDO
   =ASORT(TEXTO)
   IF FILE('INFORME.DOC')
      ERASE INFORME.DOC
   ENDIF
   ? FCLOSE(FRESULTADO)
   FRESULTADO=Fcreate('INFORME.DOC')
   clea
   FOR X=1 TO CNT
      IF !EMPTY(TEXTO[X])
         =FPUTS(FRESULTADO,TEXTO[X])
      ENDIF
   ENDFOR
   =FCLOSE(FRESULTADO)
ENDIF
RETURN
PROCEDURE GRABA
APODO=ALLTRIM(SUBSTR(A,AT('ALIAS',A)+6))
=FPUTS(FRESULTADO,NRO+' - '+APODO+' / '+FUENTE)
RETURN
