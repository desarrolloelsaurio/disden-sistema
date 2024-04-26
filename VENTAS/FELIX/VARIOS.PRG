PROCEDURE VARIOS
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ULPR=HORA_ULP(PROGRAM())
VA_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE VA_DIJO="Bancos"
respuesta='BANCOS#4#20#A/B/M/L Bancos#3;
#\<Bancos;
#\<N§ de Cheque'
=defpop()
ON SELE POPU BANCOS DO BANC
ACTI POPU BANCOS
RELE POPU BANCOS
CASE VA_DIJO="Ciudades"
	=OPPRV()
	=OPCIU()
   DO GRL WITH 4,5,'Men£ de Ciudades'
   ON SELE POPU grl DO ciu
   ACTI POPU grl
   RELE POPU grl
CASE VA_DIJO="Cuentas Contables"
   DO GAS
CASE VA_DIJO="Condiciones de IVA"
   DO IVA
CASE VA_DIJO="Condiciones de Pago"
   DO PAG
CASE VA_DIJO="Tipo de Documento"
   DO DNI
CASE VA_DIJO="Provincias"
   DO PRV
CASE VA_DIJO="Control de Impresoras"
   DO OPCIMP
CASE VA_DIJO="Rubros"
   DO RUB
CASE VA_DIJO="Pa¡ses"
   DO PAI
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

