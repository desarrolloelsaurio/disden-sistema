********************************************************************************
*-- Programa: BVIX.PRG
*-- Fecha   : 06/12/91 04:10pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA PARA BORRAR DE LA BASE DE DATOS DE VIAJANTES
*-- Modificaci¢n GOYO 04-02-92 12:55pm
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- Modificaci¢n GOYO 07-22-92 11:37pm optimizaci¢n
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
STOR NUL TO RESPUESTA
DO CASE
CASE BAR()=1
	SELE VIA
	=IIF(!EMPTY(elivia("a borrar",-1,1)) .AND. confirma("Borra las zonas de "+ALLTRIM(via.codvia),.T.,12,nul),BVIX1(),.T.)
CASE BAR()=2
	SELE mix
	=IIF(!empty(elizon("a borrar",-1,1)) .AND. confirma("Borra "+biajas+" de "+ALLTRIM(mix.texto1),.T.,12,nul),BVIX2(),.T.)
CASE BAR()=3
	=IIF(!empty(ELIEMP("a borrar",-1,1)) .AND. confirma("Borrar "+biajas+" de "+ALLTRIM(mix.texto1),.T.,12,nul),BVIX3(),.T.)
CASE BAR()=4
	DO WHILE !empty(elivia("a borrar",-1,1))
		=BVIX4()
		STOR NUL TO respuesta
	ENDDO
ENDCASE
RETURN
