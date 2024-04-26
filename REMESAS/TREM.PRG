********************************************************************************
*-- Programa: TREM.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : MANTENIMIENTO DE REMESAS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   DO WHILE .T.
      CLEA
      DEFINE WINDOW win1 FROM 10,10 TO 15,69 TITL "Remesa Agotada que se archivar  en el Hist¢rico" COLOR SCHE 8
      ACTI WIND win1
      ff=""
      @ 1,1  SAY "Proveedor:"
      @ 2,1  SAY "N§ Remesa:"
      stor 0 to kok,respuesta,naremes
      sele pro
      set order to 1
      naprove=iif(elipro(" de la Remesa al Hist¢rico - [ESC] para Salir ",1,12)=0,0,pro.procod)
      if !empty(naprove) .and. lastkey()#27
         acti wind win1
         @ 1,12 get pro.proveedor
         napro=left(pro.proveedor,15)
         clea gets
         @ 2,12 get naremes pict "99999999" mess "Ingrese el N§ de la Remesa a archivar en el Hist¢rico"
         read
         if !empty(naremes) .and. lastkey()#27
            sele rem
            go top
            if seek(naprove+str(naremes))
               rele wind win1
               DEFINE WINDOW win FROM 0,0 TO 23,79 none COLOR SCHE 8
               ACTI WIND win
               cuantos=0
               SCAN WHILE !EOF()
                  IF rem.proveedor=naprove .AND. rem.remesa=naremes .AND. !empty(rem.agotada)
                     STORE ff+ALLTRIM(STR(RECNO()))+"," TO ff
                  ENDIF
               ENDSCAN
               STORE LEFT(ff,LEN(ff)-1) TO ff
               IF LEN(ff)>0
                  cuantos=OCCURS(",",ff)+1
                  registro=ff
                  DO lok WITH "rem"
                  SELE rem
                  desdecual = 1
                  DO Mrem1 WITH ff, desdecual,.F.
                  IF confirma("La Remesa a archivar en el Hist¢rico",.T.,20,20)
                     DELE ALL FOR rem.proveedor=naprove .AND. rem.remesa=naremes .AND. !empty(rem.agotada)
                  ENDIF
                  UNLO IN rem
               else
                  do cartel2 with "PARA LA REMESA "+ALLTRIM(STR(naremes))," DEL PROVEEDOR "+napro,"NO HAY MERCADERIA AGOTADA"
               endif
               rele wind win
            ELSE
               RELE WIND win1
               do cartel2 with "NO EXISTE LA REMESA "+ALLTRIM(STR(naremes))," DEL PROVEEDOR "+napro
            ENDIF
         else
            rele wind win1
            exit
         endif
      else
         rele wind win1
         exit
      endif
   enddo
ELSE
=iaudi()
ENDIF
rele memo like na*
=men_lin(botom0
RETURN
