FUNCTION CLAVE
PARAMETER SALUDO
STORE .F. TO SALIDA
=RECUADRO(10,10,17,70)
IF SALUDO
   @ 2,0 say PADC("Buenos Dias !!!",WCOLS()-2)
ELSE
   @ 2,0 say PADC("Verificaci¢n de Clave",WCOLS()-2)
ENDIF
@ 4,10 say "Ingrese clave de acceso: "
store " " to CLAVE
store 1 to C
store 0 to XX
do while XX#13
   store inkey() to XX
   if XX=0
      loop
   endif
   store CLAVE+chr(XX) to CLAVE
   @ 4,C+36 say "X"
   store C+1 to C
enddo
if upper(CLAVE)#" MRCL"
   =CARTEL("ACCESO","DENEGADO","","CLAVE INCORRECTA")
ELSE
   STORE .T. TO SALIDA
endif
RELE WIND WIN
=MEN_LIN(SYSNOMBRE)
RETURN SALIDA
