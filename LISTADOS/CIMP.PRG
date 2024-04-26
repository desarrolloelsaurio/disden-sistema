*********************************************************************************
*-- Programa: cimp.prg
*-- Fecha   : 02-02-92 09:21pm
*-- Version : G. REINER
*-- Notas   : MENU CONTROL DE IMPRESION
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
PARAMETER ALOMACHO
IF ALOMACHO
   IF M.PORDONDE=6
      RELE CAPTURAR
      PUBL CAPTURAR
      STORE WNCL("IMPRESION AL SERVER HABILITADA") TO CAPTURAR
   ELSE
      IF M.PORDONDE=5
         RELE CAPTURAR
         PUBL CAPTURAR
         STORE !WNCL("IMPRESION LOCAL HABILITADA") TO CAPTURAR
      ENDIF
   ENDIF
ELSE
   =cabpan1()
   DO CASE
   case bar()=1
      DO LISTAR
   CASE BAR()=2
      RELE CAPTURAR
      PUBL CAPTURAR
      STORE WNCL("IMPRESION AL SERVER HABILITADA") TO CAPTURAR
   CASE BAR()=3
      RELE CAPTURAR
      PUBL CAPTURAR
      STORE !WNCL("IMPRESION LOCAL HABILITADA") TO CAPTURAR
   CASE BAR()=4
      DO ABPR
   CASE BAR()=5 
      DO XASCII
   CASE BAR()=6
      DO XANUIM
   ENDCASE
ENDIF
RETURN MEN_LIN(BOTOM)
