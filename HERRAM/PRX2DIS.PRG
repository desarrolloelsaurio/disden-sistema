PARAMETER PROYECTO,DRIVE
PRIVATE PROYECTO,DRIVE,A,CANTIDAD
set talk off
set esca on
IF FILE((PROYECTO))
   use (PROYECTO)
   STORE 200 TO CANTIDAD
   STORE 0 TO SUBDIR   
   go top
   skip
   scan while !eof()
      IF CANTIDAD=200
         SUBDIR=SUBDIR+1
         A=DRIVE+ALLTRIM(STR(SUBDIR))
         !MD &A
         DRIVE1=DRIVE+ALLTRIM(STR(SUBDIR))+'\'
         CANTIDAD=0
      ENDIF
      CANTIDAD=CANTIDAD+1
      a=alltrim(substr(name,rat('\',name)+1))
      ? ALLTRIM(NAME)
      ?? ' - '
      ?? DRIVE1+A
   	  COPY FILE (NAME) TO (DRIVE1+A)
   endscan
   use
ENDIF
RETURN
