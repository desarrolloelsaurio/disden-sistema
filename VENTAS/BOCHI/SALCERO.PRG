********************************************************************************
*-- Programa: SALCERO.PRG
*-- Fecha   : 26/10/89
*-- Version : G. REINER
*-- Notas   : BORRA FICHA CTA CTE EN CLIENTE DEBE=HABER
********************************************************************************
DEFI POPU AUD FROM 13,20 MESS 'Moneda en la que se emite el resumen'
DEFI BAR 1 OF AUD PROM ' Pesos'
DEFI BAR 2 OF AUD PROM ' D¢lares '
ON SELE POPU AUD DO RESP1
RESPUESTA=0
ACTI POPU AUD
IF !EMPTY(RESPUESTA)
   MONEDA=RESPUESTA
   IF MONEDA=1
      MND=.F.
   ELSE
      MND=.T.
   ENDI
   RELE POPU AUD
   DEFI WIND WIN FROM 10,0 TO 12,79 DOUB
   ACTI WIND WIN
   @ 0,0 SAY '******************************* ESTOY PENSANDO *******************************' color w*
   SELE CTA1
   SET ORDER TO TAG FACCLIENTE
   GO TOP
   DEBE=0
   HABER=0
   CLIENTE=FACCLIENTE
   FICHA=RECNO()
   DO WHIL !EOF()
      DO WHIL CLIENTE=FACCLIENTE .AND. !EOF()
         IF !CTACTE
            IF ENDOL=MND
               IF MONEDA=1
                  KESEF=CTAMONTO
               ELSE
                  KESEF=CTADOL
               ENDI
               IF CTACOMPRA
                  DEBE=DEBE+KESEF
               ELSE
                  HABER=HABER+KESEF
               ENDI
            ENDI
         ENDI
         SKIP
      ENDD
      IF ABS(DEBE-HABER)<=1
         GO FICHA
         DO WHIL CLIENTE=FACCLIENTE .AND. !EOF()
            IF !CTACTE
               IF ENDOL=MND
                  DELETE RECORD RECNO()
               ENDI
            ENDI
            SKIP
         ENDD
      ENDI
      DEBE=0
      HABER=0
      FICHA=RECNO()
      CLIENTE=FACCLIENTE
   ENDD
 
   GO TOP
   DEBE=0
   HABER=0
   CLIENTE=FACCLIENTE
   FICHA=RECNO()
   DO WHIL !EOF()
      DO WHIL CLIENTE=FACCLIENTE .AND. !EOF()
         IF CTACTE
            IF ENDOL=MND
               IF MONEDA=1
                  KESEF=CTAMONTO
               ELSE
                  KESEF=CTADOL
               ENDI
               IF CTACOMPRA
                  DEBE=DEBE+KESEF
               ELSE
                  HABER=HABER+KESEF
               ENDI
            ENDI
         ENDI
         SKIP
      ENDD
      IF ABS(DEBE-HABER)<=1
         GO FICHA
         DO WHIL CLIENTE=FACCLIENTE .AND. !EOF()
            IF CTACTE
               IF ENDOL=MND
                  DELETE RECORD RECNO()
               ENDI
            ENDI
            SKIP
         ENDD
      ENDI
      DEBE=0
      HABER=0
      FICHA=RECNO()
      CLIENTE=FACCLIENTE
   ENDD
   SELE CTA
   SET ORDER TO TAG FACCLIENTE
   GO TOP
   DEBE=0
   HABER=0
   CLIENTE=FACCLIENTE
   FICHA=RECNO()
   DO WHIL !EOF()
      DO WHIL CLIENTE=FACCLIENTE .AND. !EOF()
         IF ENDOL=MND
            IF MONEDA=1
               KESEF=CTAMONTO
            ELSE
               KESEF=CTADOL
            ENDI
            IF CTACOMPRA
               DEBE=DEBE+KESEF
            ELSE
               HABER=HABER+KESEF
            ENDI
         ENDI
         SKIP
      ENDD
      IF ABS(DEBE-HABER)<=1
         GO FICHA
         DO WHIL CLIENTE=FACCLIENTE .AND. !EOF()
            IF ENDOL=MND
               DELETE RECORD RECNO()
            ENDI
            SKIP
         ENDD
      ENDI
      DEBE=0
      HABER=0
      FICHA=RECNO()
      CLIENTE=FACCLIENTE
   ENDD
   DEAC WIND ALL
ENDI
RETURN
