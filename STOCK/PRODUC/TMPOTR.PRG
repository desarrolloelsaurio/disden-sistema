DEFINE POPU LISTKOTR MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF LISTKOTR PROM "Stock \<Actual"
DEFI BAR 2 OF LISTKOTR PROM "Stock menor que el M¡n\<imo"
DEFI BAR 3 OF LISTKOTR PROM "Stock mayor que el m \<ximo"
DEFI BAR 4 OF LISTKOTR PROM "Stock menor que \<X"
DEFI BAR 5 OF LISTKOTR PROM "\<Punto de Pedido"
DEFI BAR 6 OF LISTKOTR PROM "\<Valorizaci¢n"
DEFI BAR 7 OF LISTKOTR PROM "\<Totales por Unidad"
*****DEFI BAR 8 OF LISTKOTR PROM "\<Diferencias con Kardex"

ON SELE BAR 1 OF LISTKOTR DO QUEOTRP1
ON SELE BAR 2 OF LISTKOTR DO QUEOTRP2
ON SELE BAR 3 OF LISTKOTR DO QUEOTRP3
ON SELE BAR 4 OF LISTKOTR DO QUEOTRP4
ON BAR 5 OF LISTKOTR ACTI POPU QUEOTRP5
ON BAR 6 OF LISTKOTR ACTI POPU valorizOTR
ON BAR 7 OF LISTKOTR ACTI POPU totalesOTR
*****ON SELE BAR 8 OF LISTKOTR DO QUEOTRP8

DEFINE POPU LISIKOTR MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF LISIKOTR PROM "Stock \<Actual"
DEFI BAR 2 OF LISIKOTR PROM "Stock menor que el M¡n\<imo"
DEFI BAR 3 OF LISIKOTR PROM "Stock mayor que el m \<ximo"
DEFI BAR 4 OF LISIKOTR PROM "Stock menor que \<X"
DEFI BAR 5 OF LISIKOTR PROM "\<Punto de Pedido"
DEFI BAR 6 OF LISIKOTR PROM "\<Valorizaci¢n"
DEFI BAR 7 OF LISIKOTR PROM "\<Totales por Unidad"
*****DEFI BAR 8 OF LISIKOTR PROM "\<Diferencias con Kardex"
ON SELE BAR 1 OF LISIKOTR DO QUEOTRP1
ON SELE BAR 2 OF LISIKOTR DO QUEOTRP2
ON SELE BAR 3 OF LISIKOTR DO QUEOTRP3
ON SELE BAR 4 OF LISIKOTR DO QUEOTRP4
ON BAR 5 OF LISIKOTR ACTI POPU QUEOTRP5
ON BAR 6 OF LISIKOTR ACTI POPU valorizOTR
ON BAR 7 OF LISIKOTR ACTI POPU totalesOTR
*****ON SELE BAR 8 OF LISIKOTR DO QUEOTRP8


DEFINE POPU QUEOTRP5 MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF QUEOTRP5 PROM "\<Completo"
DEFI BAR 2 OF QUEOTRP5 PROM "\<Por Proveedor"
ON SELE BAR 1 OF QUEOTRP5 DO LPUPED WITH "O",.T.

DEFINE POPU VALORIZOTR MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF VALORIZOTR PROM "Listado \<Detallado"
DEFI BAR 2 OF VALORIZOTR PROM "Por \<Rubro"
DEFI BAR 3 OF VALORIZOTR PROM "Por \<Aplicaci¢n"
DEFI BAR 4 OF VALORIZOTR PROM "Por \<Proveedor"
DEFI BAR 5 OF VALORIZOTR PROM "Por \<Marca"

ON SELE BAR 1 OF VALORIZOTR DO VALOTRCOM
ON SELE BAR 2 OF VALORIZOTR DO SVALX WITH .T.,"O","R"
ON SELE BAR 3 OF VALORIZOTR DO SVALX WITH .T.,"O","A"
ON SELE BAR 4 OF VALORIZOTR DO SVALX WITH .T.,"O","P"
ON SELE BAR 5 OF VALORIZOTR DO SVALX WITH .T.,"O","M"

DEFINE POPU TOTALESOTR MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF TOTALESOTR PROM "Por \<Rubro"
DEFI BAR 2 OF TOTALESOTR PROM "Por \<Aplicaci¢n"
DEFI BAR 3 OF TOTALESOTR PROM "Por \<Proveedor"
DEFI BAR 4 OF TOTALESOTR PROM "Por \<Marca"
ON SELE BAR 1 OF TOTALESOTR DO SVALX WITH .T.,"O","R",.T.
ON SELE BAR 2 OF TOTALESOTR DO SVALX WITH .T.,"O","A",.T.
ON SELE BAR 3 OF TOTALESOTR DO SVALX WITH .T.,"O","P",.T.
ON SELE BAR 4 OF TOTALESOTR DO SVALX WITH .T.,"O","M",.T.

