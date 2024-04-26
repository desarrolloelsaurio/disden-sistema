SET TALK OFF
SET SAFE OFF
ON ERROR
CLEA
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
      respaldo=left(fuente,len(fuente)-3)+"bak"
      copy file (fuente) to (respaldo)
      erase (fuente)
      Frespaldo=fOPEN(respaldo,0)
      ffuente=fcreate(fuente,0)
      do while !feof(frespaldo)
         a=ALLTRIM(fgets(frespaldo))
         IF UPPER(LEFT(A,6))='IF ELI' .AND. RIGHT(A,4)=')#0'
            cc='IF !EMPTY('+SUBSTR(A,4)
            CC=LEFT(CC,LEN(CC)-3)+')'
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
   psc=psc+1
ENDdo
RETURN
