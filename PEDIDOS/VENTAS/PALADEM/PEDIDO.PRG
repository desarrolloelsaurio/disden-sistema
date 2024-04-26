********************************************************
*-- Programa: PEDIDO.PRG
*-- Fecha   : 11-03-91 02:01am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE NOTAS DE PEDIDO
*-- Modificaci¢n GOYO 08-06-92 05:02pm
*******************************************************
P_DIJO=ALLTRIM(PROMPT())
=OPCLI()
=OPVIA()
=OPCIU()
DO OPEMP
=OPPAG()

ulpr=HORA_ULP(PROGRAM())
store 1 to c1
c2=12
c3=43
store 52 to c4,c5
c6=63
store nul to m.pedido,m.marca
DO CASE
CASE P_DIJO='Recepci¢n Nota de Pedido'
   	store nul to respuesta
   	IF !empty(ELIEMP(" - [ESC] para Salir",2,NUL))
   		IF JANNRO#NUL
   			JANCOD=LEFT(MIX.TEXTO2,2)
   			=cabpan1()
   			STOR jannro TO m.marca,nadmar
   			STORE LEFT(TEXTO2,2) TO M.CODMARCA
   			=OPMER() WITH JANNRO
   			do opPED with jannro
   			do iped
   		ENDIF
   	ENDIF
CASE P_DIJO='Agrega Linea'
   do opPED with jannro
   IF BUSPED()
   	  JANCOD=LEFT(MIX.TEXTO2,2)
   	  =OPMER() WITH JANNRO
      STOR jannro TO m.marca,nadmar
   	  DO APED
   	ENDIF
CASE P_DIJO='Borra L¡nea'
   do opPED with jannro
   IF BUSPED()
   	  JANCOD=LEFT(MIX.TEXTO2,2)
   	  =OPMER() WITH JANNRO
      STOR jannro TO m.marca,nadmar
   	  DO BPED1
   	ENDIF
case P_DIJO='Restaura el Archivo'
   	DO xPED
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
