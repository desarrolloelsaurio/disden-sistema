FUNCTION OPCIMP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
OP_TEX=IIF(_WINDOWS,"Impresión","Impresi¢n")
   respuesta='grl#10#5#'+;
   IIF(_WINDOWS,"Menú de Control de ","Men£ de Control de ")+OP_TEX+;
   "#3#\<Imprime Planilla#"+;
   OP_TEX+" al \<Server#"+;
   OP_TEX+" \<Local#\<Detiene Impresora#"+;
   OP_TEX+" en \<Archivo ASCII#\<Otras Impresoras"
   =DEFPOP()
   ON SELE POPU GRL DO CIMP
   ACTI POPU GRL
   RELE POPU GRL
RETURN MEN_LIN(BOTOM)
