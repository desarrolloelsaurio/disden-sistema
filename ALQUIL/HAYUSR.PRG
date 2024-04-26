***********************************************************************
* FUNCION HAYUSR.PRG                                                  *
* G. REINER - 06-25-95 05:46pm                                        *
* DEVUELVE LA LETRA DE LA UNIDAD EN LA QUE HAY UN SUBDIRECTORIO "USR" *
* CON LOS NOMBRES DE LOS USUARIOS                                     *
* ESPECIALMENTE UTIL EN REDES                                         *
***********************************************************************
FUNCTION HAYUSR
	DO CASE
	CASE !EMPTY(ADIR(USUARIOS,'G:\USR\*.','D'))
		RETURN "G"
	CASE !EMPTY(ADIR(USUARIOS,'F:\USR\*.','D'))
		RETURN "F"
	CASE !EMPTY(ADIR(USUARIOS,'C:\USR\*.','D'))
		RETURN "C"
	CASE !EMPTY(ADIR(USUARIOS,'D:\USR\*.','D'))
		RETURN "D"
	ENDCASE
RETURN ""
