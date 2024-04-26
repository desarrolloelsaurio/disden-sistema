*       *********************************************************
*       *
*       * 07/19/95            CLIENTES.MPR              22:28:42
*       *
*       *********************************************************
*       *
*       * Author's Name G. REINER
*       *
*       * Copyright (c) 1995 Company Name
*       * Address
*       * City,     Zip
*       *********************************************************
ACTI SCRE
CLEA
=SETEOS()
MODI WIND SCREEN TITL "GESTION DE CLIENTES - José Bautista Battaglia                                          / © G. REINER - 1998"
RELE SSTM,JANNAME,USADOR,COEFSEG,XACANCHO,XACHOJA,SSTM1,LARGO,LARGOIM
RELE ULPR
PUBL SSTM,JANNAME,USADOR,COEFSEG,XACANCHO,XACHOJA,SSTM1,LARGO,LARGOIM
PUBL ULPR
*** DEFINICION DE VARIABLES
USADOR=GETENV("USERNAME")
LARGOIM=80
IF GETENV("EQUIPO")="MICASA"
   rest from posic ADDI
ELSE
   rest from posic ADDI
ENDIF
=GETPATH()
=OPMIX()
=OPAUD()
=OPSEG()
=var_age()
=var_prv()
=VAR_CLI()
=var_dni()
=var_iva()
=var_cag()
=var_int()
=var_tpt()
=VAR_ZON()
=GETPATH()
COEFSEG=1
XACANCHO=GETNU1(PADR(USADOR,10)+PADR("XACANCHO",20),"FOXPER")
XACHOJA=GETNU1(PADR(USADOR,10)+PADR("XACHOJA",20),"FOXPER")
SSTM="VENTAS"
SSTM1="DIS-DEN"
JANNAME="José Battaglia e Hijos"
STORE .T. TO CAGPOP,CIUPOP,CTDPOP,IVACOD,MERPOP,PRVPOP,PROPOP,DNIPOP,ZONPOP,Agepop
STORE .F. TO CLIPOP


*       *********************************************************
*       *
*       *                      Menu Definition
*       *
*       *********************************************************
*

DEFI MENU MAIN
DEFI PAD _r211c6grt OF MAIN PROM "\<Varios" COLOR SCHEME 3
DEFI PAD _r211c6gty OF MAIN PROM "\<Clientes" COLOR SCHEME 3
DEFI PAD interesa   OF MAIN PROM "\<Transportes" COLOR SCHEME 3 
DEFI PAD _r211c6gui OF MAIN PROM "\<Cuenta Corriente" COLOR SCHEME 3 skip 
DEFI PAD _r211c6guw OF MAIN PROM "A\<genda" COLOR SCHEME 3 skip 
DEFI PAD _r211c6gvh OF MAIN PROM "V\<ariables" COLOR SCHEME 3
DEFI PAD _r211c6gvu OF MAIN PROM "\<Salida" COLOR SCHEME 3
ON PAD _r211c6grt OF MAIN ACTI POPUP varios
ON PAD _r211c6gty OF MAIN ACTI POPUP clientes
ON PAD interesa OF MAIN ACTI POPUP interesa
*ON PAD _r211c6gui OF MAIN ACTI POPUP cuentacorr
*ON PAD _r211c6guw OF MAIN ACTI POPUP agenda
ON PAD _r211c6gvh OF MAIN ACTI POPUP variables
ON SELE PAD _r211c6gvu OF MAIN cancel

DEFI POPUP varios MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF varios PROM "\<Ciudades"
DEFI BAR 2 OF varios PROM "\<Provincias"
DEFI BAR 3 OF varios PROM "Condición de \<Iva"
DEFI BAR 4 OF varios PROM "Tipo de \<Documento"
DEFI BAR 5 OF varios PROM "\<Agrupación"
DEFI BAR 6 OF varios PROM "\<Zonas"
ON SELE BAR 1 OF varios DO _r211c6h1a
ON SELE BAR 2 OF varios do prv
ON SELE BAR 3 OF varios do iva
ON SELE BAR 4 OF varios do dni
ON SELE BAR 5 OF varios do cag
ON SELE BAR 6 OF varios do zon

DEFI POPUP clientes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF clientes PROM "\<Datos Administrativos"
DEFI BAR 2 OF clientes PROM "\<Legajo"
DEFI BAR 3 OF clientes PROM "\<Asigna Transporte"
*DEFI BAR 4 OF clientes PROM "\<Etiquetas"
*DEFI BAR 5 OF clientes PROM "E\<ncabezados"
*DEFI BAR 6 OF clientes PROM "\<Cumpleaños"
*DEFI BAR 7 OF clientes PROM "\<Ranking"
*DEFI BAR 8 OF clientes PROM "Genera Base de Datos" after 5

