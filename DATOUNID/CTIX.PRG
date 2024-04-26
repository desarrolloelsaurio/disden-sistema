********************************************************************************
*-- Programa: Ctix.prg
*-- Fecha   : 01-18-92 09:27am
*-- Version : R. 'EL BATA'
*-- Notas   : CORRIGE DATOS DE UNIDADES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =movewin(mcnsr,mcnsc,mcnsr+mcnsla,mcnsc+mcnsan,"win"," Selecciona Consorcio ")
   SELE cns
   STORE 25 TO COL
   SCAT MEMVAR
   =mcns(.T.)
   store nul to kok
   IF confirma("el CONSORCIO",.T.,mtixr+mtixla,mtixc+10)
      =moveWIN(ctixr,ctixc,ctixr+ctixla,ctixc+ctixan,'win1'," Ingreso Porc. de Participaci¢n en los Gastos ")
      STOR 20 TO COL
      CLEA
      SELE tix
      SCAT MEMV BLAN
      NADA = CNS.CONSORCIO
      @ 1,COL GET m.NADA
      CLEAR GETS
      IF XSEEK(cns.concod,"TIX","CONCOD")
         SCAN WHILE tix.concod=cns.concod
            ACTI WIND win1
            SCAT MEMV
            =Mtix(.T.)
            =men_lin("Elija el REGISTRO - [] Sig. - [ENTER] Corrige - [ESC] Sale")
            nada=nul
            DO WHILE nada#13 .AND. nada#24 .AND. nada#27
               nada=INKEY(nul,"HM")
            ENDDO
            IF nada = 13
               ACTI WIND win1
               sele tix
               M.REGISTRO=RECNO()
               if XSEEK(m.unicod,"MIX","TIPCOD")
                  m.nada = mix.texto1
                  acti wind win1
                  @ 2,col get m.nada mess "una tecla y enter para corregir"
                  read
                  if updated()
                     STORE nul TO respuesta
                     if !empty(elitip("",2,COL))
                        m.unicod = left(mix.texto2,2)
                        m.nada = mix.texto1
                        acti wind win1
                        @ 2,col get m.nada
                        clea gets
                     endif
                  endif
               endif
               m.nada = SAYMIX(M.GASCOD,'GASCOD')
               if !EMPTY(M.NADA)
                  acti wind win1
                  @ 3,col get m.nada mess "una tecla y enter para corregir"
                  read
                  if updated()
                     STORE nul TO respuesta
                     if !empty(eligas("",3,COL))
                        m.gascod = left(mix.texto2,11)
                        m.nada = mix.texto1
                        acti wind win1
                        @ 3,col get m.nada
                        clea gets
                     endif
                  endif
               endif
               @ 4,COL get m.porcentaje pict "999.99 %"
               read
               =men_lin(grabando)
               sele tix
               =FLOK("TIX") .or. lok("TIX")
               GO (M.REGISTRO)
               GATH MEMV
               =repuse()
               STOR kok+1 TO kok
               UNLO IN tix
               =iaud(m.concod)
            else
               IF nada = 27
                  exit
               ENDIF
            ENDIF
         ENDSCAN
      endIf
      =relewin("win1")
   ELSE
      =men_lin('EL CONSORCIO '+ALLTRIM(cns.consorcio)+'No posee UNIDADES - Enter para continuar ')
      =existe(' CONSORCIO SIN UNIDADES ')
      =INKEY(nul,"HM")
   ENDIF
   =RELEWIN("WIN")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
