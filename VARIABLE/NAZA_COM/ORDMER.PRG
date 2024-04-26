********************************************************************************
*-- Programa: ORDMER.PRG
*-- Fecha   : 07-06-92 11:21am
*-- Version : G. REINER
*-- Notas   : DETERMINA EL ORDEN DE LOS LISTADOS
*-- Modificaci¢n ELINA 07-02-92 06:56pm
*-- Modificaci¢n GOYO 30/07/92
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
cpp=10
=MOVEWIN(2,35,7+cpp,70,'WIN'," Orden de los Listados ")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari

=ponelinp(@ordCIU,'Ciudades por C¢digo')
=ponelinp(@ordCli,'Clientes por C¢digo')
=ponelinp(@ordsue,zuelas+'por C¢digo')
=ponelinp(@ordPAG,'Cond. Pago por C¢digo')
=ponelinp(@ordLIN,'L¡nea por C¢digo')
=ponelinp(@ordMER,'Mercader¡a por C¢digo')
=ponelinp(@ordPRv,'Provincias por C¢digo')
=ponelinp(@ordrub,'Rubros por C¢digo')
=ponelinp(@ordvia,biajas+' por C¢digo')
=ponelinp(@ordzon,'Zonas por C¢digo')

@ Row()+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'
read cycle
rele &vari
=RELEWIN("WIN")
=MEN_LIN(BOTOM)
RETURN
