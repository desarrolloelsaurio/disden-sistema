#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
PROCEDURE VARI
ULPR=HORA_ULP(PROGRAM())
VA_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE VA_DIJO="Ancho de la Impresora"
DO ACANCHO.SPR
CASE VA_DIJO="Ancho de la Hoja"
DO ACHOJA.SPR
CASE VA_DIJO="Cantidad de D�gitos"
DO ACDIGI
ENDCASE
RETURN MEN_LIN(BOTOM)