ON SELE BAR 1 OF clientes DO CLI
ON SELE BAR 2 OF clientes DO CLI
ON SELE BAR 3 OF clientes DO CLI
*ON BAR 4 OF clientes ACTI POPUP etiquetas
*ON BAR 5 OF clientes ACTI POPUP encabezado
*ON SELE BAR 6 OF clientes DO _r211c6h7p
*ON BAR 7 OF clientes ACTI POPUP ranking
*ON BAR 8 OF CLIENTES ACTI POPUP GENBASDA

DEFI POPUP interesa MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF interesa PROM "\<Datos Administrativos"
DEFI BAR 2 OF interesa PROM "\<Legajo"

ON SELE BAR 1 OF interesa DO tpt
ON SELE BAR 2 OF interesa DO tpt

DEFI POPUP etiquetas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF etiquetas PROM "\<Un Cliente"
DEFI BAR 2 OF etiquetas PROM "\<Por Agrupación"
DEFI BAR 3 OF etiquetas PROM "\<Todos los Clientes"
DEFI BAR 4 OF etiquetas PROM "Por \<Zona"
DEFI BAR 5 OF etiquetas PROM "Por \<Letra"
ON SELE BAR 1 OF etiquetas DO DISPLBL WITH 1,2,.F.,.F.,"C"
ON BAR 2 OF etiquetas ACTI POPUP poragrupac
ON BAR 3 OF etiquetas ACTI POPUP todosloscl
ON BAR 4 OF etiquetas ACTI POPUP porzona
ON BAR 5 OF etiquetas ACTI POPUP porletra

DEFI POPUP poragrupac MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF poragrupac PROM "\<Completo"
DEFI BAR 2 OF poragrupac PROM "\<Desde un Cliente"
DEFI BAR 3 OF poragrupac PROM "Desde - \<Hasta"
DEFI BAR 4 OF poragrupac  PROM "\<Letra"
ON SELE BAR 1 OF poragrupac DO DISPLBL WITH 2,2,.T.,.F.,"C"
ON SELE BAR 2 OF poragrupac DO DISPLBL WITH 2,2,.F.,.F.,"C"
ON SELE BAR 3 OF poragrupac DO DISPLBL WITH 2,2,.f.,.t.,"C"
ON SELE BAR 4 OF poragrupac DO DISPLBL WITH 2,2,.T.,.t.,"C",.T.

DEFI POPUP todosloscl MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF todosloscl PROM "\<Completo"
DEFI BAR 2 OF todosloscl PROM "\<Desde un Cliente"
DEFI BAR 3 OF todosloscl PROM "Desde - \<Hasta"
ON SELE BAR 1 OF todosloscl DO DISPLBL WITH 3,2,.T.,.F.,"C"
ON SELE BAR 2 OF todosloscl DO DISPLBL WITH 3,2,.F.,.F.,"C"
ON SELE BAR 3 OF todosloscl DO DISPLBL WITH 3,2,.f.,.t.,"C"

DEFI POPUP porzona MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF porzona PROM "\<Completo"
DEFI BAR 2 OF porzona PROM "\<Desde un Cliente"
DEFI BAR 3 OF porzona PROM "Desde - \<Hasta"
ON SELE BAR 1 OF porzona DO DISPLBL WITH 4,2,.T.,.F.,"C"
ON SELE BAR 2 OF porzona DO DISPLBL WITH 4,2,.F.,.F.,"C"
ON SELE BAR 3 OF porzona DO DISPLBL WITH 4,2,.f.,.t.,"C"

DEFI POPUP porletra MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF porletra PROM "\<Completo"
DEFI BAR 2 OF porletra PROM "\<Desde un Cliente"
DEFI BAR 3 OF porletra PROM "Desde - \<Hasta"
ON SELE BAR 1 OF porletra DO DISPLBL WITH 5,2,.T.,.F.,"C"
ON SELE BAR 2 OF porletra DO DISPLBL WITH 5,2,.F.,.F.,"C"
ON SELE BAR 3 OF porletra DO DISPLBL WITH 5,2,.f.,.t.,"C"

DEFI POPUP encabezado MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF encabezado PROM "\<Un Cliente"
DEFI BAR 2 OF encabezado PROM "Por \<Agrupación"
DEFI BAR 3 OF encabezado PROM "\<Todos los Clientes"
DEFI BAR 4 OF encabezado PROM "Por \<Zona"
DEFI BAR 5 OF encabezado PROM "Por \<Letra"
ON SELE BAR 1 OF encabezado DO DISPLBL WITH 1,1,.F.,.F.,"C"
ON BAR 2 OF encabezado ACTI POPUP _qyn16z3vt
ON BAR 3 OF encabezado ACTI POPUP _qyn170gxs
ON BAR 4 OF encabezado ACTI POPUP _qyn171f66
ON BAR 5 OF encabezado ACTI POPUP _qyn172a8v

DEFI POPUP _qyn16z3vt MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _qyn16z3vt PROM "\<Completo"
DEFI BAR 2 OF _qyn16z3vt PROM "\<Desde un Cliente"
DEFI BAR 3 OF _qyn16z3vt PROM "Desde - \<Hasta"
ON SELE BAR 1 OF _qyn16z3vt DO DISPLBL WITH 2,1,.T.,.F.,"C"
ON SELE BAR 2 OF _qyn16z3vt DO DISPLBL WITH 2,1,.F.,.F.,"C"
ON SELE BAR 3 OF _qyn16z3vt DO DISPLBL WITH 2,1,.F.,.T.,"C"

