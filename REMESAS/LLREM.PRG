********************************************************************************
*-- Programa: LLREM.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : RECUPERA REMESAS AGOTADAS BORRADAS LOGICAMENTE
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =iaud('INGRESO '+ulpr)
   DO WHILE .T.
      =movewin(10,10,15,69,'win1',"Remesa Agotada que se Recuperar ")
      ACTI WIND win1
      ff=""
      @ 1,1  SAY "Proveedor:"
      @ 2,1  SAY "N§ Remesa:"
      stor 0 to kok,respuesta,naremes
      sele pro
      naprove=iif(EMPTY(elipro(" de la Remesa Borrada - [ESC] para Salir ",1,12)),0,pro.procod)
      if !empty(naprove) .and. lastkey()#27
         acti wind win1
         @ 1,12 get pro.proveedor
         napro=left(pro.proveedor,15)
         clea gets
         @ 2,12 get naremes pict "99999999" mess "Ingrese el N§ de la Remesa a Recuperar"
         read
         sele rem
         set order to tag REMESA
         if !empty(naREMES) .and. lastkey()#27
            =relewin('win1')
            =movewin(0,0,23,79,'win',' ')
            ACTI WIND win
            cuantos=0
            SET DELE OFF
            SCAN FOR rem.proveedor=naprove .AND. rem.remesa=naremes .AND. !empty(rem.agotada) .AND. deleted()
                  STORE ff+ALLTRIM(STR(RECNO()))+"," TO ff
            ENDSCAN
            STORE LEFT(ff,LEN(ff)-1) TO ff
            IF LEN(ff)>0
               cuantos=OCCURS(",",ff)+1
               registro=ff
               =lock('rem') .or. lok("rem")
               SELE rem
               desdecual = 1
               DO Mrem1 WITH ff, desdecual,.F.
               IF confirma("Recuperar la Remesa ",.T.,20,30)
                  RECALL ALL FOR rem.proveedor=naprove .AND. rem.remesa=naremes .AND. !empty(rem.agotada) .AND. deleted()
               ENDIF
               UNLO IN rem
            else
               do cartel2 with "PARA LA REMESA "+ALLTRIM(STR(naremes))," DEL PROVEEDOR "+napro,"NO HAY MERCADERIA AGOTADA Y BORRADA",' '
            endif
            SET DELE ON
            =relewin('win')
         ELSE
            =RELEWIN('win1')
            EXIT
         ENDIF
      else
         =relewin('win1')
         EXIT
      endif
   ENDDO
ELSE
   =iaudi()
ENDIF
rele memo like na*
=men_lin(botom)
RETURN
