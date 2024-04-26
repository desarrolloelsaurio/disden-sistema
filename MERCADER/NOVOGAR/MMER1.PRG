* Modif. parameter .t. > genera ventana
procedure mmer1
parameter m_convent
if m_convent
   =movecent(0,0,9,60,"win",' Muestra Art¡culo ')
endif
COL1=IIF(TYPE("COL1")#"N",20,COL1)
@ 4,COL1 get m.articulo
sele rub
narubro=iif(XSEEK(STR(m.rubro),'RUB','CODRUB'),rub.rubro,space(15))
@ 1,1 say 'RUBRO'
@ 1,col1 get narubro
nasubru=iif(bussru(m.rubro,m.subrubro),rub.rubro,space(15))
@ 2,1 say 'SUB-RUBRO'
@ 2,col1 get nasubru
@ 3,1 say 'MODELO'
@ 3,col1 get m.modelo
@ 5,1 say 'DETALLE'
@ 5,col1 get m.merca
sele mi1
set ORDER TO TAG MARCOD
namarca=iif(busmar(mer.marca),mi1.texto1,space(15))
@ 6,1 say 'MARCA'
@ 6,col1 get namarca
clea gets
return .T.