DEFI POPUP _qyn170gxs MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _qyn170gxs PROM "\<Completo"
DEFI BAR 2 OF _qyn170gxs PROM "\<Desde un Cliente"
DEFI BAR 3 OF _qyn170gxs PROM "Desde - \<Hasta"
ON SELE BAR 1 OF _qyn170gxs DO DISPLBL WITH 3,1,.T.,.F.,"C"
ON SELE BAR 2 OF _qyn170gxs DO DISPLBL WITH 3,1,.F.,.F.,"C"
ON SELE BAR 3 OF _qyn170gxs DO DISPLBL WITH 3,1,.f.,.t.,"C"

DEFI POPUP _qyn171f66 MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _qyn171f66 PROM "\<Cliente"
DEFI BAR 2 OF _qyn171f66 PROM "\<Desde un Cliente"
DEFI BAR 3 OF _qyn171f66 PROM "Desde - \<Hasta"
ON SELE BAR 1 OF _qyn171f66 DO DISPLBL WITH 4,1,.T.,.F.,"C"
ON SELE BAR 2 OF _qyn171f66 DO DISPLBL WITH 4,1,.F.,.F.,"C"
ON SELE BAR 3 OF _qyn171f66 DO DISPLBL WITH 4,1,.f.,.t.,"C"

DEFI POPUP _qyn172a8v MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _qyn172a8v PROM "\<Completo"
DEFI BAR 2 OF _qyn172a8v PROM "\<Desde un Cliente"
DEFI BAR 3 OF _qyn172a8v PROM "Desde  - \<Hasta"
ON SELE BAR 1 OF _qyn172a8v DO DISPLBL WITH 5,1,.t.,.F.,"C"
ON SELE BAR 2 OF _qyn172a8v DO DISPLBL WITH 5,1,.F.,.F.,"C"
ON SELE BAR 3 OF _qyn172a8v DO DISPLBL WITH 5,1,.f.,.t.,"C"

DEFI POPUP ranking MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF ranking PROM "Por \<Pantalla"
DEFI BAR 2 OF ranking PROM "Por \<Impresora"
ON BAR 1 OF ranking ACTI POPUP _r211bvuof
ON BAR 2 OF ranking ACTI POPUP _r211bvuog

DEFI POPUP _r211bvuof MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _r211bvuof PROM "\<Facturas"
DEFI BAR 2 OF _r211bvuof PROM "Notas \<de Débito"
DEFI BAR 3 OF _r211bvuof PROM "Notas de \<Crédito"
ON BAR 1 OF _r211bvuof ACTI POPUP facturas
ON BAR 2 OF _r211bvuof ACTI POPUP notasdedéb
ON BAR 3 OF _r211bvuof ACTI POPUP notasdecré

DEFI POPUP facturas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF facturas PROM "Completo"
DEFI BAR 2 OF facturas PROM "Por Agrupación"
DEFI BAR 3 OF facturas PROM "Por Zona"
ON SELE BAR 1 OF facturas do lrankc with .t.,"F",1
ON SELE BAR 2 OF facturas do lrankc with .t.,"F",2
ON SELE BAR 3 OF facturas do lrankc with .t.,"F",3

DEFI POPUP notasdedéb MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF notasdedéb PROM "\<Completo"
DEFI BAR 2 OF notasdedéb PROM "Por \<Agrupación"
DEFI BAR 3 OF notasdedéb PROM "Por \<Zona"
ON SELE BAR 1 OF notasdedéb do lrankc with .t.,"D",1
ON SELE BAR 2 OF notasdedéb do lrankc with .t.,"D",2
ON SELE BAR 3 OF notasdedéb do lrankc with .t.,"D",3

DEFI POPUP notasdecré MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF notasdecré PROM "\<Completo"
DEFI BAR 2 OF notasdecré PROM "Por \<Agrupación"
DEFI BAR 3 OF notasdecré PROM "Por \<Zona"
ON SELE BAR 1 OF notasdecré do lrankc with .t.,"C",1
ON SELE BAR 2 OF notasdecré do lrankc with .t.,"C",2
ON SELE BAR 3 OF notasdecré do lrankc with .t.,"C",3

DEFI POPUP _r211bvuog MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _r211bvuog PROM "\<Facturas"
DEFI BAR 2 OF _r211bvuog PROM "Notas \<de Débito"
DEFI BAR 3 OF _r211bvuog PROM "Notas de \<Crédito"
ON BAR 1 OF _r211bvuog ACTI POPUP _r211c157j
ON BAR 2 OF _r211bvuog ACTI POPUP _r211c157k
ON BAR 3 OF _r211bvuog ACTI POPUP _r211c157m

