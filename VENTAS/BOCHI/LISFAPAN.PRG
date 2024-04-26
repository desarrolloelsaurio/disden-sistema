*****************************************************
*-- Programa: LISFAPAN.PRG
*-- Fecha   : 29/12/89
*-- Version : G. REINER
*-- Notas   : LISTA SALDO FACTURADO
****************************************************
ON ERROR QUIT
ON ESCAPE RETURN TO MASTER
STOR NUL TO RESPUESTA
DO LIMERPAI
DEAC WIND ALL
ON ESCAPE
ON ERROR
IF RESPUESTA=1
   RESPU=RESPUESTA
   DEFI POPU AUD FROM 12,20 MESS 'Moneda en la que se emite el resumen'
   DEFI BAR 1 OF AUD PROM ' Pesos'
   DEFI BAR 2 OF AUD PROM ' D¢lares '
   ON SELE POPU AUD DO RESP1
   STOR NUL TO RESPUESTA
   ACTI POPU AUD
   IF !EMPTY(RESPUESTA)
      MONEDA=RESPUESTA
      RELE POPU AUD
      SELE FAC1
      DEFI WIND WLI from 10,1 to 17,78 DOUB
      ACTI WIND WLI
      FEIN=DATE()
      DO TIT1 WITH 1," INGRESE FECHA ",'I'
      @ 4,1 SAY "INGRESE FECHA INICIAL " GET FEIN
      READ
      FEFI=FEIN
      @ 4,1 SAY "INGRESE SEGUNDA FECHA " GET FEFI
      READ
      DEFI WIND WIN FROM 10,0 TO 14,79 DOUB
      DEAC WIND WLI
      ACTI WIND WIN
      CLEAR
      DO TIT2 WITH 1,' ESPERE POR FAVOR - CALCULANDO ','I*/W',78
      STOR NUL TO GRAVADO,NOGRAVADO,IVA,LEY
      sele fac1
      IF MONEDA=1
         CALCULATE SUM(FACMONTOG),SUM(FACMONTONG),SUM(FACIVA),SUM(FACLEY) TO GRAVADO,NOGRAVADO,IVA,LEY FOR facfiltro#"RE" .and. facfecha>=fein .and. facfecha<=fefi .and. !endol
         MN=' P'
      ELSE
         CALCULATE SUM(FACMONTOG/DOLREF),SUM(FACMONTONG/DOLREF),SUM(FACIVA/DOLREF),SUM(FACLEY/DOLREF) TO GRAVADO,NOGRAVADO,IVA,LEY FOR facfiltro#"RE" .and. facfecha>=fein .and. facfecha<=fefi .and. endol
         MN=' u$s'
      ENDI
      DEFI WIND WIN FROM 8,20 TO 21,60
      ACTI WIND WIN
      ?
      ? ' TOTALES DESDE ' STYLE 'U'
      ?? FEIN STYLE 'I'
      ?? ' HASTA ' STYLE 'U'
      ?? FEFI STYLE 'I'
      ? ' LISTADO EN '
      ?? IIF(MONEDA=1,'Pesos','D¢lares')
      ?
      ? ' '
      ?? 'BRUTO      ' STYLE 'U'
      ?? STR(GRAVADO+NOGRAVADO,16,2) STYLE 'I'
      ?? MN
      ? ' '
      ?? 'IVA        ' STYLE 'U'
      ?? str(IVA,16,2) STYLE 'I'
      ?? MN
      ? " "
      ?? STR(DOSSEIS,4,2)+' %     ' STYLE 'U'
      ?? str(LEY,16,2) STYLE 'I'
      ?? MN
      ?
      ? ' '
      ?? 'TOTAL      ' STYLE 'I'
      ?? STR(GRAVADO+NOGRAVADO+IVA+LEY,16,2) STYLE 'I'
      ?? MN
      =INKEY(0,'HM')
   ENDI
   RELE WIND WIN
ENDI
RETURN
