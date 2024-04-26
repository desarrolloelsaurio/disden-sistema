PARAMETER C_MENU,C_TEXSUC
JANNAME=C_TEXSUC
=MOVEWIN(18,20,22,60,"IVAN"," Sucursal de Origen ")
@ 0,0,5,38 BOX REPL("±",9)
@ 1,0 SAY PADC(DOSSPAC(C_TEXSUC),WCOLS())
ACTI SCRE
respuesta='C_MENU#2#'+;
ALLTRIM(STR(C_MENU))+';
#A/B/M/L Mercader¡as;
#3;
#Carga \<Stock Inicial;
#\<Corrige Stock;
#\<Borra Stock Sucursal '+C_TEXSUC+';
#-'
IF ESARROYO .and. ;
LASUC="0004"
respuesta=respuesta+'#Rec\<ibe Remito de Proveedor;
#Lista Remito de Proveedor por Pantalla#;
#Lista Remito de Proveedor por Impresora#-'
ENDIF
RESPUESTA=RESPUESTA+';
#\<Emite Remito desde '+;
C_TEXSUC+';
#C\<onsulta;
#-;
#Lista Remitos por \<Pantalla;
#\<Lista Remitos por Impresora;
#-;
#Lista Stock por P\<antalla;
#Lista Stock por I\<mpresora'
RESPUESTA=RESPUESTA+';
#-;
#\<Reindexa'
=defpop()
ON SELE POPU C_MENU DO C_MENU
acti popu C_MENU
rele popu C_MENU
RETURN RELEWIN("IVAN")