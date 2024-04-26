********************************************************************************
*-- Programa: ORDMER.PRG
*-- Fecha   : 07-06-92 00:17am
*-- Version : G. REINER
*-- Notas   : DETERMINA EL ORDEN DE LOS LISTADOS
*-- Modificaci¢n ELINA 07-02-92 06:56pm
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
cpp=6
=MOVEWIN(2,35,7+cpp,70,'WIN'," Orden de los Listados ")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari
pco=' por C¢digo'
=PONELINP(@ordban,'Bancos'+pco)
=ponelinp(@ordciu,'Ciudades'+pco)
=PoneLinP(@ordcli,'Clientes'+pco)
=ponelinp(@ordMar,'Marcas'+pco)
=ponelinp(@ordprv,'Provincias'+pco)
=ponelinp(@ordpro,'Proveedores'+pco)
@ $+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'
read cycle
rele &vari
=RELEWIN("WIN")
=MEN_LIN(BOTOM)
RETURN
