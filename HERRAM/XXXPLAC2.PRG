SET TALK OFF
SET SAFE OFF
ON ERROR
CLEA
DIME PREVIO[3]
MAXPREV=3
PREVIO[1]='STORE PROGRAM() TO ULPR'
PREVIO[2]='STOR PROGRAM() TO ULPR'
PREVIO[3]='ULPR=PROGRAM()'
BUSCA="PROGRAM(),10"
REEMP="ULPR,10"
define popu nada from 0,0 prompt files like *.prg
SHOW POPU NADA
clea
psc=5
A=""
do while .t.
   STORE .F. TO CAMBIO
   fuente=alltrim(prmbar("nada",PSC))
   ? FUENTE
   if fuente#alltrim(program())
      if ESTAPREV(FUENTE) 
        IF esta(fuente)
      respaldo=left(fuente,len(fuente)-3)+"bak"
      copy file (fuente) to (respaldo)
      erase (fuente)
      Frespaldo=fOPEN(respaldo,0)
      ffuente=fcreate(fuente,0)
      do while !feof(frespaldo)
         a=fgets(frespaldo)
         px=at(UPPER(busca),UPPER(a))
         if px#0
            cc=STUFF(A,PX,LEN(BUSCA),REEMP)
            =fputs(ffuente,cc)
            STORE .T. TO CAMBIO
						? A
*					?? CHR(7)
						? CC
         else
            =fputs(ffuente,a)
         endif
      ENDdo
      =FCLOSE(Ffuente)
      =fclose(frespaldo)
      IF !CAMBIO
         ?? ' SIN CAMBIO'
         ERASE (FUENTE)
         RENAME (RESPALDO) to (FUENTE)
      ENDIF
   ENDIF
   endif
ENDIF
   psc=psc+1
ENDdo
RETURN
procedure esta
parameter chivoar
store .f. to salida
Frespaldo=fOPEN(chivoar,0)
do while !feof(frespaldo)
   a=fgets(frespaldo)
   px=at(alltrim(UPPER(busca)),alltrim(UPPER(a)))
   if px#0
      store .t. to salida
      exit
         endif
      ENDdo
      =fclose(frespaldo)
return(salida)
PROCEDURE ESTAPREV
parameter chivoar
store .f. to salida
Frespaldo=fOPEN(chivoar,0)
do while !feof(frespaldo) .AND. !SALIDA
   a=fgets(frespaldo)
	 FOR XX=1 TO MAXPREV
     IF !EMPTY(at(alltrim(UPPER(PREVIO[XX])),alltrim(UPPER(a))))
        store .t. to salida
        exit
     endif
	 ENDFOR
ENDdo
=fclose(frespaldo)
return(salida)
