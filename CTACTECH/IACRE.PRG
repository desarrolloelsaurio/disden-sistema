********************************************************************************
*-- Programa: IACRE.PRG
*-- Fecha   : 09/16/91
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESO CHEQUES ACREDITADOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   STORE xacotiz TO nacotiz
   STORE DATE() TO nafec
	SELE PER
   set order to codcli
   picu='@Z '+right('999,999,999,999.99',xacdigi)
   =WORKING()
   tmp=GENTMP()
   select * from cch into table (tmp) where cch.fechade<=date() .and. empty(cch.fechaac)
   use
   sele 25
   use (tmp) alias tmp
   M.TMPX=sinult(tmp)+'x'
   INDE ON nroche to (m.tmpx) COMP
   set relation to tmp.codcli INTO PER
   sele cch
   set order to numere
   sele ccl
   set order to codcli
   on key label TAB keyboard chr(23)
   =UNWORK()
   =moveWIN(3,0,22,79,'win'," Acreditacion de Cheques",' [TAB] Acredita - [ESC] Sale ')
   do while .t.
      sele tmp
      browse fields ;
        nroche :15 :H='NUMERO DE CHEQUE':R,;
        banco  :20 :H='BANCO'    :P=REPL('X',20):R,;
        monto      :H='IMPORTE'  :P=picu:R,;
        moneda :2  :H='MONEDA':R,;
        A=iif(entregado,'NO','SI'):2:H='CARTERA':R,;
        fechaop :8 :H='FECHA':R,;
        PER.cliente:15  :H='CLIENTE':R;
        in window win nomenu noclea
      if last()=27
         exit
      else
         scat memv
         =movewin(13,0,22,46,'winacre','Cheque a acreditar')
         @ 1,1 say 'Nro Cheque    '
         @ 2,1 say 'Banco Origen  '
         @ 3,1 say 'Importe       '
         @ 4,1 say 'Moneda        '
         @ 5,1 say 'Acreditado el '
         @ 6,1 say 'Depositado en '
         @ 1,15 say m.nroche
         @ 2,15 say m.banco
         @ 3,15 say m.monto
         @ 4,15 say m.moneda
         m.fechaac=date()
         @ 5,15 get m.fechaac
         read
         IF LAST()#27
            if !m.entregado
               respuesta=nul
               if EMPTY(eliban('A depositar',6,15))
                  =relewin('winacre')
                  loop
               endif
               @ 6,15 say alltrim(mix.texto1)+' N§'+alltrim(mix.texto2)
            endif
            if confirma("el "+IIF(m.tipo="CH","Cheque","Documento"),.T., 18,47)
               if !m.entregado
                  sele caj
                  m.caja = str(mix.nu1,2)
                  m.proveedor = .f.
                  m.fechaop = m.fechaac
                  append blank
                  gath memv
                  =repuse()
               endif
               sele ccl
               if seek(tmp.codcli)
                  SCAN WHILE ccl.codcli=tmp.codcli
                     if 'CHEQUE'$detalle .and. tmp.nroche$detalle
                        replace pagada with .t.
                        =repuse()
                        exit
                     endif
                  ends
               endif
               sele cch
               if seek(tmp.numere)
                  scan while numere=tmp.numere
                     if tmp.codcli=codcli
                        exit
                     endif
                  ends
                  if eof()
                     =cartel2('El comprobante:',tmp.compr,'No pertenece al cliente:',tmp.codcli)
                  else
                     replace fechaac with m.fechaac
                     =repuse()
                     sele tmp
                     dele
                  endif
               else
                  =cartel2('El comprobante:',tmp.compr,'cliente:'+tmp.codcli,'No fu‚ encontrado')
               endif
               =iaud(alltrim(M.nroche)+'-'+;
                     alltrim(M.codcli)+'-'+;
                     iif(m.entregado,'00',m.caja))
            endif
         endif
         =relewin('winacre')
      endif
   enddo
   on key label TAB
   sele tmp
   use
   dele file (tmp)
   dele file (tmpx)
ELSE
   =iaudi()
ENDIF
=RELEWIN("win")
=men_lin(botom)
RETURN
