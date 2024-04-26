**************************************************************************
*-- Programa: SALCERUN.PRG
*-- Fecha   : 10.04.90
*-- Version : G. REINER
*-- Notas   : BORRA DATOS DE UN SOLO CLIENTE
***************************************************************************
FINCLI=RECCOUNT('PER')
DEFI WIND WLI from 10,1 to 17,78 DOUB
ACTI WIND WLI
DO TIT1 WITH 1,"INGRESE FICHA CLIENTE P/SALDAR CTA. CTE.",'I'
@ 4,1 SAY "INGRESE FICHA ('0' PARA MENU) " GET RESPUESTA
READ
IF RESPUESTA>=0 .AND. RESPUESTA<FINCLI
   DEAC WIND WLI
   CLIENTE=RESPUESTA
   RESPUESTA=0
   DO LIMERPAI
   IF !EMPTY(RESPUESTA)
      RESPU=RESPUESTA
      DEFI POPU AUD FROM 7,20 MESS 'Moneda de los montos a saldar'
      DEFI BAR 1 OF AUD PROM ' Pesos'
      DEFI BAR 2 OF AUD PROM ' D¢lares '
      ON SELE POPU AUD DO RESP1
      RESPUESTA=0
      ACTI POPU AUD
      IF !EMPTY(RESPUESTA)
         MONEDA=RESPUESTA
         RELE POPU AUD
         IF MONEDA=1
            MND=.F.
         ELSE
            MND=.T.
         ENDI
         IF RESPU=1
            SELE CTA
         ELSE
            SELE CTA1
         ENDI
         IF RESPU=1
            DELETE ALL FOR FACCLIENTE=CLIENTE .AND. ENDOL=MND
            SELE CTA1
            DELETE ALL FOR FACCLIENTE=CLIENTE .AND. CTACTE .AND. ENDOL=MND
         ELSE
            IF RESPU=2
               DELETE ALL FOR FACCLIENTE=CLIENTE .AND. ENDOL=MND
               SELE CTA
               DELETE ALL FOR FACCLIENTE=CLIENTE .AND. ENDOL=MND
            ELSE
               DELETE ALL FOR FACCLIENTE=CLIENTE .AND. !CTACTE .AND. ENDOL=MND
            ENDI
         ENDI
      ENDI
   ENDI
ENDI
DEAC WIND ALL
RETURN
