***********************************
*                                 *
*    EL ARCHIVO *.TXT ES TEXTO    *
*    CON UNA LINEA POR RENGLON    *
*    CON LA PRIMERA POSICION X    *
*    CON LA SEGUNDA POSICION Y    *
*                                 *
***********************************
set talk off
USE (GETF('SCX',"Pantalla:")) ALIAS ESCRIN
errfile = FOPEN(GETF("TXT","Archivo de Texto:"))
IF errfile <= 0
   WAIT 'NO LO PUEDO ABRIR !!' WINDOW NOWAIT
ENDIF
defi wind tmp from 0,0 to 24,79 none
acti wind tmp
X=VAL(FGETS(errfile))
Y=VAL(FGETS(errfile))
DO WHILE !FEOF(errfile)
   SELE ESCRIN
   SCAT MEMV MEMO BLANK   
   M.EXPRESION=FGETS(errfile)
   M.OBJTYPE=5
   M.HPOS=Y
   M.VPOS=X
   M.HEIGHT=1
   DO WHILE .T.
      M.EXPRESION=ALLT(M.EXPRESION)
      ?M.EXPRESION
      M.POSICION=AT(SPACE(2),M.EXPRESION)
      IF EMPTY(M.POSICION)
         M.EXPR='"'+M.EXPRESION+'"'
         M.WIDTH=LEN(M.EXPR)-2
         INSERT INTO "ESCRIN" FROM MEMV
         EXIT
      ELSE
         M.EXPR='"'+LEFT(M.EXPRESION,M.POSICION-1)+'"'
      ENDIF
      M.WIDTH=LEN(M.EXPR)-2
      INSERT INTO "ESCRIN" FROM MEMV
****      @ M.VPOS, M.HPOS SAY EVAL(M.EXPR)
      M.EXPRESION=SUBS(M.EXPRESION,M.POSICION)
      M.HPOS=M.HPOS+M.POSICION-1+LEN(M.EXPRESION)-LEN(ALLT(M.EXPRESION))
   ENDDO   
   X=X+1
ENDDO
=FCLOSE(errfile)
*rele wind tmp
USE
