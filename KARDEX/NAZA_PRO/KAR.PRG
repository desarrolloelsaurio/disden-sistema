********************************************************************************
*-- Programa: kar.prg
*-- Fecha   : 06/21/91 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE kardex
********************************************************************************
ulpr=PROGRAM()
=CABPAN1()
sele kar
ka_dijo=ALLTRIM(PROMPT())
DO CASE
CASE KA_DIJO="Compras de Materia Prima"
	DO ikar.SPR
CASE KA_DIJO="Borra"
	RESPUESTA='nada#8#15#Tipo de Borrado#3#Borra \<Todo el Archivo#\<'+abios+'#\<'+tellas+'#\<Por '+abio+'#P\<or '+tella
	=DEFPOP()
	ON SELE POPU nada DO bkar
	ACTI POPU nada
	RELE POPU nada
CASE KA_DIJO="Calcula Saldos"
	RESPUESTA='nada#8#15#Calcula Saldos de Kardex#3#Salda \<Todo el Archivo#\<'+abios+'#\<'+tellas+'#\<Por '+abio+'#P\<or '+tella
	*   ON SELE POPU nada DO skar
	*   ACTI POPU nada
	*   RELE POPU nada
CASE KA_DIJO="Ajusta Stock al Kardex"
	RESPUESTA='AJSTO#8#15#Ajusta Stocks al Kardes#3;
#Todas las '+tellas+' +;
#Una '+tella+';
#Todos los '+abios+' +;
#Un '+abio
=defpop()
on sele popu AJSTO do AJSTO
CASE KA_DIJO="Lista por Impresora"
	RESPUESTA='nada#9#45#Tipo de Listado;
#3;
#\<'+abio+';
#\<'+tella+';
#\<Un Taller;
#\<Dep¢sito Propio;
#Una Orden de \<'+favri+';
#Stock a F\<echa'
=DEFPOP()
	ON SELE POPU nada DO LKAR
	ACTI POPU nada
	RELE POPU nada
CASE KA_DIJO="Lista por Pantalla"
	RESPUESTA='nada#9#45#Tipo de Listado;
#3;
#\<'+abio+';
#\<'+tella+';
#\<Un Taller;
#\<Dep¢sito Propio;
#Una Orden de \<'+favri+';
#Stock a F\<echa'
=DEFPOP()
	ON SELE POPU nada DO LKAR WITH .T.
	ACTI POPU nada
	RELE POPU nada
CASE KA_DIJO="Restaura el Archivo"
	DO xkar
ENDCASE
ulpr=PROGRAM()
unlo all
return MEN_LIN(BOTOM)
