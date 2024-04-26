*:*********************************************************************
*-- Programa: lfar.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA facturas proveed.
*:*********************************************************************
PARAMETER tipofar
PRIVATE desdecual,hastacual, cuantos, fattall
SELE fad
fattall=""
IF tipofar
   SCAN FOR factura=m.factura .AND. procod=m.procod
      fattall=fattall+ALLTRIM(STR(RECNO()))+","
   ENDSCAN
ELSE
   SCAN FOR factura=m.factura .AND. procod=m.procod .AND. cantidad>devuelta
      fattall=fattall+ALLTRIM(STR(RECNO()))+","
   ENDSCAN
ENDIF
IF LEN(fattall)>0
   fattall=LEFT(fattall,LEN(fattall)-1)
   cuantos=OCCURS(",",fattall)+1
   registro = fattall
   DO lok WITH 'fad'
   desdecual = 1
   DO WHILE .T.
      DO mfar2 WITH fattall, desdecual, .T.
      hastacual=MIN(desdecual+13,cuantos)
      ren=9
      DO WHILE .T.
         @ 24, 30 PROMPT "\<ANTERIOR"
         @ 24, 45 PROMPT "\<SALIR"
         @ 24, 60 PROMPT "\<POSTERIOR"
         opcion = 0
         MENU TO opcion
         IF opcion = 1
            IF desdecual-14>=1
               desdecual=desdecual-14
            ELSE
               LOOP
            ENDIF
         ELSE
            IF opcion = 2
               EXIT
            ELSE
               IF opcion = 3
                  IF desdecual+14<=cuantos
                     desdecual=desdecual+14
                  ELSE
                     LOOP
                  ENDIF
               ENDIF
            ENDIF
         ENDIF
         EXIT
      ENDDO
      IF opcion = 2
         EXIT
      ENDIF
   ENDDO
ENDIF
RETURN
