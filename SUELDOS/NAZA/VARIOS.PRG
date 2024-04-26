PROCEDURE VARIOS
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ULPR=HORA_ULP(PROGRAM())
VA_DIJO=ALLTRIM(PROM())
DO CASE
CASE VA_DIJO="Provincias"
=PRV()
CASE VA_DIJO="Tipo de Hora"
=THO()
CASE VA_DIJO="Ciudades"
	=OPPRV()
	=OPCIU()
	DO GRL WITH 4,5,'Men£ de Ciudades'
	ON SELE POPU grl DO ciu
	ACTI POPU grl
	RELE POPU grl
	ULPR=HORA_ULP(PROGRAM())
CASE VA_DIJO="Tipo de Documento"
=dni()
CASE VA_DIJO="Secci¢n"
=SEC()
CASE VA_DIJO="Control de Impresoras"
=OPCIMP()
ENDCASE
RETURN MEN_LIN(BOTOM)
