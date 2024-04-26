if m.opcion=1
   WAIT "Procesando..." WIND NOWA
   if TIP="F"
      SELE MOV
      SET ORDER TO TAG MOVIMIE
      IF SEEK(KPERIODO,2)
         store ASIENTO to NROASI
         store FECHA to MFECHA
         SCAN WHILE PERIODO=KPERIODO
            IF ASIENTO=NROASI
               replace FECHA with MFECHA
            ELSE
               store ASIENTO to NROASI
               store FECHA to MFECHA
            ENDIF
         ENDSCAN
         use
         use XMOVIMIE alias MOV
         index on str(PERIODO,2)+str(day(FECHA),2)+str(ASIENTO,4) tAG TEMPO
         SET ORDER TO TAG TEMPO
         IF seek(str(KPERIODO,2))
            store 1 to C
            SCAN while PERIODO=KPERIODO
               replace AUXILIAR with C
               store C+1 to C
            ENDSCAN
            index on str(PERIODO,2)+str(AUXILIAR,4) tAG TEMPO
 
            IF CONFIRM1("REORGANIZAR MOVIMIENTOS")
               do TEST_IMP
               set print on
               set console off
               STORE 0 TO NPAG
               =REORGA1()
               seek(str(KPERIODO,2))
               store 1 to KASIENTO[KPERIODO],KMOVIMIENTO[KPERIODO]
               SCAN while PERIODO=KPERIODO
                  store 0 to MASI1,MASI2,MASI3,MMOV1,MMOV2,MMOV3,AS1,AS2,AS3,MO1,MO2,MO3
                  set console on
                  @15,42 say ASIENTO    PICT "####"
                  @15,47 say MOVIMIENTO PICT "####"
                  set console off
                  store ASIENTO    to MASI1
                  store MOVIMIENTO to MMOV1
                  store KASIENTO[KPERIODO]    to AS1
                  store KMOVIMIENTO[KPERIODO] to MO1
                  replace ASIENTO with KASIENTO[KPERIODO],MOVIMIENTO with KMOVIMIENTO[KPERIODO]
                  store KMOVIMIENTO[KPERIODO]+1 to KMOVIMIENTO[KPERIODO]
                  if ASIENTO#MASI1
                     store KASIENTO[KPERIODO]+1 to KASIENTO[KPERIODO]
                  endif
                  set console on
                  @15,42 say ASIENTO    PICT "####"
                  @15,47 say MOVIMIENTO PICT "####"
                  set console off
                  store ASIENTO    to MASI2
                  store MOVIMIENTO to MMOV2
                  store KASIENTO[KPERIODO]    to AS2
                  store KMOVIMIENTO[KPERIODO] to MO2
                  replace ASIENTO with KASIENTO[KPERIODO],MOVIMIENTO with KMOVIMIENTO[KPERIODO]
                  store KMOVIMIENTO[KPERIODO]+1 to KMOVIMIENTO[KPERIODO]
                  if ASIENTO#MASI2
                     store KASIENTO[KPERIODO]+1 to KASIENTO[KPERIODO]
                  endif
                  set console on
                  @15,42 say ASIENTO    PICT "####"
                  @15,47 say MOVIMIENTO PICT "####"
                  set console off
                  store ASIENTO    to MASI3
                  store MOVIMIENTO to MMOV3
                  store KASIENTO[KPERIODO]    to AS3
                  store KMOVIMIENTO[KPERIODO] to MO3
                  replace ASIENTO with KASIENTO[KPERIODO],MOVIMIENTO with KMOVIMIENTO[KPERIODO]
                  store KMOVIMIENTO[KPERIODO]+1 to KMOVIMIENTO[KPERIODO]
                  if ASIENTO#MASI3
                     store KASIENTO[KPERIODO]+1 to KASIENTO[KPERIODO]
                  endif
                  ? PAIP
                  ?? str(MASI1,4)
                  ?? PAIP
                  ?? str(MMOV1,4)
                  ?? "!!"
                  ?? str(AS1,4)
                  ?? PAIP
                  ?? str(MO1,4)
                  ?? "!     !"
                  ?? str(MASI2,4)
                  ?? PAIP
                  ?? str(MMOV2,4)
                  ?? "!!"
                  ?? str(AS2,4)
                  ?? PAIP
                  ?? str(MO2,4)
                  ?? "!     !"
                  ?? str(MASI3,4)
                  ?? PAIP
                  ?? str(MMOV3,4)
                  ?? "!!"
                  ?? str(AS3,4)
                  ?? PAIP
                  ?? str(MO3,4)
                  ?? PAIP
                  store C+1 to C
                  if C>60
                     ? REPL("-",76)
                     =LINF(65)
                     =REORGA1()
                  endif
               ENDSCAN
               ? REPL("-",76)
               ?
               ?
               set console on
               set print off
               store KASIENTO[KPERIODO]+1 to KASIENTO[KPERIODO]
               do GRABA
               WAIT "Un momento por favor..." WIND NOWA
               if TIP="F"
                  use
                  erase TEMPO.IDX
                  use XMOVIMIE alias MOV
                  reindex
                  SET ORDER TO TAG MOVIMIE
                  seek(str(KPERIODO,2))
                  replace AUXILIAR with 0 while AUXILIAR#0
               endif
            ENDIF
            =GETPRIN()
         ENDIF
         SELE MOV
         ERASE TAG TEMPO
         WAIT CLEA
      ENDIF
   endif
