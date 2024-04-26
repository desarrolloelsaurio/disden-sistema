* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: CIUGRL.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-19-92                                                   ³
* ³ Time created: 10:11:47am                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION CIUGRL
	parameter ciu_texto
	ciu_texto=xxtochar(ciu_texto)
	private ciu_col,ciu_texto,ciu_salida
	ciu_salida=algun(35,ciu_texto,;
	"\<Todas las Ciudades;;
\<Una Ciudad;;
Todas \<Menos Una Ciudad;;
\<Algunas Ciudades;;
U\<na Provincia;;
Todas M\<enos Una Provincia;;
Al\<gunas Provincias")
return iif(last()=27,nul,ciu_salida)
