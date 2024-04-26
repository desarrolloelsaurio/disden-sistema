PROCEDURE XXXPLAC3
SET SAFE OFF
ON ERROR
CLEA
yx=""
for a=1 to 12
   yx=yx+chr(a)
endfor
MAXPREV=2
DIME PREVIO[MAXPREV]
PREVIO[1]="DO WHILE INKEY()=0"
PREVIO[2]="ENDD"
REEMP="=INKEY(0,'HM')"

=ADIR(PIPO,'*.prg')
LARGOR=ALEN(PIPO,1)
A=""
FOR PSC=1 TO LARGOR
   STORE .F. TO CAMBIO
   fuente=alltrim(PIPO[PSC,1])
   ? FUENTE
   if fuente#alltrim(program())
      if ESTAPREV(FUENTE)
         respaldo=left(fuente,len(fuente)-3)+"bak"
         copy file (fuente) to (respaldo)
         erase (fuente)
         Frespaldo=fOPEN(respaldo,0)
         ffuente=fcreate(fuente,0)
         do while !feof(frespaldo)
            a=fgets(frespaldo)
         a=chrtran(a,yx,"")
   a=alltrim(a)
            IF UPPER(ALLTRIM(A))=UPPER(PREVIO[1])
               OK=1
               FOR XXX=2 TO MAXPREV
                  a=fgets(frespaldo)
                  IF UPPER(ALLTRIM(A))=upper(PREVIO[XXX])
                     OK=OK+1
                  ENDIF
               ENDFOR
               IF OK=MAXPREV
                 =FPUTS(FFUENTE,REEMP)
               ENDIF
            else
               =fputs(ffuente,a)
            endif
         ENDdo
         =FCLOSE(Ffuente)
         =fclose(frespaldo)
      ENDIF
   ENDIF
next
RETURN
PROCEDURE ESTAPREV
parameter chivoar
store .f. to salida
STORE 1 TO OK
Frespaldo=fOPEN(chivoar,0)
do while !feof(frespaldo) .AND. !SALIDA
   a=chrtran(alltrim(fgets(frespaldo)),yx,'')
   IF UPPER(A)=UPPER(PREVIO[ok])
      OK=OK+1
      IF OK=MAXPREV
        STORE .T. TO SALIDA
        EXIT
     ENDIF
  endif
ENDdo
=fclose(frespaldo)
return(salida)
