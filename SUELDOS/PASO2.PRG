use c:\mientras\codigos
GOTO TOP
A=1
COD=CATEGORIA
SCAN
   IF CATEGORIA<>COD
      STORE 1 TO A
      STORE CATEGORIA TO COD
   ENDIF
   if a=1
      REPL CATEGORIA WITH ALLTRIM(proper(CATEGORIA))+' Inicial'
   else
      REPL CATEGORIA WITH ALLTRIM(Proper(CATEGORIA))+' '+alltrim(str(a*2-3))+' A '+alltrim(str(a*2-1))
   endif
   STORE A+1 TO A
ENDSCAN
RETURN
