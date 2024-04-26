********************************************************************************
*-- Programa: ORDMER.PRG
*-- Fecha   : 11.7.90
*-- Version : G. REINER
*-- Notas   : DETERMINA EL ORDEN DE LOS LISTADOS
*-- Modificaci¢n ELINA 07-02-92 06:56pm 
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
cpp=3
=MOVEWIN(2,35,7+cpp,70,'WIN'," Orden de los Listados ")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari
=PoneLinP(@ordcli,"Clientes Por C¢digo")
=ponelinp(@ordpro,'Remitentes Por C¢digo')
=ponelinp(@ordvia,'Vendedores Por C¢digo')
@ Row()+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'
read cycle
rele &vari
=RELEWIN("WIN")
=MEN_LIN(BOTOM)
RETURN
