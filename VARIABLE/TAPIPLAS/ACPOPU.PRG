********************************************************************************
*-- Programa: ACPOPU.PRG
*-- Fecha   : 10-27-92 09:07pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA POPUPS QUE SE UTILIZARAN
*-- VERSION TAPIPLAST
********************************************************************************
ULPR=PROGRAM()
=HORA_ULP()
cpp=12
=MOVEWIN(2,35,7+cpp,70,'WIN'," Popup's a Utilizar ")
vari=''
FOR i=1 to cpp
    vari=vari+'VA'+ALLTRIM(STR(i))+','
next
vari=sinult(vari)
publ &vari

=ponelinp(@CIUpop,'Ciudades')
=ponelinp(@colpop,'Colores')
=ponelinp(@cagpop,'Conc. Agrupaci¢n')
=ponelinp(@GRUpop,'Grupos de Compra')
=ponelinp(@LINpop,'L¡nea')
=ponelinp(@marpop,'Marcas')
=ponelinp(@matpop,'Materiales')
=ponelinp(@MERpop,'Mercader¡a')
=ponelinp(@paipop,'Pa¡ses')
=ponelinp(@PRopop,'Proveedores')
=ponelinp(@rubpop,'Rubros')
=ponelinp(@Srupop,'Sub-Rubros')

@ Row()+2,10 GET NADA pict '@* Acepta ? ' DEFA 0 MESS '[ENTER] Confirma'
read cycle
rele &vari
=RELEWIN('WIN')
=men_lin(botom)
RETURN
