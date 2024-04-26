********************************************************************************
*-- Programa: IKAR.PRG
*-- Fecha   : 12-16-91 06:32pm
*-- Version : G. REINER
*-- Notas   : INGRESA KARDEX - PERDIDOS POR REPASO
********************************************************************************
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   =HORA_ULP()
   =movewin(ikarr,ikarc,ikarr+ikarla,ikarc+ikaran,'win', " Ingreso Perdidos por Repaso ")
   SELE kar
   STOR " Perdidos por Repaso - " TO me1
   STOR 24 TO COL
   STOR NUL TO kok
   DO WHIL .T.
      ACTI WIND win
      CLEA
      SCAT MEMV BLAN
      @ 1,2 say "Proveedor             " colo sche 3
      @ 2,2 say "N§ De Remesa          " colo sche 3
      @ 3,2 SAY "Mercader¡a            " COLO SCHE 3
      @ 4,2 SAY "Fecha de la Operaci¢n " COLO SCHE 3
      @ 5,2 SAY "Operaci¢n de Kardex   " COLO SCHE 3
      @ 6,2 SAY "Detalle               " COLO SCHE 3
      @ 7,2 SAY "Entrada               " COLO SCHE 3
      @ 8,2 SAY "Salida                " COLO SCHE 3
      stor nul to naremes
      sele pro
      naprove=iif(empty(elipro(" de la Remesa - [ESC] para Salir ",1,col)),0,pro->procod)
      if !empty(naprove) .and. lastkey()#27
         acti wind win
         @ 1,col get pro->proveedor
         napro=left(pro->proveedor,15)
         clea gets
         @ 2,col get naremes pict "99999999" mess "Ingrese el N§ de la Remesa"
         read
         sele rem
         set order to tag REMESA
         if seek(naprove+str(naremes))
            regrem=recno()
            STOR NUL TO RESPUESTA
            IF !EMPTY(EliMER(" Mercader¡a",3,COL))
               STORE alltrim(MER->palpopup) TO m->nada
               stor mer->rubro+mer->variedad+mer->calidad to m->merca
               sele rem
               nabus=.F.
               Scan while naprove=proveedor .and. naremes=remesa .and. agotada=' ' .and. !nabus
                  if REM.MERCA=M.merca
                     regrem=recno()
                     nabus=.T.
                     resto=bultos-vendido
                  endif
               endscan
               if nabus
                  SELE kar
                  scatte memvar blank
                  store date() to fechaop
                  ACTI WIND win
                  @ 3,COL GET m->nada
                  CLEA GETS
                  @ 4,COL GET m->fechaop;
                    MESS "Ingrese la fecha de la operaci¢n - [ESC] para Men£"
                  read
                  STOR NUL TO respuesta
                  if !empty(eliopk("",5,col))
                     acti wind win
                     m->opk=left(mix.texto2,2)
                     nada=mix->texto1
                     @ 5,col get nada
                     clea gets
                     m->detalle=left(m->detalle,30)
                     @ 6,col get m->detalle pict "@!" mess me1+" Detalle de la Operaci¢n"
                     @ 7,col get m->entrada pict '999999999.99' mess me1+" Unidades Entradas"
                     @ 8,col get m->salida pict '999999999.99' mess me1+" Unidades Salidas" ;
                       valid (m.salida>=0 .and. m.salida<=m.resto) ;
                       error "Supera el remanente"
                     read
                     m->cliente=REM.PROVEEDOR
                     m.articulo=m.merca
                     m.nrodocref=naremes
                     m.docref='RE'
                     M.PROVEEDOR=.T.
                     M->SUCURSAL=SUCU
                     m.remesa=naremes
                     if confirma('los datos ingresados',.t.,20,0)
                        SELE KAR
                        =agrabar("KAR")
                        KOK=KOK+1
                        sele rem
                        goto regrem
                        replace rem.bultos with rem.bultos+m.entrada, rem.vendido with rem.vendido+salida
                        if rem.bultos=rem.vendido
                           replace agotada with 'S'
                        else
                           replace agotada with ' '
                        endif
                     endif
                  endif
               else
                  =cartel2('La Mercader¡a ingresada ',' ',' No existe en la remesa '+alltrim(str(naremes)),' ')
               endif
            endif
         else
            =cartel2('La remesa '+alltrim(str(naremes)),'del Proveedor '+rem.proveedor,'No Existe',' ')
         endif
      else
         exit
      endif
   enddo
   IF !EMPTY(kok)
      DO iaud WITH 'ING '+ALLTRIM(STR(kok))+' Operaciones Kardex'
   ENDIF
else
   =iaudi()
ENDIF
DEAC WIND ALL
=MEN_LIN(BOTOM)
RETURN
* EOF - INDENT
