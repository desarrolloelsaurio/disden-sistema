*********************************************************************************
*-- Programa: ECAJ2.prg
*-- Fecha   : 11/14/91
*-- Version : R. 'EL BATA'
*-- Notas   : EGRESO DE CAJA EN cheques propios
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
   =moveWIN(2,3,18,75,'win',"Salida de Cheques Propios")
   col=20
   DO WHILE .T.
      sele caj
      scat memv blan
      store .T. to m.proveedor
      store date() to m.fechaop
      clea
      @ 1,2 SAY "Proveedor        :"
      @ 4,2 SAY "Tipo Comprobante :"
      @ 5,2 SAY "N§ Comprobante   :"
      @ 6,2 SAY "Fecha Operaci¢n  :"
      @ 7,2 SAY "Tipo de Gasto    :"
      @ 8,2 SAY "Monto Operaci¢n  :"
      @ 9,2 SAY "Moneda utilizada :"
      @10,2 SAY "Cotizaci¢n       :"
      @11,2 SAY "Cuenta           :"
      @12,2 SAY "Nro Cheque       :"
      @13,2 SAY "Fecha Dep¢sito   :"
      sele pro
      stor 0 to respuesta
      if !EMPTY(elipro("",1,COL))
         m.codcli=pro.procod
         m.naprove=pro.proveedor
         acti wind win
         @ 1,COL say alltrim(pro.procod) + " " + alltrim(pro.proveedor)
         @ 2,COL say alltrim(pro.domicilio)
         @ 3,COL say pro.localidad  + " T.E." + alltrim(pro.telefono)
      else
         store '' to m.codcli, m.naprove
      endif
      acti wind win
      if empty(m.codcli)
         m.compr='ORDEN DE PAGO'
         @ 4,COL get m.compr 
         clear gets
      else
         @ 4,COL get m.compr picture "@M RECIBO,FACTURA"
      endif    
      @ 5,col get m.numere;
        valid !EMPTY(m.numere);
        error 'Debe tener un nro de comprobante'
      read
      if last()#27
         m.numere=q_fac(m.numere)
         @ 5,col get m.numere
         clea gets
         @ 6,COL get m.fechaop
         read
         if last()#27
            m.compre  = iif(empty(m.codcli),'OP',left(m.compr,1)+substr(m.compr,3,1))
            m.comprre  = m.compre
            m.numerore = m.numere
            store nul to respuesta
            m.gasto=eligas("",7,COL)
            acti wind win
            if !EMPTY(m.gasto)
               m.gasto=left(mix.texto2,11)
               @ 7,COL get m.gasto
               clea gets
               m.cotiz=xacotiz
               m.moneda=xamoneda
               @ 8,COL get m.monto pict "@Z 99,999,999,999.99" ;
               MESS "Monto a Abonar" ;
               VALID M.MONTO>0 ;
               ERROR "MONTO INACEPTABLE"
               @ 9,COL get m.moneda pict "@M "+xadols+","+xauss
               @ 10,COL get m.cotiz pict "@Z 999,999,999,999.99"
               read
               IF LAST()#27
               m.equivale=-(iif(m.moneda=xauss,m.monto/m.cotiz,m.monto))
               m.monto=-(iif(m.moneda=xauss,m.monto,m.monto*m.cotiz))
               store nul to respuesta
               if !EMPTY(eliban("",11,COL))
                  store str(mix.nu1,2) to m.caja
                  store alltrim(mix.texto1)+' _ '+alltrim(mix.texto2) to m.nada
                  @ 11,COL get m.nada
                  clea gets
                  store m.fechaop to m.fechade
                  @ 12,COL get m.nroche
                  @ 13,COL get m.fechaop 
                  read
                  if confirma("Grabar la salida de caja",.t.,18,10)
                     =AGRABAR("CAJ")
                     =iaud("CAJA "+m.caja+m.compre+" "+m.numere)
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
               ELSE
               EXIT
               ENDIF
            else
               exit
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
