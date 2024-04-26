ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   IF CONFIRMA("Leer Precios de Casa Central",.t.,10,10)
      if file("c:\tmp\merca.dbf")
         =working()
         =dotalk()
         close data
         =OPMER()
         SET ORDER TO TAG ARTICULO
         SELE 25
         USE c:\TMP\MERCA ORDER TAG ARTICULO Alias upd
         SCAN
            IF XSEEK(ARTICULO,'MER','ARTICULO')
               if mer.costo#upd.costo
                  REPL MER.costo WITH UPD.costo
               endif
               if mer.precio2#upd.precio4
                  REPL MER.PRECIO2 WITH UPD.PRECIO4
               ENDIF
            ELSE
               scat memv
               =agrabar("mer")
               sele upd
            ENDIF
         ENDSCAN
         SELE UPD
         USE
         SELE MER
         IF GETENV("EQUIPO")='ARROYO'
         REPL ALL PRECIO3 WITH 0,;
           PRECIO4 WITH 0,;
           PRECIO1 WITH PRECIO2/1.21
         ENDIF
         =untalk()
         =unwork()
         DO OPAUD
         DO OPDOC
         DO OPSEG
      ELSE
         =CARTEL("NO HA SIDO ENCONTRADO EL ARCHIVO DE CASA CENTRAL",;
           "POR FAVOR COPIELO EN EL DIRECTORIO CORRESPONDIENTE",;
           "Y LUEGO",;
           "REINTENTE")
      ENDIF
   ENDIF
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
