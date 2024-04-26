SET TALK OFF
SET SAFE OFF
ON ERROR
CLEA
BUSCA='REPL(" ",'
REEMP="SPAC("
=ADIR(PIPO,'*.prg')
LARGOR=ALEN(PIPO,1)
A=""
FOR PSC=1 TO LARGOR
   STORE .F. TO CAMBIO
   fuente=alltrim(PIPO[PSC,1])
   ? FUENTE
   if fuente#alltrim(program()) .and. fuente#'INICIO.PRG'
      if esta(fuente)
         respaldo=left(fuente,len(fuente)-3)+"bak"
         copy file (fuente) to (respaldo)
         erase (fuente)
         Frespaldo=fOPEN(respaldo,0)
         ffuente=fcreate(fuente,0)
         do while !feof(frespaldo)
            a=fgets(frespaldo)
            px=atc(busca,a)
            if px#0
               cc=STUFF(A,PX,LEN(BUSCA),REEMP)
               =fputs(ffuente,cc)
               STORE .T. TO CAMBIO
               ? A
               *?? CHR(7)
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
ENDFOR
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
* EOF - INDENT
