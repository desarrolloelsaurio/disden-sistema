******************************************
*-- Programa: qtem.PRG
*-- Fecha   : 06/14/91 05:28pm
*-- Version : G. REINER -
*-- Notas   : devuelve texto de temporada
******************************************
FUNCTION qtem
PARA cosa
if type("cosa")="C"
RETURN(PADR(IIF(cosa='P',"Primavera",IIF(COSA='V','Verano',IIF(cosa='O','Oto¤o',IIF(cosa='T','Todas',"Invierno")))),9))
endif
RETURN(IIF(cosa=1,"Primavera",IIF(COSA=2,'Verano',IIF(cosa=3,'Oto¤o',IIF(cosa=5,'Todas',"Invierno")))))
