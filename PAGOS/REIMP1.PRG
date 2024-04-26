*******************************************************************************
*-- Programa: REIMP1.PRG
*-- Fecha   : 20-10-92 11:42am
*-- Version : R. 'EL BATA'
*-- Notas   : REIMPUTA PAGOS POR PROVEEDOR
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   col=30
   picu='@Z '+right('999,999,999,999.99',xacdigi)
   STORE NUL TO RESPUESTA
   DO WHILE .T.
      STORE NUL TO RESPUESTA
      IF !EMPTY(ELIPRO("",-1,1))
         scat memv
         msg=alltr(JANNAME)
         CREN=8
         =MOVEWIN(CREN,NUL,CREN+13,79,'WIN',' Proveedor ',MSG)
         =mpro(.t.)
         if confirma("Proveedor ",.t.,20,20)
            tmp=GENTMP()
            m.procod=pro.procod
            store {01/01/80} to FECINI
            store date() to fecfin
            if entre_fe()
               =WORKING()
               select *, space(20) as cajadesc,space(20) as IMPUTADO,space(11) as nuevogas;
                 from caj into table (tmp) ;
                 where (proveedor .and. caj.codcli=m.procod) .and.;
                 (fechaop>=fecini .and. fechaop<=fecfin);
                 order by fechaop ASC
               repl all CAJADESC with iif(xseek(caja,"MIX","BANCOD"),mix.texto1,"CAJA PRINCIPAL")
               repl all IMPUTADO with iif(xseek(gasto,"MIX","GASCOD"),mix.texto1,repl("*",20))
               use
               sele 25
               use (tmp) alias tmp
               on key label TAB keyboard chr(23)
               =UNWORK()
               =moveWIN(3,0,22,79,'win'," Reimputaci¢n - "+alltr(pro.proveedor),' [TAB] Reimputa - [ESC] Sale ')
               m.alguno=.f.
               do while .t.
                  sele tmp
                  browse fields ;
                    fechaop     :H='FECHA OP':R,;
                    cajadesc:20 :H='CUENTA':R,;
                    a=(alltrim(compre)+'-'+numere):15 :H='COMPROBANTE':R,;
                    monto       :H='IMPORTE':P=picu:R,;
                    imputado:20 :H='GASTO' :R;
                    in window win nomenu noclea
                  if last()=27
                     exit
                  else
                     if eligas("Nueva Imputaci¢n",-1,1)
                        sele tmp
                        repl imputado with mix.texto1
                        repl nuevogas with left(mix.texto2,11)
                        store .t. to m.alguno
                     endif
                  endif
               enddo
               on key label TAB
               if m.alguno .and. confirma("Reimputaci¢n ",.t.,20,20)
                  sele tmp
                  scan for !empty(nuevogas)
                     sele caj
                     set order to tag fechaop
                     if seek(tmp.fechaop)
                        scan while caj.fechaop=tmp.fechaop
                           if caj.proveedor .and. caj.codcli=tmp.codcli .and. eq_reg("CAJ","TMP")
                              repl caj.gasto with tmp.nuevogas
                              =repuse()
                              =iaud('caja:'+caj.caja+' '+tmp.gasto+' POR '+tmp.nuevogas)
                              exit
                           endif
                           sele caj
                        ends
                     endif
                     sele tmp
                  ends
               endif
               =relewin("win")
            endif
         endif
      ELSE
         EXIT
      ENDIF
   ENDDO
ELSE
   =Iaudi()
ENDIF
=MEN_LIN(BOTOM)
return
