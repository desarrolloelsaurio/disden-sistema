********************************************************************************
*-- Programa: LLKAR.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : RECUPERA EN KARDEX REGISTROS ASOCIADOS A REMESAS AGOTADAS BORRADAS LOGICAMENTE
********************************************************************************
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   DO iaud WITH 'INGRESO '+ulpr
   @ 0,rh SAY TIME() COLOR I
   @ 0,rp SAY PADC(ULPR,10) COLOR I
   DO WHILE .T.
      CLEA
      DEFINE WINDOW win1 FROM 10,10 TO 15,69 TITL " Recuperaci¢n de Mercader¡a asociada a una Remesa " COLOR SCHE 8
      ACTI WIND win1
      @ 1,1  SAY "Proveedor:"
      @ 2,1  SAY "N§ Remesa:"
      stor 0 to kok,respuesta,naremes
      ff=""
      sele pro
      set order to 1
      naprove=iif(elipro(" de la Remesa Borrada - [ESC] para Salir ",1,12)=0,0,pro->procod)
      if !empty(naprove) .and. lastkey()#27
         acti wind win1
         @ 1,12 get pro->proveedor
         napro=left(pro->proveedor,15)
         clea gets
         @ 2,12 get naremes pict "99999999" mess "Ingrese el N§ de la Remesa a Recuperar"
         read
         sele rem
         go top
         if !empty(naREMES) .and. lastkey()#27
            rele wind win1
            DEFINE WINDOW win FROM 0,0 TO 23,79 none COLOR SCHE 8
            ACTI WIND win
            cuantos=0
            SET DELE OFF
            SCAN WHILE !EOF()
               IF rem->proveedor=naprove .AND. rem->remesa=naremes .AND. !empty(rem->agotada)
                  STORE ff+ALLTRIM(STR(RECNO()))+"," TO ff
               ENDIF
            ENDSCAN
            STORE LEFT(ff,LEN(ff)-1) TO ff
            IF LEN(ff)>0
               cuantos=OCCURS(",",ff)+1
               SELE rem
               desdecual = 1
               DO Mrem1 WITH ff, desdecual,.F.
               IF confirma("Recuperar la Mercader¡a asociada a esta Remesa ",.T.,20,10)
                  SELE kar
                  do flok WITH "kar"
                  RECALL ALL FOR kar->proveedor=.T. .AND. kar->cliente=naprove .AND. kar->remesa=naremes .AND. deleted()
                  UNLO IN kar
               ENDIF
            else
               do cartel2 with "PARA LA REMESA "+ALLTRIM(STR(naremes))," DEL PROVEEDOR "+napro,"NO HAY MERCADERIA AGOTADA Y BORRADA"
            endif
            SET DELE ON
            rele wind win
         ELSE
            RELE WIND win1
            EXIT
         ENDIF
      else
         rele wind win1
         EXIT
      endif
   ENDDO
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
rele memo like na*
ACTI SCREE
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LLKAR.PRG
