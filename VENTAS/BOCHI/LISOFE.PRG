*********************************
*-- Programa: LISOFE.PRG
*-- Fecha   : 4/10/89
*-- Version : G. REINER
*-- Notas   : LISTADO DE OFERTAS
*********************************
FINMER=reccount("mer")+1
REST FROM ..\VENTASA\ARR ADDI
REST FROM ..\VENTASA\DOLAR ADDI
SET MESS TO 'INGRESE PRECIO DE LA OFERTA'
STOR 0 TO RESPUESTA
ACTI POPU PRECIO1
PRECIOS=RESPUESTA
IF !EMPTY(PRECIOS)
   SET MESS TO 'ES OFERTA MINORISTA O MAYORISTA ?'
   ACTI POPU MAYO
   MMAAYY=RESPUESTA
   IF MMAAYY#0
      DEFI POPU AUD FROM 13,20 MESS 'Moneda en la que se emite el resumen'
      DEFI BAR 1 OF AUD PROM ' Pesos'
      DEFI BAR 2 OF AUD PROM ' D¢lares '
      ON SELE POPU AUD DO RESP1
      STOR NUL TO RESPUESTA
      ACTI POPU AUD
      IF !EMPTY(RESPUESTA)
         MONEDA=RESPUESTA
         RELE POPU AUD
         DEFI WIND WIN FROM 0,0 TO 22,79 DOUB
         ACTI WIND WIN
         DO TIT1 WITH 1,' INGRESA 1§ RENGLON DE TEXTO ','i'
         STOR .T. TO PRIM
         DO WHIL PRIM
            m.texto1=SPACE(40)
            @ 10,1 SAY 'INGRESE 1§ TEXTO ' GET m.texto1 MESS '1§ TEXTO TITULO'
            READ
            STOR IIF(CONFIRM1('EL 1§ TEXTO',15),.F.,.T.) TO PRIM
         ENDD
         DO TIT1 WITH 1,' INGRESA 2§ RENGLON DE TEXTO ','i'
         STOR .T. TO PRIM
         DO WHIL PRIM
            m.texto2=SPACE(40)
            @ 15,1 SAY 'INGRESE 2§ TEXTO ' GET m.texto2 MESS '2§ TEXTO TITULO'
            READ
            STOR IIF(CONFIRM1('EL 2§ TEXTO',18),.F.,.T.) TO PRIM
         ENDD
         CLEA
         DO TIT1 WITH 1,'INGRESA 1§ RENGLON PIE DE PAGINA','I'
         STOR .T. TO PRIM
         DO WHIL PRIM
            m.texto3=SPACE(40)
            @ 10,1 SAY 'INGRESE 1§ TEXTO ' GET m.texto3 MESS '1§ TEXTO PIE DE PAGINA'
            READ
            STOR IIF(CONFIRM1('EL 1§ PIE',15),.F.,.T.) TO PRIM
         ENDD
         DO TIT1 WITH 1,'INGRESA 2§ RENGLON PIE DE PAGINA','I'
         STOR .T. TO PRIM
         DO WHIL PRIM
            m.texto4=SPACE(40)
            @ 15,1 SAY 'INGRESE 2§ TEXTO ' GET m.texto4 MESS '2§ TEXTO PIE DE PAGINA'
            READ
            STOR IIF(CONFIRM1('EL 2§ PIE',18),.F.,.T.) TO PRIM
         ENDD
         DEAC WIND ALL
         SET MESS TO 'LISTA DE OFERTAS - ELECCION DE MERCADERIAS'
         ON SELE POPU MERMER DO LISOFE1
         ACTI POPU MERMER
      ENDI
   ENDI
ENDI
DEAC WIND ALL
RETURN