DEFI POPUP _r211c157j MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _r211c157j PROM "\<Completo"
DEFI BAR 2 OF _r211c157j PROM "Por \<Agrupación"
DEFI BAR 3 OF _r211c157j PROM "Por \<Zona"
ON SELE BAR 1 OF _r211c157j do lrankc with .f.,"F",1
ON SELE BAR 2 OF _r211c157j do lrankc with .f.,"F",2
ON SELE BAR 3 OF _r211c157j do lrankc with .f.,"F",3

DEFI POPUP _r211c157k MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _r211c157k PROM "\<Completo"
DEFI BAR 2 OF _r211c157k PROM "Por \<Agrupación"
DEFI BAR 3 OF _r211c157k PROM "Por \<Zona"
ON SELE BAR 1 OF _r211c157k do lrankc with .f.,"D",1
ON SELE BAR 2 OF _r211c157k do lrankc with .f.,"D",2
ON SELE BAR 3 OF _r211c157k do lrankc with .f.,"D",3

DEFI POPUP _r211c157m MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _r211c157m PROM "\<Completo"
DEFI BAR 2 OF _r211c157m PROM "Nota \<de Débito"
DEFI BAR 3 OF _r211c157m PROM "Nota de \<Crédito"
ON SELE BAR 1 OF _r211c157m do lrankc with .f.,"C",1
ON SELE BAR 2 OF _r211c157m do lrankc with .f.,"C",2
ON SELE BAR 3 OF _r211c157m do lrankc with .f.,"C",3

DEFI POPUP cuentacorr MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR  1 OF cuentacorr PROM "\<Por Pantalla"
DEFI BAR  2 OF cuentacorr PROM "Por \<Impresora"
DEFI BAR  3 OF cuentacorr PROMPT "\<Reimputa Pagos"
DEFI BAR  7 OF cuentacorr PROM "\-" BEFORE 4 SKIP FOR .T. 
DEFI BAR  4 OF cuentacorr PROM "Pasa a \<Histórico"
DEFI BAR  5 OF cuentacorr PROM "Borra Movimientos Saldo \<0"
DEFI BAR 11 OF cuentacorr PROM "\<Calcula Saldo Anterior" AFTER 5
DEFI BAR  8 OF cuentacorr PROM "Histórico por Pantalla"
DEFI BAR  9 OF cuentacorr PROM "Histórico por Impresora"
DEFI BAR 10 OF cuentacorr PROM "\-" SKIP FOR .T. 
DEFI BAR  6 OF cuentacorr PROM "Compacta el \<Archivo" AFTER 10

ON BAR 1 OF cuentacorr ACTI POPUP porpantall
ON BAR 2 OF cuentacorr ACTI POPUP porimpreso
ON BAR 3 OF cuentacorr ACTI POPUP reimputapa
ON SELE BAR 4 OF cuentacorr DO CLI
ON SELE BAR 5 OF cuentacorr DO CCLH0
ON SELE BAR 6 OF cuentacorr DO ctactec
ON SELE BAR 8 OF cuentacorr DO CLI
ON SELE BAR 9 OF cuentacorr DO CLI
ON SELE BAR 11 OF cuentacorr DO SALANT
DEFI POPUP porpantall MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF porpantall PROM "\<Un Cliente"
DEFI BAR 2 OF porpantall PROM "\<Resumido"
DEFI BAR 3 OF porpantall PROM "\<Resumido por Zona"
DEFI BAR 4 OF porpantall PROM "\<Completo"
ON SELE BAR 1 OF porpantall DO cli
ON SELE BAR 2 OF porpantall DO _r211c6iuz WITH .T.
ON SELE BAR 4 OF porpantall DO _r211c6ir0

DEFI POPUP porimpreso MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF porimpreso PROM "R\<esumido"
DEFI BAR 2 OF porimpreso PROM "Resumido por \<Zona"
DEFI BAR 3 OF porimpreso PROM "\-" ;
	SKIP FOR .t.
DEFI BAR 4 OF porimpreso PROM "\<Completo"
DEFI BAR 5 OF porimpreso PROM "C\<ompleto por Zona"
DEFI BAR 6 OF porimpreso PROM "\<Resumen de Cta un Cliente"
ON SELE BAR 1 OF porimpreso DO _r211c6iuz
ON SELE BAR 2 OF porimpreso DO _r211c6iw0
ON SELE BAR 4 OF porimpreso DO _r211c6ix6
ON SELE BAR 5 OF porimpreso DO _r211c6iy9
ON SELE BAR 6 OF porimpreso DO CLI

DEFI POPUP reimputapa MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF reimputapa PROMPT "\<Todos los Clientes"
DEFI BAR 2 OF reimputapa PROMPT "\<Un Cliente"
ON SELE BAR 1 OF reimputapa DO _r270u2050
ON SELE BAR 2 OF reimputapa DO _r270u2062


DEFI POPUP agenda MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF agenda PROM "\<Datos Generales"
DEFI BAR 2 OF agenda PROM "\<Legajo"
ON SELE BAR 1 OF agenda DO AGE
ON SELE BAR 2 OF agenda DO AGE

