********************************************************************************
*-- Programa: ORDMER.PRG
*-- Fecha   : 07-06-92 11:21am
*-- Version : G. REINER
*-- Notas   : DETERMINA EL ORDEN DE LOS LISTADOS
*-- Modificaci¢n ELINA 07-02-92 06:56pm
*-- VERSION TAPIPLAST
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
cpp=12
=MOVEWIN(2,35,7+cpp,70,'WIN'," Orden de los Listados ")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari

PCO=' por C¢digo'

=ponelinp(@ORDCIU,'Ciudades'+PCO)
=ponelinp(@ORDcol,'Colores'+PCO)
=ponelinp(@ORDcag,'Conc. Agrupaci¢n'+PCO)
=ponelinp(@ORDGRU,'Grupos de Compra'+PCO)
=ponelinp(@ORDLIN,'L¡nea'+PCO)
=ponelinp(@ORDmar,'Marcas'+PCO)
=ponelinp(@ORDmat,'Materiales'+PCO)
=ponelinp(@ORDMER,'Mercader¡a'+PCO)
=ponelinp(@ORDpai,'Pa¡ses'+PCO)
=ponelinp(@ORDPRo,'Proveedores'+PCO)
=ponelinp(@ORDrub,'Rubros'+PCO)
=ponelinp(@ORDSru,'Sub-Rubros'+PCO)

@ Row()+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma' colo sche 19
read cycle
rele &vari
=RELEWIN("WIN")
=MEN_LIN(BOTOM)
RETURN