DEFINE POPU LISTKOIR MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF LISTKOIR PROM "Stock \<Actual"
DEFI BAR 2 OF LISTKOIR PROM "Stock menor que el M¡n\<imo"
DEFI BAR 3 OF LISTKOIR PROM "Stock mayor que el m \<ximo"
DEFI BAR 4 OF LISTKOIR PROM "Stock menor que \<X"
DEFI BAR 5 OF LISTKOIR PROM "\<Punto de Pedido"
DEFI BAR 6 OF LISTKOIR PROM "\<Valorizaci¢n"
DEFI BAR 7 OF LISTKOIR PROM "\<Totales por Unidad"
*****DEFI BAR 8 OF LISTKOIR PROM "\<Diferencias con Kardex"
ON SELE BAR 1 OF LISTKOIR DO QUEOTRI1
ON SELE BAR 2 OF LISTKOIR DO QUEOTRI2
ON SELE BAR 3 OF LISTKOIR DO QUEOTRI3
ON SELE BAR 4 OF LISTKOIR DO QUEOTRI4
ON BAR 5 OF LISTKOIR ACTI POPU QUEOTRI5
ON BAR 6 OF LISTKOIR ACTI POPU valoriIOTR
ON BAR 7 OF LISTKOIR ACTI POPU totaleIOTR
*****ON SELE BAR 8 OF LISTKOIR DO QUEOTRI8

DEFINE POPU QUEOTRI5 MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF QUEOTRI5 PROM "\<Completo"
DEFI BAR 2 OF QUEOTRI5 PROM "\<Por Proveedor"
ON SELE BAR 1 OF QUEOTRI5 DO LPUPED WITH "O",.F.

DEFINE POPU VALORIIOTR MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF VALORIIOTR PROM "Listado \<Detallado"
DEFI BAR 2 OF VALORIIOTR PROM "Por \<Rubro"
DEFI BAR 3 OF VALORIIOTR PROM "Por \<Aplicaci¢n"
DEFI BAR 4 OF VALORIIOTR PROM "Por \<Proveedor"
DEFI BAR 5 OF VALORIIOTR PROM "Por \<Marca"

ON SELE BAR 1 OF VALORIIOTR DO VAIOTRCOM
ON SELE BAR 2 OF VALORIIOTR DO SVALX WITH .F.,"O","R"
ON SELE BAR 3 OF VALORIIOTR DO SVALX WITH .F.,"O","A"
ON SELE BAR 4 OF VALORIIOTR DO SVALX WITH .F.,"O","P"
ON SELE BAR 5 OF VALORIIOTR DO SVALX WITH .F.,"O","M"

DEFINE POPU TOTALEIOTR MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF TOTALEIOTR PROM "Por \<Rubro"
DEFI BAR 2 OF TOTALEIOTR PROM "Por \<Aplicaci¢n"
DEFI BAR 3 OF TOTALEIOTR PROM "Por \<Proveedor"
DEFI BAR 4 OF TOTALEIOTR PROM "Por \<Marca"
ON SELE BAR 1 OF TOTALEIOTR DO SVALX WITH .F.,"O","R",.T.
ON SELE BAR 2 OF TOTALEIOTR DO SVALX WITH .F.,"O","A",.T.
ON SELE BAR 3 OF TOTALEIOTR DO SVALX WITH .F.,"O","P",.T.
ON SELE BAR 4 OF TOTALEIOTR DO SVALX WITH .F.,"O","M",.T.

****

***********************  STOCK DE OTROS PRODUCTOS

PROCEDURE QUEOTRP1
	=OPPRO()
	=OPMDD()
	=OPOTRS()
	ttque="Listado de Stock de Otros Productos"
	DO queryotr.spr WITH .T.,.T.,.F.," Stock Actual ",".T."
RETURN

PROCEDURE QUEOTRP2
	=OPPRO()
	=OPMDD()
	=OPOTRS()
	ttque="Listado de Stock de Otros Productos"+crlf+;
		"Stock menor que el m¡nimo"
	DO queryotr.spr WITH .T.,.T.,.F.," Stock Menor que el M¡nimo ","OTRS.STOCK<OTRS.STOCKMIN"
RETURN

