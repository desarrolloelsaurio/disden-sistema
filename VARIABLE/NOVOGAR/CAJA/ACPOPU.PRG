********************************************************************************
*-- Programa: ACPOPU.PRG
*-- Fecha   : 11.8.90
*-- Version : G. REINER
*-- Notas   : ACTUALIZA POPUPS QUE SE UTILIZARAN
********************************************************************************
ULPR=PROGRAM()
=HORA_ULP()
cpp=11
=MOVEWIN(2,35,7+cpp,70,'WIN'," Popup's a Utilizar ")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari

=ponelinp(@alipop,'Alimentaci¢n')
=ponelinp(@COLpop,'Colores')
=ponelinp(@GRUpop,'Grupo de Compra')
=ponelinp(@LINpop,'L¡nea')
=ponelinp(@marpop,'Marcas')
=ponelinp(@MERpop,'Mercader¡a')
=ponelinp(@OPKpop,'Op. de Kardex')
=ponelinp(@PRopop,'Proveedores')
=ponelinp(@rubpop,'Rubros')
=ponelinp(@Srupop,'Sub-Rubros')
=ponelinp(@zonpop,'Zonas')

@ Row()+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'
read cycle
rele &vari
=RELEWIN('WIN')
=men_lin(botom)
RETURN
