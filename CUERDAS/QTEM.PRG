*****************************************
*-- Programa: qtem.PRG
*-- Fecha   : 06/14/91 05:28pm
*-- Version : G. REINER -
*-- Notas   : devuelve texto de temporada
*****************************************
FUNCTION qtem
	PARA Q_LATEM
	IF TYPE("Q_LATEM")="C"
		RETURN PADR(IIF(Q_LATEM='P',"Primavera",IIF(Q_LATEM='V','Verano',IIF(Q_LATEM='O','Oto¤o',IIF(Q_LATEM='T','Todas',IIF(Q_LATEM="I","Invierno","??"))))),9)
	ELSE
		RETURN padr(IIF(Q_LATEM=1,"Primavera",;
			IIF(Q_LATEM=2,"Verano",;
			IIF(Q_LATEM=3,"Oto¤o",;
			IIF(Q_LATEM=4,"Invierno",;
			iif(Q_LATEM=5,"Todas","???"))))),9)
	ENDIF
