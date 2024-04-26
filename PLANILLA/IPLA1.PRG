********************************************************************************
*-- Programa: IPLA1.PRG
*-- Fecha   : 12/22/91
*-- Version : V.LEEGSTRA
*-- Notas   : INGRESA PLANILLA
********************************************************************************
		STORE HORA_ULP(PROGRAM()) to ULPR
		IF CHEQSEG()
   stor xacotiz to nacotiz
   stor date() to nafecha
   sigue=.T.
   stor xauss to namoneda
   define window win from 0,0 to 23,79 titl " Ingreso Planilla " none color sche 8
   acti wind win
   A="Ú"+REPLICATE("Ä",19)+"Â"+REPLICATE("Ä",12)+"Â"+REPLICATE("Ä",12)+"Â"+REPLICATE("Ä",12)+"Â"+REPLICATE("Ä",6)+"Â"+REPLICATE("Ä",11)+"¿"
   B="³"+REPLICATE(' ',19)+"³"+REPLICATE(' ',12)+"³"+REPLICATE(' ',12)+"³"+REPLICATE(' ',12)+"³"+REPLICATE(' ',6)+"³"+REPLICATE(' ',11)+"³"
   C="Ã"+REPLICATE("Ä",19)+"Å"+REPLICATE("Ä",12)+"Å"+REPLICATE("Ä",12)+"Å"+REPLICATE("Ä",12)+"Å"+REPLICATE("Ä",6)+"Å"+REPLICATE("Ä",11)+"´"
   D="À"+REPLICATE("Ä",19)+"Á"+REPLICATE("Ä",12)+"Á"+REPLICATE("Ä",12)+"Á"+REPLICATE("Ä",12)+"Á"+REPLICATE("Ä",6)+"Á"+REPLICATE("Ä",11)+"Ù"
   @ 0,0 SAY A
   @ 1,0 SAY B
   @ 1,1  SAY "MERCADERIA"
   @ 1,21 SAY "CANTIDAD"
   @ 1,34 SAY "PRECIO UNIT."
   @ 1,47 SAY "PRECIO TOTAL"
   @ 1,60 SAY "REMESA"
   @ 1,67 SAY "PROVEEDOR"
   @ 2,0 SAY C
   FOR ren=3 TO 22
      @ ren,0 SAY B
   ENDFOR
   @ ren,0 SAY D
   REN=3
   c1=1
   c2=21
   c3=34
   c4=47
   c5=60
   c6=67
   stor " Ingreso Datos de la Planilla - " to me1
   stor 0 to kok,respuesta,nacompr,namonto
   stor space(19) to naclien,navende
   stor space(13) to naclien
   stor "" to naplareg,nakarreg
   sele mer
   stor padl(LEFT(CHRTRAN(mer.palpopup," ",""),19),19) to napalpo
   store mer.rubro+mer.variedad+mer.calidad to namerca
   define window win1 from 8,10 to 17,69 titl " Datos de la Planilla " color sche 8
   acti wind win1
   @ 1,2 say "N§ de comprobante       :" get nacompr
   @ 2,2 say "Cliente                 :" get naclien
   @ 3,2 say left(biaja+space(24),24)+":" get navende
   @ 4,2 say "Fecha de la operaci¢n   :" get nafecha
   @ 5,2 say "Moneda en que se factura:" get namoneda
   clea gets
   @ 1,28 get nacompr picture "999999999999";
     mess "N§ del comprobante - 0 para Salir"
   read
   if !empty(nacompr) .and. lastkey()#27
		SELE PER
      set order to 2
      nacodcli=iif(elicli(" Comprador - [ESC] para Salir ",2,28)=0,0,PER.codcli)
      if !empty(nacodcli) .and. lastkey()#27
         acti wind win1
         naclien=PER.cliente
         @ 2,28 get naclien
         clea gets
         sele via
         store 0 to respuesta
         nacodvia=iif(elivia(biaja+" - [ESC] para Salir ",3,28)=0,0,via.codvia)
         if !empty(nacodvia) .and. lastkey()#27
            acti wind win1
            navende=via.viajante
            @ 3,28 get navende
            clea gets
            nn="@M "+xauss+","+xadols
            @ 4,28 get nafecha picture "@D" mess "Fecha de la operaci¢n"
            @ 5,28 get namoneda picture nn mess "Moneda en que se factura"
            read
            if namoneda=xadols
               @ 6,2 say "Cotizaci¢n:" get nacotiz picture "99999999999.99";
                 mess "Cotizaci¢n del d¡a - [ESC] para Salir"
               read
               if lastkey()=27
                  sigue=.F.
               endif
            endif
         else
            sigue=.F.
         endif
      else
         sigue=.F.
      endif
   else
      sigue=.F.
   endif
   rele wind win1
   do whil sigue
      stor 0 to nacanti,naunita
      acti wind win
      @ ren,c1 get napalpo mess "[Tecla] y [ENTER] para elegir - [ESC] para salir "
      read
      if lastkey()#27
         if update() .or. empty(napalpo)
            SELE MER
            store 0 to respuesta
            napalpo=iif(elimer("de la Mercader¡a",ren,c1)=0,0,padl(LEFT(CHRTRAN(mer.palpopup," ",""),19),19))
            store mer.rubro+mer.variedad+mer.calidad to namerca
         endif
         acti wind win
         @ ren,c1 get napalpo
         clear gets
         @ ren,c2 get nacanti picture "999999999.99" mess "Cantidad de Bultos - Con 0 Salir"
         read
         if !empty(nacanti)
            @ ren,c3 get naunita picture "999999999.99" mess "Precio unitario - Con 0 Salir"
            read
            if !empty(naunita)
         nada=str(nacanti*naunita,12,2)
         @ ren,c4 get nada
         clea gets
         sele rem
         set order to 2
         nada=namerca+" "
         if seek(nada)
            narem=rem.remesa
            napro=rem.proveedor
            naprot=.T.
            nakgbul=rem.kgbulto
         else
            store 0 to narem,nakgbul
            napro="NO existe"
            naprot=.F.
         endif
         sele pro
         set order to 1
         naprove=iif(seek(napro),left(pro.proveedor,11),space(11))
         @ ren,c5 get narem picture "999999"
         @ ren,c6 get naprove
         clea gets
         if confirma(" los Datos Ingresados",.t.,20,0)
            KOK=KOK+1
            namonto=namonto+naunita*nacanti
            ACTI SCRE
            @ 23,0 say padc(' Grabando los datos ingresados ',80,'*') colo sche 19
            do flok with "pla"
            sele pla
            appe blan
            scat memv blan
            m.merca=namerca
            m.cantidad=nacanti
            m.punitario=naunita
            m.cliente=nacodcli
            m.codvia=nacodvia
            m.compr=nacompr
            m.fecha=date()
            m.usuario=usador
            gath memv
            naplareg=naplareg+str(recno())+","
            unlo in pla
            do flok with "kar"
            sele kar
            appe blan
            scat memv blan
            m.fechaop=nafecha
            m.articulo=namerca
            m.opk=2
            m.docref="RM"
            m.nrodocref=narem
            m.cliente=napro
            m.proveedor=naprot
            m.unitario=naunita
            m.detalle="Venta de mercader¡a"
            m.salida=nacanti
            m.kilos=nakgbul
            m.fecha=date()
            m.usuario=usador
            gath memv
            nakarreg=nakarreg+str(recno())+","
            unlo in kar
            clea
            acti wind win
            @ 22,0 say B
            ren=iif(ren<22,ren+1,3)
         else
            @ ren,0 say B
         endif
         else
            @ ren,0 say B
         endif
         else
            @ ren,0 say B
         endif
      else
         exit
      endif
   enddo
   @ ren,0 say B
   if !empty(namonto)
      do icob with namonto
   endif
   if kok#0
      do iaud with 'ING '+alltrim(str(kok))+' PLANILLA'
   endif
   rele wind win
   rele like na*
else
   =IAUDI()
endif
=MEN_LIN(BOTOM)
return
