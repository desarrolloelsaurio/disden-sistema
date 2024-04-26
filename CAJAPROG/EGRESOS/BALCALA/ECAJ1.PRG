*********************************************************************************
*-- Programa: ECAJ1.prg
*-- Fecha   : 11/14/91
*-- Version : R. 'EL BATA'
*-- Notas   : EGRESO DE CAJA EN EFECTIVO
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
   =moveWIN(4,3,17,75,'win',"Salida de efectivo")
   DO WHILE .T.
      sele caj
      scat memv blan
      store .T. to m.proveedor
      store date() to m.fechaop
      clea
      @ 1,5 SAY "Proveedor       :"
      @ 4,5 SAY "Tipo Comprobante:"
      @ 5,5 SAY "N§ Comprobante  :"
      @ 6,5 SAY "Fecha Operaci¢n :"
      @ 7,5 SAY "Tipo de Gasto   :"
      @ 8,5 SAY "Monto Operaci¢n :"
      @ 9,5 SAY "Moneda utilizada:"
      @10,5 SAY "Cotizaci¢n      :"
      sele pro
      stor 0 to respuesta
      if !EMPTY(elipro("",1,25))
         m.codcli=pro.procod
         m.naprove=pro.proveedor
         acti wind win
         @ 1,25 say alltrim(pro.procod) + " " + alltrim(pro.proveedor)
         @ 2,25 say alltrim(pro.domicilio) + " T.E." + alltrim(pro.telefono)
         @ 3,25 say pro.localidad
      else
         store '' to m.codcli, m.naprove
      endif
      acti wind win
      if empty(m.codcli)
         m.compr='ORDEN DE PAGO'
         @ 4,25 get m.compr 
         clear gets
      else
         @ 4,25 get m.compr picture "@M RECIBO,FACTURA"
      endif    
      @ 5,25 get m.numere valid !EMPTY(m.numere);
        error 'Debe tener un nro de comprobante'
      read
      if last()#27
         m.numere = q_fac(m.numere)
         @ 5,25 get m.numere
         clear gets
         @ 6,25 get m.fechaop
         read
         m.compre  = iif(empty(m.codcli),'OP',left(m.compr,1)+substr(m.compr,3,1))
         m.comprre  = m.compre
         m.numerore = m.numere
         store nul to respuesta
         m.gasto=eligas("",7,25)
         acti wind win
         if !EMPTY(m.gasto)
            m.gasto=left(mix.texto2,11)
            @ 7,25 get m.gasto
            clea gets
            m.cotiz=xacotiz
            m.moneda=xamoneda
            @ 8,25 get m.monto pict "@Z 99,999,999,999.99"
            @ 9,25 get m.moneda pict "@M "+xadols+","+xauss
            @ 10,25 get m.cotiz pict "@Z 999,999,999,999.99"
            read
            m.equivale=-(iif(alltrim(m.moneda)=alltrim(xauss),m.monto/m.cotiz,m.monto))
            m.monto=-(iif(alltrim(m.moneda)=alltrim(xauss),m.monto,m.monto*m.cotiz))
            m.caja = '00'
            if confirma("Grabar la salida de caja",.t.,18,10)
               =Agrabar("CAJ")
               =iaud("CAJA 00 "+m.compre+" "+m.numere)
               if !empty(m.codcli)
                  m.pagada=.t.
                  m.fechave=m.fechaop
                  m.procod=m.codcli
                  m.codcli=''
                  =Agrabar("CCP")
                  =iaud("CCP prov:"+m.codcli+" "+m.compre+" "+m.numere)
               endif
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
