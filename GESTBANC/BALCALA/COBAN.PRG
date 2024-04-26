*********************************************************************************
*-- Programa: COBAN.prg
*-- Fecha   : 7-7-92
*-- Version : R. 'EL BATA'
*-- Notas   : AJUSTE DE BANCOS Y DEPOSITO EN CTACTE
*-- Modificaci¢n GOYO (imputaba al reves en dep¢sito)
********************************************************************************
para ajudepo
ULPR=hora_ulp(PROGRAM()) 
IF CHEQSEG()
   msg=iif(ajudepo,"Ajuste de Cuentas Corrientes","Dep¢sito de Cuentas Corrientes")
   =moveWIN(4,8,12,70,'win',msg,' [ESC] Sale ')
   COL=20
   DO WHILE .T.
      sele caj
      scat memv blan
      store .T. to m.proveedor
      store date() to m.fechaop
      clea
      @ 1,2 SAY "Banco y  Cuenta   "
      @ 2,2 SAY "Fecha Operaci¢n   "
      @ 3,2 SAY "Tipo de Gasto     "
      @ 4,2 SAY "Monto Operaci¢n   "
      @ 5,2 SAY "Tipo de Operaci¢n "
      stor nul to respuesta
      if !EMPTY(eliban("",1,col))
         m.nada = alltrim(mix->texto1)+' N§'+alltrim(mix->texto2)
         @ 1,col get m.nada
         clea gets
         m.caja = str(mix.nu1,2)
         @ 2,col get m.fechaop
         read
         store nul to respuesta
         m.gasto=eligas("",3,col)
         acti wind win
         if !EMPTY(m.gasto)
            m.gasto=left(mix.texto2,11)
            m.nada =mix.texto1+' ('+m.gasto+' )'
            @ 3,col get m.nada
            clea gets
            @ 4,col get m.monto pict "@Z 99,999,999,999.99"
            read
            m.tipcompr="CREDITO"
            @ 5,col get m.tipcompr pict "@M CREDITO,DEBITO"
            if ajudepo
               read
            else
               clea gets
            endif   
            m.monto=iif(m.tipcompr="CREDITO",m.monto,-m.monto)
            if confirma(msg,.t.,18,10)
               =AGRABAR("CAJ")
               =iaud(m.caja+'-'+alltrim(str(m.monto)))
            endif
         else
            exit
         endif
      else
         exit
      endif
   enddo
   =relewin('win')
else
   =iaudi()
endi
RETURN