DEFI POPUP variables MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF variables PROM "Cantidad de \<Dígitos"
DEFI BAR 2 OF variables PROM "Ancho de la \<Hoja"
DEFI BAR 3 OF variables PROM "Ancho de la \<Impresora"
DEFI BAR 4 OF variables PROM "\<Popups a Utilizar"
ON SELE BAR 1 OF variables do acdigi
ON SELE BAR 2 OF variables do achoja.SPR
ON SELE BAR 3 OF variables do acancho.SPR
ON SELE BAR 4 OF variables do acpopu.spr

****
DEFI POPUP tiqueta MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF tiqueta PROM "\<Un Interesado"
DEFI BAR 2 OF tiqueta PROM "\<Por Agrupación"
DEFI BAR 3 OF tiqueta PROM "\<Todos los Interesados"
DEFI BAR 4 OF tiqueta PROM "Por \<Zona"
DEFI BAR 5 OF tiqueta PROM "Por \<Letra"
ON SELE BAR 1 OF tiqueta DO DISPLBL WITH 1,2,.F.,.F.,"I"
ON BAR 2 OF tiqueta ACTI POPUP PORAGRUPAI
ON BAR 3 OF tiqueta ACTI POPUP TODOSLOSCI
ON BAR 4 OF tiqueta ACTI POPUP PORZONI
ON BAR 5 OF tiqueta ACTI POPUP PORLETRI

DEFI POPUP PORAGRUPAI MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF PORAGRUPAI PROM "\<Completo"
DEFI BAR 2 OF PORAGRUPAI PROM "\<Desde un Cliente"
DEFI BAR 3 OF PORAGRUPAI PROM "Desde - \<Hasta"
ON SELE BAR 1 OF PORAGRUPAI DO DISPLBL WITH 2,2,.T.,.F.,"I"
ON SELE BAR 2 OF PORAGRUPAI DO DISPLBL WITH 2,2,.F.,.F.,"I"
ON SELE BAR 3 OF PORAGRUPAI DO DISPLBL WITH 2,2,.f.,.t.,"I"

DEFI POPUP TODOSLOSCI MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF TODOSLOSCI PROM "\<Completo"
DEFI BAR 2 OF TODOSLOSCI PROM "\<Desde un Cliente"
DEFI BAR 3 OF TODOSLOSCI PROM "Desde - \<Hasta"
ON SELE BAR 1 OF TODOSLOSCI DO DISPLBL WITH 3,2,.T.,.F.,"I"
ON SELE BAR 2 OF TODOSLOSCI DO DISPLBL WITH 3,2,.F.,.F.,"I"
ON SELE BAR 3 OF TODOSLOSCI DO DISPLBL WITH 3,2,.f.,.t.,"I"

DEFI POPUP PORZONI MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF PORZONI PROM "\<Completo"
DEFI BAR 2 OF PORZONI PROM "\<Desde un Cliente"
DEFI BAR 3 OF PORZONI PROM "Desde - \<Hasta"
ON SELE BAR 1 OF PORZONI DO DISPLBL WITH 4,2,.T.,.F.,"I"
ON SELE BAR 2 OF PORZONI DO DISPLBL WITH 4,2,.F.,.F.,"I"
ON SELE BAR 3 OF PORZONI DO DISPLBL WITH 4,2,.f.,.t.,"I"

DEFI POPUP PORLETRI MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF PORLETRI PROM "\<Completo"
DEFI BAR 2 OF PORLETRI PROM "\<Desde un Cliente"
DEFI BAR 3 OF PORLETRI PROM "Desde - \<Hasta"
ON SELE BAR 1 OF PORLETRI DO DISPLBL WITH 5,2,.T.,.F.,"I"
ON SELE BAR 2 OF PORLETRI DO DISPLBL WITH 5,2,.F.,.F.,"I"
ON SELE BAR 3 OF PORLETRI DO DISPLBL WITH 5,2,.f.,.t.,"I"

DEFI POPUP encabezado MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF encabezado PROM "\<Un Cliente"
DEFI BAR 2 OF encabezado PROM "Por \<Agrupación"
DEFI BAR 3 OF encabezado PROM "\<Todos los Clientes"
DEFI BAR 4 OF encabezado PROM "Por \<Zona"
DEFI BAR 5 OF encabezado PROM "Por \<Letra"
ON SELE BAR 1 OF encabezado DO DISPLBL WITH 1,1,.F.,.F.,"I"
ON BAR 2 OF encabezado ACTI POPUP _goy16z3vt
ON BAR 3 OF encabezado ACTI POPUP _qyn170gxs
ON BAR 4 OF encabezado ACTI POPUP _qyn171f66
ON BAR 5 OF encabezado ACTI POPUP _qyn172a8v

