*******************************************************************
*-- Programa: IEFE.PRG
*-- Fecha   : 08/10/92
*-- Versi¢n : V.LEEGSTRA - G. REINER - BATALAN
*-- Notas   : INGRESO EN EFECTIVO Y CHEQUES
*-- Modificaci¢n GOYO 12-10-92 01:09pm (icob_1)
*-- Agregado de Icch para ingreso de cheques y tarjetas
*******************************************************************
ULPR=hora_ulp(PROGRAM())
IF CHEQSEG()
   m.mess1=" - [ESC] para Men£"
   =MOVEWIN(5,10,20,60,'WIN1'," Ingreso de Valores ")
   DIME cheque[3,4]
   STOR NUL TO cheques,efecaus,efecdol,sumpag,cheques,tarjeta
   STOR xacotiz to NADA10
   STORE '999999999.99' TO picu
   STORE date() to m.fechaem
   store space(12) to m.compr
   COL=20
   @ 1,1 SAY "FECHA OP."
   @ 2,1 SAY "COTIZACION"
   @ 3,1 SAY "COMPROBANTE"
   @ 4,1 SAY "GASTO"
   @ 6,1 SAY ALLTRIM(UPPER(XAUSS))
   @ 7,1 SAY ALLTRIM(UPPER(XADOLS))
   @ 8,1 SAY "Cheques"
   @ 9,1 say "Tarjetas"
   @ 11,1 say 'TOTAL  '
   @ 1, COL GET m.fechaem ;
     MESS "Fecha de Operaci¢n"+m.mess1
   @ 2, COL GET NADA10 ;
     pict picu ;
     MESS 'Cotizaci¢n del '+xadol+m.mess1
   @ 3, COL GET m.compr ;
     MESS 'Comprobante de Referencia'+m.mess1
   read
   IF LAST()#27
      store nul to respuesta
      if !empty(eligas("",1,-1))
         m.gasto=left(mix.texto2,11)
         m.nada=mix.texto1
         @ 4, COL GET m.nada
         clear gets
         @ 6,COL GET efecaus PICTURE picu MESS 'Monto del ingreso de '+xauss
         @ 7,COL GET efecdol PICTURE picu MESS 'Monto del ingreso de '+xadols
         @ 8,col GET CHEQUES PICT '' FUNC '*C' MESS 'Hay Cheques ?  - [ESC] para Fin'
         @ 9,col get tarjeta PICT '' FUNC '*C' MESS 'Hay Tarjetas de Cr‚dito ?  - [ESC] para Fin'
         READ
         sumpag=efecaus+efecdol*NADA10+cheques+tarjeta
         IF SUMPAG>0
            IF CHEQUES=1
               STORE NUL TO CHEQUES
               STORE "" TO ARCHE
               M.CHEQUES=ICCH(@ARCHE,.T.,99,'CH')
               @ 8,COL GET cheques PICTURE picu
               clea gets
            ENDIF
            IF TARJETA=1
               STORE NUL TO TARJETA
               STORE "" TO ARTAR
               M.TARJETA=ICCH(@ARTAR,.T.,99,'TA')
               @ 9,COL GET tarjeta PICTURE picu
               clea gets
            ENDIF
            SUMPAG=EFECAUS+EFECDOL*NADA10+CHEQUES+TARJETA
            @ 11,COL GET sumpag PICT picu
            CLEA GETS
            if confirm1("los Datos Ingresados",.T.,20,40)
               *** EFECTIVO EN MONEDA NACIONAL
               m.caja='00'
               m.codcli=''
               m.fechaop=fechaem
               m.compre='RE'
               IF !empty(efecaus)
                  m.monto=efecaus
                  m.moneda=xauss
                  m.equivale=efecaus/NADA10
                  =AGRABAR("caj")
                  =IAUD("Ef."+xauss+" "+STR(M.MONTO))
               ENDIF
               *** EFECTIVO EN DOLARES
               IF efecdol#NUL
                  m.monto=efecdol*NADA10
                  m.moneda=xadols
                  m.equivale=efecdol
                  =AGRABAR("caj")
                  =IAUD("Ef."+xadols+" "+STR(M.MONTO))
               ENDIF
               if cheques>1
                  =iefe1(@arche)
               endif
               if tarjeta>1
                  =iefe1(@artar,.t.)
               endif
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   =RELEWIN("win1")
ELSE
   =IAUDI()
ENDIF
RETURN
function iefe1
parameter arr,estarjeta
store "" to CODCLI
store m.fechaem to FECHAOP
store "CH" TO TIPO
STORE "RE" TO COMPRE
STORE IIF(TYPE("CCH.NUMERE")="C",M.COMPR,VAL(M.COMPR)) TO COMPRRE
STORE XAUSS TO MONEDA
STORE {} TO FECHAAC
STORE .F. TO ENTREGADO
STORE DATE() TO FECHA
STORE USADOR TO USUARIO
IF HAYCAMPO("SELECCION","CCH")
   STORE "" TO SELECCION
ENDIF
FOR XA=1 TO ALEN(arr,1)
   if estarjeta
      =xseek(arr[xa,5],'MIX','TARCOD')
      M.BANCO=MIX.TEXTO1
   else
      M.BANCO=arr[XA,5]
   endif
   M.MONTO=arr[XA,2]
   M.FECHADE=arr[XA,3]
   M.NROCHE=arr[XA,4]
   M.DIASAC=arr[XA,6]
   M.EQUIVALE=M.MONTO/NADA10
   =AGRABAR("CCH")
   =IAUD(ALLTRIM(M.BANCO)+"/"+ALLTRIM(NROCHE)+"/"+ALLTRIM(STR(M.MONTO)))
   IF ESTARJETA
     M.CAJA=ARR[XA,5]
     =AGRABAR("CAJ")
   ENDIF
NEXT
return .t.
