function ajsto1
ULPR=PROGRAM()
IF CHEQSEG()
   IF CONFIRMA("AJUSTAR STOCK DE "+TT,.T.,10,0)
      =WORKING()
      =DOTALK()
      =OPTEL()
      =OPAVI()
      =OPKAR()
      SELE AVI
      SET ORDER TO TAG AVICOD
      REPL ALL AJUSTE WITH 0
      SELE TEL
      SET ORDER TO TAG TELCOD
      REPL ALL AJUSTE WITH 0
      SELE KAR
      SCAN FOR FISC
         IF TIPO="A"
            SELE AVI
         ELSE
            SELE TEL
         ENDIF
         IF SEEK(KAR.ARTICULO)
            REPL AJUSTE WITH AJUSTE+KAR.ENTRADA-ABS(KAR.SALIDA)
         ELSE
            =CARTEL("EL ARTICULO "+KAR.ARTICULO,;
              "NO FUE ENCONTRADO",;
              "NO SE HA HECHO EL AJUSTE DE STOCK CORRESPONDIENTE",;
              "PULSE [ENTER] PARA CONTINUAR")
         ENDIF
         SELE KAR
      ENDSCAN
      IF AJ_OPCION=1 .OR. ;
      AJ_OPCION=2
        SELE TEL
        SET ORDER TO
        REPL STOCK WITH AJUSTE FOR &FISC1
      SET ORDER TO TAG TELCOD        
      ELSE
        SELE AVI
        SET ORDER TO        
        REPL STOCK WITH AJUSTE FOR &FISC1        
        SET ORDER TO TAG TELCOD                
      ENDIF
      =UNTALK()
      =UNWORK()
   ENDIF
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