PROCEDURE QUEOTRP3
	=OPPRO()
	=OPMDD()
	=OPOTRS()
	ttque="Listado de Stock de Otros Productos"+crlf+;
		"Stock mayor que el m ximo"
	DO queryotr.spr WITH .T.,.T.,.F.," Stock Mayor que el M ximo ","OTRS.STOCK>OTRS.STOCKMAX"
RETURN

PROCEDURE QUEOTRP4
	STORE NUL TO RESPUESTA
	RESPUESTA=INFIC("Cantidad a Listar",999999)
	if last()#27 .and. !empty(respuesta)
		lacant=respuesta
		=OPPRO()
		=OPMDD()
		=OPOTRS()
		ttque="Listado de Stock de Otros Productos"+crlf+;
			"Stock menor que "+alltrim(str(lacant))
		DO queryotr.spr WITH .T.,.T.,.F.," Stock Menor que "+alltrim(str(lacant)),"OTRS.STOCK<"+alltrim(str(lacant))
	endif
RETURN

PROCEDURE QUEOTRP8
	solodif=.f.
	ULPR="DIFSKAVIP"
	=OPOTRS()
	SET ORDER TO TAG AVICODPRO
	=OPKARS()
	=WORKING()
	=DOTALK()
	SET ORDER TO TAG AVICODPRO
	sele kars
	set rela to avicodpro into OTRS
	REPO form STKARAVI for !empty(avicodpro) PREV
	=UNWORK()
	=UNTALK()
RETURN

PROCEDURE VALOTRCOM
	=OPPRO()
	=OPMDD()
	=OPOTRS()
	ttque="Listado de Stock de Otros Productos"+crlf+;
		"Valorizaci¢n"
	DO queryotr.spr WITH .T.,.T.,.F.," Valorizaci¢n ",".T."
RETURN

PROCEDURE QUEOTRI1
	=OPPRO()
	=OPMDD()
	=OPOTRS()
	ttque="Listado de Stock de Otros Productos"
	DO queryotr.spr WITH .F.,.T.,.F.," Stock Actual ",".T."
RETURN

PROCEDURE QUEOTRI2
	=OPPRO()
	=OPMDD()
	=OPOTRS()
	ttque="Listado de Stock de Otros Productos"+crlf+;
		"Stock menor que el m¡nimo"
	DO queryotr.spr WITH .F.,.T.,.F.," Stock Menor que el M¡nimo ","OTRS.STOCK<OTRS.STOCKMIN"
RETURN

PROCEDURE QUEOTRI3
	=OPPRO()
	=OPMDD()
	=OPOTRS()
	ttque="Listado de Stock de Otros Productos"+crlf+;
		"Stock mayor que el m ximo"
	DO queryotr.spr WITH .F.,.T.,.F.," Stock Mayor que el M ximo ","OTRS.STOCK>OTRS.STOCKMAX"
RETURN

PROCEDURE QUEOTRI4
	STORE NUL TO RESPUESTA
	RESPUESTA=INFIC("Cantidad a Listar",999999)
	if last()#27 .and. !empty(respuesta)
		lacant=respuesta
		=OPPRO()
		=OPMDD()
		=OPOTRS()
		ttque="Listado de Stock de Otros Productos"+crlf+;
			"Stock menor que "+alltrim(str(lacant))
		DO queryotr.spr WITH .F.,.T.,.F.," Stock Menor que "+alltrim(str(lacant)),"OTRS.STOCK<"+alltrim(str(lacant))
	endif
RETURN

PROCEDURE QUEOTRI8
	solodif=.f.
	ULPR="DIFSKAVIP"
	=OPOTRS()
	SET ORDER TO TAG AVICODPRO
	=OPKARS()
	=WORKING()
	=DOTALK()
	SET ORDER TO TAG AVICODPRO
	sele kars
	set rela to avicodpro into OTRS
	REPO form STKARAVI for !empty(avicodpro) PREV
	=UNWORK()
	=UNTALK()
RETURN

PROCEDURE VAIOTRCOM
	=OPPRO()
	=OPMDD()
	=OPOTRS()
	ttque="Listado de Stock de Otros Productos"+crlf+;
		"Valorizaci¢n"
	DO queryotr.spr WITH .T.,.T.,.F.," Valorizaci¢n ",".T."
RETURN


***********************  STOCK DE PRODUCTOS TERMINADOS

PROCEDURE QUECOMP1
	=OPPRO()
	=OPMDD()
	DO OPCOMS
	ttque="Listado de Stock de Productos Terminados"
	DO queryCOM.spr WITH .T.,.T.,.F.," Stock Actual ",".T."
RETURN

