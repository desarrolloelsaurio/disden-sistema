********************************************************************************
*-- Programa: ACPOPU.PRG
*-- Fecha   : 11.8.90
*-- Version : G. REINER
*-- Notas   : ACTUALIZA POPUPS QUE SE UTILIZARAN
*-- Modificaci¢n GOYO 06-29-92 06:56pm 
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
cpp=15
=MOVEWIN(2,35,7+cpp,70,'WIN'," Popup's a Utilizar ")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari

=PoneLinP(@calpop,'Calidades/Tama¤os')
=ponelinp(@ciupop,'Ciudades')
=ponelinp(@prvpop,'Provincias')
=ponelinp(@pagpop,'Condiciones de Venta')
=ponelinp(@rubpop,'Especies')
=ponelinp(@envpop,'Envases')
=ponelinp(@gaspop,'Gastos')
=ponelinp(@banpop,'Bancos')
=ponelinp(@zonpop,'Zonas')
=ponelinp(@varpop,'Variedades')
=ponelinp(@merpop,'Mercader¡as')
=ponelinp(@opkpop,'Operaciones de Kardex')
=ponelinp(@propop,'Remitentes')
=ponelinp(@clipop,'Clientes')
=ponelinp(@viapop,'Vendedores')
@ Row()+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'
read cycle
rele &vari
=RELEWIN("WIN")
=MEN_LIN(BOTOM)
RETURN