DEFI POPUP _goy16z3vt MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _goy16z3vt PROM "\<Completo"
DEFI BAR 2 OF _goy16z3vt PROM "\<Desde un Cliente"
DEFI BAR 3 OF _goy16z3vt PROM "Desde - \<Hasta"
ON SELE BAR 1 OF _goy16z3vt DO DISPLBL WITH 2,1,.T.,.F.,"I"
ON SELE BAR 2 OF _goy16z3vt DO DISPLBL WITH 2,1,.F.,.F.,"I"
ON SELE BAR 3 OF _goy16z3vt DO DISPLBL WITH 2,1,.F.,.T.,"I"

DEFI POPUP _goy170gxs MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _goy170gxs PROM "\<Completo"
DEFI BAR 2 OF _goy170gxs PROM "\<Desde un Cliente"
DEFI BAR 3 OF _goy170gxs PROM "Desde - \<Hasta"
ON SELE BAR 1 OF _goy170gxs DO DISPLBL WITH 3,1,.T.,.F.,"I"
ON SELE BAR 2 OF _goy170gxs DO DISPLBL WITH 3,1,.F.,.F.,"I"
ON SELE BAR 3 OF _goy170gxs DO DISPLBL WITH 3,1,.f.,.t.,"I"

DEFI POPUP _goy171f66 MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _goy171f66 PROM "\<Cliente"
DEFI BAR 2 OF _goy171f66 PROM "\<Desde un Cliente"
DEFI BAR 3 OF _goy171f66 PROM "Desde - \<Hasta"
ON SELE BAR 1 OF _goy171f66 DO DISPLBL WITH 4,1,.T.,.F.,"I"
ON SELE BAR 2 OF _goy171f66 DO DISPLBL WITH 4,1,.F.,.F.,"I"
ON SELE BAR 3 OF _goy171f66 DO DISPLBL WITH 4,1,.f.,.t.,"I"

DEFI POPUP _goy172a8v MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _goy172a8v PROM "\<Completo"
DEFI BAR 2 OF _goy172a8v PROM "\<Desde un Cliente"
DEFI BAR 3 OF _goy172a8v PROM "Desde  - \<Hasta"
ON SELE BAR 1 OF _goy172a8v DO DISPLBL WITH 5,1,.t.,.F.,"I"
ON SELE BAR 2 OF _goy172a8v DO DISPLBL WITH 5,1,.F.,.F.,"I"
ON SELE BAR 3 OF _goy172a8v DO DISPLBL WITH 5,1,.f.,.t.,"I"

DEFI POPUP GENBASDA MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF GENBASDA PROM "\<Un Cliente"
DEFI BAR 2 OF GENBASDA PROM "\<Por Agrupación"
DEFI BAR 3 OF GENBASDA PROM "\<Todos los Clientes"
DEFI BAR 4 OF GENBASDA PROM "Por \<Zona"
DEFI BAR 5 OF GENBASDA PROM "Por \<Letra"
ON SELE BAR 1 OF GENBASDA DO DISPLBL WITH 1,3,.F.,.F.,"C",.T.
ON BAR 2 OF GENBASDA ACTI POPUP GENporagr
ON BAR 3 OF GENBASDA ACTI POPUP GENtodos
ON BAR 4 OF GENBASDA ACTI POPUP GENporzo
ON BAR 5 OF GENBASDA ACTI POPUP GENporlet

DEFI POPUP GENporagr MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF GENporagr PROM "\<Completo"
DEFI BAR 2 OF GENporagr PROM "\<Desde un Cliente"
DEFI BAR 3 OF GENporagr PROM "Desde - \<Hasta"
ON SELE BAR 1 OF GENporagr DO DISPLBL WITH 2,3,.T.,.F.,"C"
ON SELE BAR 2 OF GENporagr DO DISPLBL WITH 2,3,.F.,.F.,"C"
ON SELE BAR 3 OF GENporagr DO DISPLBL WITH 2,3,.f.,.t.,"C"

DEFI POPUP GENtodos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF GENtodos PROM "\<Completo"
DEFI BAR 2 OF GENtodos PROM "\<Desde un Cliente"
DEFI BAR 3 OF GENtodos PROM "Desde - \<Hasta"
ON SELE BAR 1 OF GENtodos DO DISPLBL WITH 3,3,.T.,.F.,"C"
ON SELE BAR 2 OF GENtodos DO DISPLBL WITH 3,3,.F.,.F.,"C"
ON SELE BAR 3 OF GENtodos DO DISPLBL WITH 3,3,.f.,.t.,"C"

DEFI POPUP GENporzo MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF GENporzo PROM "\<Completo"
DEFI BAR 2 OF GENporzo PROM "\<Desde un Cliente"
DEFI BAR 3 OF GENporzo PROM "Desde - \<Hasta"
ON SELE BAR 1 OF GENporzo DO DISPLBL WITH 4,3,.T.,.F.,"C"
ON SELE BAR 2 OF GENporzo DO DISPLBL WITH 4,3,.F.,.F.,"C"
ON SELE BAR 3 OF GENporzo DO DISPLBL WITH 4,3,.f.,.t.,"C"

