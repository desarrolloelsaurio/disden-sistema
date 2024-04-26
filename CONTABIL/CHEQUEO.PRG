*
*                       CHEQUEO DEL ESTADO DEL SISTEMA
*
* CHEQUEO.PRG
*
store "CHEQUEO DEL SISTEMA" to TITULO
IF HAYMOV()
   STORE KPERIODO TO XX2
   if confirm1("CHEQUEAR EL SISTEMA")
      =RECUADRO(10,10,15,70)
      SELE MOV
      SET ORDER TO TAG MOVIMIE
      GO TOP
      STORE 0 TO TDEBE,THABER,NROASI,KASIENTO,KMOVIMIENTO
      SCAN
         IF NROASI#MOV.ASIENTO
            if round(TDEBE,2)#round(THABER,2)
               ELPERIODO=MOV.PERIODO
               ELASIENTO=MOV.ASIENTO
               =MUESTRA()
               IF PREGUNTA("CANCELA")
                  IF CONFIRM1("CANCELAR EL ASIENTO")
                     do BORRA
                  endif
               endif
               RELE WIND WIN0
               ACTI WIND WIN
               SEEK STR(ELPERIODO,2)+STR(ELASIENTO,4)
            endif
            ***********************
            store MOV.PERIODO to KPERIODO
            store MOV.ASIENTO to NROASI
            @1,5 say "Mes: "+KMESES[MOV.PERIODO]
            @2,5 say "CHEQUEANDO:   Asiento        Movimiento              "
            @2,27 say NROASI picture "####"
            store 0 to TDEBE,THABER
         ENDIF
         @2,45 say MOV.MOVIMIENTO picture "####"
         store TDEBE+MOV.DEBE to TDEBE
         store THABER+MOV.HABER to THABER
      ENDSCAN
      SELE MOV
      SET ORDER TO
      CLEA
      FOR C=1 TO 12
         @ 2,0 SAY PADC("RECONSTRUYENDO MES DE "+ALLTRIM(KMESES[C]),WCOLS())
         CALC MAX(ASIENTO),MAX(MOVIMIENTO) ;
           FOR PERIODO=C ;
           TO KASIENTO[C],KMOVIMIENTO[C]
         store KASIENTO[C]+1 to KASIENTO[C]
         store KMOVIMIENTO[C]+1 to KMOVIMIENTO[C]
      NEXT
      do GRABA
      store XX2 to KPERIODO
      SET ORDER TO TAG MOVIMIE
      DO RECONSTR WITH .T.
   ENDIF
ENDIF
=MEN_LIN(SYSNOMBRE)
DO PRESEN
return
