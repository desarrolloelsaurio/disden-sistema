********************************************************************************
*-- Programa: ORDMER.PRG
*-- Fecha   : 07-20-92 10:50am
*-- Version : G. REINER
*-- Notas   : DETERMINA EL ORDEN DE LOS LISTADOS
*-- Modificaci¢n ELINA 07-02-92 06:56pm
*-- Modificaci¢n GOYO 09-06-92 01:10pm PARA NAZA VENTAS
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
cpp=13
=MOVEWIN(2,32,7+cpp,70,'WIN'," Orden de los Listados ")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari
pco=' por C¢digo'

=PONELINP(@ORDBAN,"Bancos"+pco)
=PONELINP(@ORDCIU,"Ciudades"+pco)
=PONELINP(@ORdcLI,"Clientes"+pco)
=PONELINP(@ORDSUE,zuelas+pco)
=PONELINP(@ORDpag,"Cond. de Venta"+pco)
=PONELINP(@ORDcur,'Curvas'+pco)
=PONELINP(@ORDLIN,'L¡neas'+pco)
=PONELINP(@ordmer,'Mercader¡a'+pco)
=PONELINP(@ORDOPK,'Op. de Kardex'+pco)
=PONELINP(@ordprv,'Provincias'+pco)
=PONELINP(@ORDRUB,'Rubros'+pco)
=PONELINP(@ORDvia,biajas+pco)
=PONELINP(@ORDZON,'Zonas'+pco)

@ Row()+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'
read cycle
rele &vari
=RELEWIN("WIN")
=MEN_LIN(BOTOM)
RETURN