DEFI POPUP GENporlet MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF GENporlet PROM "\<Completo"
DEFI BAR 2 OF GENporlet PROM "\<Desde un Cliente"
DEFI BAR 3 OF GENporlet PROM "Desde - \<Hasta"
ON SELE BAR 1 OF GENporlet DO DISPLBL WITH 5,3,.T.,.F.,"C"
ON SELE BAR 2 OF GENporlet DO DISPLBL WITH 5,3,.F.,.F.,"C"
ON SELE BAR 3 OF GENporlet DO DISPLBL WITH 5,3,.f.,.t.,"C"


****

*       *********************************************************
*       *
*       *                 Cleanup Code & Procedures
*       *
*       *********************************************************
*

DO WHILE LAST()#27
   UNLO ALL
   ACTI MENU MAIN
ENDDO
SET SYSM TO DEFA
RETURN


*       *********************************************************
*       *
*       * _R211C6H1A  ON SELE BAR 1 OF POPUP varios
*       *
*       * Procedure Origin:
*       *
*       * From Menu:  CLIENTES.MPR,            Record:    5
*       * Called By:  ON SELE BAR 1 OF POPUP varios
*       * PROM:     Ciudades
*       * Snippet:    1
*       *
*       *********************************************************
*
PROCEDURE _r211c6h1a
=OPPRV()
=OPCIU()
DO GRL WITH 4,5,'Menú de Ciudades'
ON SELE POPU grl DO ciu
ACTI POPU grl
RELE POPU grl



*       *********************************************************
*       *
*       * _R211C6H7P  ON SELE BAR 6 OF POPUP clientes
*       *
*       * Procedure Origin:
*       *
*       * From Menu:  CLIENTES.MPR,            Record:   62
*       * Called By:  ON SELE BAR 6 OF POPUP clientes
*       * PROM:     Cumpleaños
*       * Snippet:    2
*       *
*       *********************************************************
*
PROCEDURE _r211c6h7p
=OPPER()
=OPMIX()
STORE NUL TO M.RESPUESTA
M.elmes=INFIC("Mes a Listar",12)
if last()#27 .AND. !EMPTY(M.ELMES)
    TT="Listado de Clientes"
    TT1="Cumpleaños de "+QMES(M.ELMES)
    SELE PER
    SET ORDER TO TAG CLIENTES
    repo form lpercum ;
    for month(per.fechanac)=m.elmes ;
    to printer prompt noconsole 
ENDIF

*       *********************************************************
*       *
*       * _R211C6IR0  ON SELE BAR 4 OF POPUP porpantall
*       *
*       * Procedure Origin:
*       *
*       * From Menu:  CLIENTES.MPR,            Record:  107
*       * Called By:  ON SELE BAR 4 OF POPUP porpantall
*       * PROM:     Completo
*       * Snippet:    5
*       *
*       *********************************************************
*
PROCEDURE _r211c6ir0
ULPR="LCCLUT"
=OPCLI()
SET ORDER TO TAG CODCLI
=OPCCL()
SET RELA TO CODCLI INTO PER
TMP=GENTMP()
=WORKING()
SORT ON PER.CLIENTE,FECHAOP TO (TMP) FOR !DELE()
SELE CCL
USE
USE (TMP) ALIAS CCL
=UNWORK()
STORE NUL TO RESPUESTA
repo form LCCLt prev noconsole
=OFF_TMP()


*       *********************************************************
*       *
*       * _R211C6IUZ  ON SELE BAR 1 OF POPUP porimpreso
*       *
*       * Procedure Origin:
*       *
*       * From Menu:  CLIENTES.MPR,            Record:  110
*       * Called By:  ON SELE BAR 1 OF POPUP porimpreso
*       * PROM:     Resumido
*       * Snippet:    6
*       *
*       *********************************************************
*
PROCEDURE _r211c6iuz
PARAMETER PORPAN
ULPR="LCCLUT"
store .F. to resumen
=OPCLI()
SET ORDER TO TAG CODCLI
=OPCCL()
SET RELA TO CODCLI INTO PER
TMP=GENTMP()
=WORKING()
SORT ON PER.CLIENTE,FECHAOP TO (TMP)  FOR !DELE()
SELE CCL
USE
USE (TMP) ALIAS CCL
=UNWORK()
STORE NUL TO RESPUESTA
IF PORPAN
repo form LCCLt PREV summ
ELSE
repo form LCCLt to prin PROMPT noconsole summ
ENDIF
=OFF_TMP()
RETURN

*       *********************************************************
*       *
*       * _R211C6IW0  ON SELE BAR 2 OF POPUP porimpreso
*       *
*       * Procedure Origin:
*       *
*       * From Menu:  CLIENTES.MPR,            Record:  111
*       * Called By:  ON SELE BAR 2 OF POPUP porimpreso
*       * PROM:     Resumido por Zona
*       * Snippet:    7
*       *
*       *********************************************************
*
PROCEDURE _r211c6iw0
ULPR="LCCLUTZ"
store .F. to resumen
DO OPZON
IF ELIZON("a Listar",-1,1)
lazon=left(mix.texto2,2)
=OPCLI()

