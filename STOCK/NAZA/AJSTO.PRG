FUNCTION AJSTO
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
AJ_OPCION=BAR()
DO CASE
CASE BAR()=1
   TT="Todas las "+alltrim(tellas)
   fisc="tipo='M'"
   FISC1='.T.'
   do ajsto1
CASE BAR()=2
CASE BAR()=3
   TT="Todos los "+alltrim(abios)
   fisc="tipo='A'"
   FISC1='.T.'
   do ajsto1
CASE BAR()=4
endcase
return men_lin(botom)