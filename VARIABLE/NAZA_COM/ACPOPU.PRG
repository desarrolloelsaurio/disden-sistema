********************************************************************************
*-- Programa: ACPOPU.PRG
*-- Fecha   : 12-17-92 10:08am
*-- Version : G. REINER
*-- Notas   : ACTUALIZA POPUPS QUE SE UTILIZARAN
*-- VERSION NAZA COMPRAS
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
cpp=16
=movewin(3,35,8+cpp,64,"win"," Popup's a Utilizar")
vari=''
FOR i=1 to cpp
	vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari
=PONELINP(@ciupop,'Ciudades')
=PONELINP(@clipop,"Clientes")
=PONELINP(@curpop,"Curvas")
=PONELINP(@grupop,"Grupos de Compra")
=PONELINP(@linpop,"L¡neas")
=PONELINP(@prvpop,"Provincias")
=PONELINP(@merpop,"Mercader¡as")
=PONELINP(@opkpop,"Op. de Kardex")
=PONELINP(@colpop,"Colores")
=PONELINP(@propop,"Proveedores")
=PONELINP(@rubpop,"Rubros")
=PONELINP(@suepop,Proper(zuelas))
=PONELINP(@talpop,"Talleres")
=PONELINP(@telpop,"Telas")
=PONELINP(@banpop,"Bancos")
=PONELINP(@ZONPop,"Zonas")
@ $+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'
read cycle
rele &vari
=RELEWIN('win')
=MEN_LIN(botom)
RETURN