SET ORDER TO TAG CODCLI
=OPCCL()
SET RELA TO CODCLI INTO PER
TMP=GENTMP()
=WORKING()
SORT ON PER.CLIENTE,FECHAOP TO (TMP) ;
for !DELE() .AND. per.texto1=lazon
tt="Zona:"+alltrim(mix.texto1)
SELE CCL
USE
USE (TMP) ALIAS CCL
=UNWORK()
STORE NUL TO RESPUESTA
repo form LCCLt to prin PROMPT noconsole summ
=OFF_TMP()
endif


*       *********************************************************
*       *
*       * _R211C6IX6  ON SELE BAR 4 OF POPUP porimpreso
*       *
*       * Procedure Origin:
*       *
*       * From Menu:  CLIENTES.MPR,            Record:  114
*       * Called By:  ON SELE BAR 4 OF POPUP porimpreso
*       * PROM:     Completo
*       * Snippet:    8
*       *
*       *********************************************************
*
PROCEDURE _r211c6ix6
ULPR="LCCLUT"
store .T. to resumen
=OPCLI()
SET ORDER TO TAG CODCLI
=OPCCL()
SET RELA TO CODCLI INTO PER
TMP=GENTMP()
=WORKING()
SORT ON PER.CLIENTE,FECHAOP TO (TMP) FOR !DELE()
SELE CCL
USE
USE (TMP) ALIAS CCL
=UNWORK()
STORE NUL TO RESPUESTA
repo form LCCLt to prin PROMPT noconsole
=OFF_TMP()


*       *********************************************************
*       *
*       * _R211C6IY9  ON SELE BAR 5 OF POPUP porimpreso
*       *
*       * Procedure Origin:
*       *
*       * From Menu:  CLIENTES.MPR,            Record:  115
*       * Called By:  ON SELE BAR 5 OF POPUP porimpreso
*       * PROM:     Completo por Zona
*       * Snippet:    9
*       *
*       *********************************************************
*
PROCEDURE _r211c6iy9
ULPR="LCCLTZ"
store .T. to resumen
DO OPZON
IF ELIZON("a Listar",-1,1)
lazon=left(mix.texto2,2)
=OPCLI()

SET ORDER TO TAG CODCLI
=OPCCL()
SET RELA TO CODCLI INTO PER
TMP=GENTMP()
=WORKING()
SORT ON PER.CLIENTE,FECHAOP TO (TMP) ;
for !DELE() .AND. per.texto1=lazon
tt="Zona:"+alltrim(mix.texto1)
SELE CCL
USE
USE (TMP) ALIAS CCL
=UNWORK()
STORE NUL TO RESPUESTA
repo form LCCLt to prin PROMPT noconsole
=OFF_TMP()
endif

*       *********************************************************
*       *
*       * _R270U2050  ON SELE BAR 1 OF POPUP reimputapa
*       *
*       * Procedure Origin:
*       *
*       * From Menu:  FACTURAS.MPR,            Record:   75
*       * Called By:  ON SELE BAR 1 OF POPUP reimputapa
*       * Prompt:     Todos los Clientes
*       * Snippet:    28
*       *
*       *********************************************************
*
PROCEDURE _r270u2050
IF CONFIRMA("Reimputar Pagos de Clientes",.t.,10,0)
=OPCLI()
=OPCCL()
SET ORDER TO TAG CODCLI
SELE PER
SCAN
WAIT "CLIENTE:"+ALLTRIM(PER.CLIENTE) WIND NOWA
SELE CCL
IF SEEK(PER.CODCLI)
do imputaut
else
WAIT "CLIENTE:"+ALLTRIM(PER.CLIENTE)+" SIN MOVIMIENTO EN Cta. Cte." WIND NOWA
ENDIF
SELE PER
ENDSCAN
=WCL()
ENDIF


*       *********************************************************
*       *
*       * _R270U2062  ON SELE BAR 2 OF POPUP reimputapa
*       *
*       * Procedure Origin:
*       *
*       * From Menu:  FACTURAS.MPR,            Record:   76
*       * Called By:  ON SELE BAR 2 OF POPUP reimputapa
*       * Prompt:     Un Cliente
*       * Snippet:    29
*       *
*       *********************************************************
*
PROCEDURE _r270u2062
=OPCLI()
IF ELICLI("a Reimputar",-1,1)
   IF CONFIRMA("Reimputar Pagos de "+ALLTRIM(PER.CLIENTE),.t.,10,0)
      =OPCCL()
      SET ORDER TO TAG CODCLI
      SELE PER
      WAIT "CLIENTE:"+ALLTRIM(PER.CLIENTE) WIND NOWA
      SELE CCL
      IF SEEK(PER.CODCLI)
         do imputaut
      else
         WAIT "CLIENTE:"+ALLTRIM(PER.CLIENTE)+" SIN MOVIMIENTO EN Cta. Cte." WIND NOWA
      ENDIF
      =WCL()
   endif
else
   =noselec("CLIENTE")
ENDIF