PROCEDURE QUECOMP2
	=OPPRO()
	=OPMDD()
	DO OPCOMS
	ttque="Listado de Stock de Productos Terminados"+crlf+;
		"Stock menor que el m¡nimo"
	DO queryCOM.spr WITH .T.,.T.,.F.," Stock Menor que el M¡nimo ","COMS.STOCK<COMS.STOCKMIN"
RETURN

PROCEDURE QUECOMP3
	=OPPRO()
	=OPMDD()
	DO OPCOMS
	ttque="Listado de Stock de Productos Terminados"+crlf+;
		"Stock mayor que el m ximo"
	DO queryCOM.spr WITH .T.,.T.,.F.," Stock Mayor que el M ximo ","COMS.STOCK>COMS.STOCKMAX"
RETURN

PROCEDURE QUECOMP4
	STORE NUL TO RESPUESTA
	RESPUESTA=INFIC("Cantidad a Listar",999999)
	if last()#27 .and. !empty(respuesta)
		lacant=respuesta
		=OPPRO()
		=OPMDD()
		DO OPCOMS
		ttque="Listado de Stock de Productos Terminados"+crlf+;
			"Stock menor que "+alltrim(str(lacant))
		DO queryCOM.spr WITH .T.,.T.,.F.," Stock Menor que "+alltrim(str(lacant)),"COMS.STOCK<"+alltrim(str(lacant))
	endif
RETURN

PROCEDURE QUECOMP8
	solodif=.f.
	ULPR="DIFSKAVIP"
	=OPCOMS()
	SET ORDER TO TAG AVICODPRO
	=OPKARS()
	=WORKING()
	=DOTALK()
	SET ORDER TO TAG AVICODPRO
	sele kars
	set rela to avicodpro into COMS
	REPO form STKARAVI for !empty(avicodpro) PREV
	=UNWORK()
	=UNTALK()
RETURN

PROCEDURE VALCOMCOM
	=OPPRO()
	=OPMDD()
	DO OPCOMS
	ttque="Listado de Stock de Productos Terminados"+crlf+;
		"Valorizaci¢n"
	DO queryCOM.spr WITH .T.,.T.,.F.," Valorizaci¢n ",".T."
RETURN

PROCEDURE QUECOMI1
	=OPPRO()
	=OPMDD()
	DO OPCOMS
	ttque="Listado de Stock de Productos Terminados"
	DO queryCOM.spr WITH .F.,.T.,.F.," Stock Actual ",".T."
RETURN

PROCEDURE QUECOMI2
	=OPPRO()
	=OPMDD()
	DO OPCOMS
	ttque="Listado de Stock de Productos Terminados"+crlf+;
		"Stock menor que el m¡nimo"
	DO queryCOM.spr WITH .F.,.T.,.F.," Stock Menor que el M¡nimo ","COMS.STOCK<COMS.STOCKMIN"
RETURN

PROCEDURE QUECOMI3
	=OPPRO()
	=OPMDD()
	DO OPCOMS
	ttque="Listado de Stock de Productos Terminados"+crlf+;
		"Stock mayor que el m ximo"
	DO queryCOM.spr WITH .F.,.T.,.F.," Stock Mayor que el M ximo ","COMS.STOCK>COMS.STOCKMAX"
RETURN

PROCEDURE QUECOMI4
	STORE NUL TO RESPUESTA
	RESPUESTA=INFIC("Cantidad a Listar",999999)
	if last()#27 .and. !empty(respuesta)
		lacant=respuesta
		=OPPRO()
		=OPMDD()
		DO OPCOMS
		ttque="Listado de Stock de Productos Terminados"+crlf+;
			"Stock menor que "+alltrim(str(lacant))
		DO queryCOM.spr WITH .F.,.T.,.F.," Stock Menor que "+alltrim(str(lacant)),"COMS.STOCK<"+alltrim(str(lacant))
	endif
RETURN

PROCEDURE QUECOMI8
	solodif=.f.
	ULPR="DIFSKAVIP"
	=OPCOMS()
	SET ORDER TO TAG AVICODPRO
	=OPKARS()
	=WORKING()
	=DOTALK()
	SET ORDER TO TAG AVICODPRO
	sele kars
	set rela to avicodpro into COMS
	REPO form STKARAVI for !empty(avicodpro) PREV
	=UNWORK()
	=UNTALK()
RETURN

PROCEDURE VAICOMCOM
	=OPPRO()
	=OPMDD()
	DO OPCOMS
	ttque="Listado de Stock de Productos Terminados"+crlf+;
		"Valorizaci¢n"
	DO queryCOM.spr WITH .F.,.T.,.F.," Valorizaci¢n ",".T."
RETURN

