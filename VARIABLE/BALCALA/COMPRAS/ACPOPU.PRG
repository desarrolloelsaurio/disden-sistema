********************************************************************************
*-- Programa: ACPOPU.PRG
*-- Fecha   : 04.06.92
*-- Version : R. 'EL BATA'
*-- Notas   : ACTUALIZA POPUPS QUE SE UTILIZARAN
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
cpp=12
=movewin(3,35,8+cpp,64,"win"," Popup's a Utilizar")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari
=PONELINP(@banpop,'Bancos')
=PONELINP(@ciupop,'Ciudades')
=PoneLinP(@clipop,'Clientes ')
=PONELINP(@janpop,'Empresas')
=PONELINP(@prvpop,'Provincias')
=PONELINP(@pROpop,'Proveedores')
=PONELINP(@mArpop,'Marcas')
=PONELINP(@merpop,'Mercader¡as')
=PONELINP(@opkpop,'Operaciones de Kardex')
=PONELINP(@rubpop,'Rubros')
=ponelinp(@viapop,biajas)
=PONELINP(@zonpop,'Zonas')
@ $+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'
read cycle
rele &vari
=RELEWIN('win')
=MEN_LIN(botom)
RETURN
