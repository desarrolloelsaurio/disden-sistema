*
*                       CHEQUEO DEL ESTADO DEL SISTEMA
*
* CHEQUEO.PRG
*
store "CHEQUEO DEL SISTEMA" to TITULO
DO HAYMOV
IF HAYMOV
   public MDEBE,MHABER,TDEBE,THABER,NROASI,NROMOV,DEB,HAB
   do RECUADRO
   @10,10 say "Confirma (S/N)"
   store " " to RES
   @10,25 get RES picture PAIP valid RES="S" .or. RES="N" .or. RES=" "
   read
   if RES#"S"
      release MDEBE,MHABER,TDEBE,THABER,NROASI,NROMOV,DEB,HAB
      return
   endif
   store KPERIODO to XX2
   SELE MOV
   go top
   do while .not. eof()
      if ASIENTO>KASIENTO[PERIODO]
         store ASIENTO to KASIENTO[PERIODO]
      endif
      if MOVIMIENTO>KMOVIMIENTO[PERIODO]
         store MOVIMIENTO to KMOVIMIENTO[PERIODO]
      endif
      @14,15 say "Mes: "+KMESES[PERIODO]
      @15,15 say "CHEQUEANDO:   Asiento        Movimiento              "
      store "DEBE"+ltrim(str(XX,2))  to DEB
      store "HABER"+ltrim(str(XX,2)) to HAB
      store 0 to TDEBE,THABER
      store ASIENTO to NROASI
      @15,37 say NROASI picture "####"
      do while ASIENTO=NROASI
         if MOVIMIENTO>KMOVIMIENTO[PERIODO]
            store MOVIMIENTO to KMOVIMIENTO[PERIODO]
         endif
         store MOVIMIENTO to NROMOV
         @15,55 say NROMOV picture "####"
         store TDEBE+DEBE to TDEBE
         store THABER+HABER to THABER
         skip
      enddo
      if round(TDEBE,2)#round(THABER,2)
         skip -1
         store PERIODO to KPERIODO
         do MUESTRA
         store " " to RES
         @23,30 say "Cancela (S/N)"
         @23,44 get RES picture PAIP valid RES="S" .or. RES="N"
         read
         @23,1 say replicate(" ",77)
         if RES="S"
            ? chr(7)
            store " " to RES
            @23,30 say "Confirma (S/N)"
            @23,45 get RES picture PAIP valid RES="S" .or. RES="N"
            read
            if RES="S"
               do BORRA
            endif
         else
            skip
         endif
         do RECUADRO
         @14,15 say "Mes: "+KMESES[PERIODO]
         @15,15 say "CHEQUEANDO:   Asiento        Movimiento"
      endif
   enddo
   store 1 to C
   do while C<13
      if (KASIENTO[C]#1) .or. (KMOVIMIENTO[C]#1)
         store KASIENTO[C]+1 to KASIENTO[C]
         store KMOVIMIENTO[C]+1 to KMOVIMIENTO[C]
      endif
      store C+1 to C
   enddo
   do GRABA
   ? chr(7)
   store " " to RES
   @23,30 say "Pulse <RETURN> " get RES picture "X"
   read
   release MDEBE,MHABER,TDEBE,THABER,NROASI,NROMOV,DEB,HAB
   store XX2 to KPERIODO
 
 
   return
ENDIF
