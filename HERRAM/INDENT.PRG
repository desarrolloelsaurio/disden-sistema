PARAMETER M.PROGRAMA
clea
ultilet=''
x=""
for a=1 to 31
   x=x+chr(a)
NEXT
A=""
exaant=set("exact")
set exact off
SET BELL TO 5120,1
IF EMPTY(PARAMETER())
   m.programa=GETFILE("PRG","PROGRAMA A INDENTAR")
ENDIF
IF LAST()#27 .AND. !EMPTY(m.programa)
   m.programa=LEFT(m.programa,AT(".",m.programa)-1)
   fuente=m.programa+".prg"
   respaldo=m.programa+".bak"
   copy file (fuente) to (respaldo)
   erase (fuente)
   Frespaldo=fOPEN(respaldo,0)
   ffuente=fcreate(fuente,0)
   ? FUENTE
   col=0
   do while !feof(frespaldo)
      ultilet=right(a,1)
      a=fgets(frespaldo)
      a=alltrim(CHRtran(a,x,""))
      IF !EMPTY(A)
         if ultilet=';'
            if left(a,1)#"#"
               a='  '+space(col)+a
            endif
            ? fputs(ffuente,a)
         else
            b=upper(a)
            B7=LEFT(B,7)
            B5=LEFT(B,5)
            B4=LEFT(B,4)
            B3=LEFT(B,3)
            DO CASE
            CASE LEFT(B,1)="#"
               A=ALLTRIM(A)
               ? fputs(ffuente,a)
            CASE B5="DO WH" .or. ;
                 B3="IF " .OR. ;
                 B4="FOR " .OR. ;
                 B4="SCAN" .OR. ;
                 B4="PRIN" .OR. ;
                 B7="DO CASE" .OR. ;
                 B5='TEXT '
               SET BELL TO LEN(A)*10,1
               ? chr(7)
               A=SPACE(COL)+A
               ? fputs(ffuente,a)
               COL=COL+3
            CASE B='ELSE'
               SET BELL TO LEN(A)*10,1
               ? chr(7)
               A=SPACE(COL-iif(col<3,0,3))+A
               ? fputs(ffuente,a)
            CASE B="END" .OR. B="NEXT"
               SET BELL TO LEN(A)*10,1
               ? chr(7)
               COL=COL-iif(col<3,0,3)
               A=SPACE(COL)+A
               ? fputs(ffuente,a)
            CASE  B="CASE " .or. B="OTHE" .OR. B="OTHERWISE"
               SET BELL TO LEN(A)*10,1
               ? chr(7)
               COL=COL-iif(col<3,0,3)
               A=SPACE(COL)+A
               ? fputs(ffuente,a)
               COL=COL+3
            OTHERWISE
               A=SPACE(COL)+A
               ? fputs(ffuente,a)
            ENDCASE
         endif
      else
         ? fputs(ffuente," ")
      ENDIF
   ENDdo
   ? FCLOSE(Ffuente)
   ? fclose(frespaldo)
ENDIF
set exact &exaant
CLEA
RETURN
