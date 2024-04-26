********************************************************************************
*-- Programa: ACPOPU.PRG
*-- Fecha   : 11.8.90
*-- Version : G. REINER
*-- Notas   : ACTUALIZA POPUPS QUE SE UTILIZARAN
********************************************************************************
ULPR=PROGRAM()
=HORA_ULP()
cpp=6
=MOVEWIN(2,35,7+cpp,70,'WIN'," Popup's a Utilizar ")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari

=ponelinp(@banpop,'Bancos')
=ponelinp(@ciupop,'Ciudades')
=ponelinp(@clipop,'Clientes')
=ponelinp(@propop,'Proveedores')
=ponelinp(@prvpop,'Provincias')
=ponelinp(@GASpop,'Tipo de Gasto')

@ Row()+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'

read cycle
rele &vari
=RELEWIN('WIN')
=men_lin(botom)
RETURN
