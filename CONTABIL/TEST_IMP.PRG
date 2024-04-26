*
*                           TESTEO DE LA IMPRESORA
*
* TEST_IMP.PRG
*
if getenv("EQUIPO")="MICASA" .AND. !PRIN()
   set printer to (sys(3)+".txt")
   RETURN .T.
ENDIF   
do while !PRIN()
	 =CARTEL("ENCIENDA LA IMPRESORA",;
	 "ACOMODE EL PAPEL",;
	 "Y PULSE <RETURN> PARA CONTINUAR",;
	 "GRACIAS.")
enddo
WAIT "IMPRIMIENDO..." WIND NOWA
return
