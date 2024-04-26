********************************************************************************
*-- Programa: ICOBp.PRG
*-- Fecha   : 08/29/91
*-- Versi¢n : V.LEEGSTRA - G. REINER
*-- Notas   : INGRESO COBROS
********************************************************************************
PARAMETER tomon,ESMERCA
DEFI WIND win1 FROM IIF(ESMERCA,6,7),10 TO IIF(ESMERCA,22,17),60 TITL " Forma de Pago " DOUB SHAD COLO SCHE 8
ACTI WIND win1
@ 1,1 SAY "MONTO DE LA DEUDA:"
@ 1,20 GET tomon PICT '999999999.99'
CLEA GETS
DIME cheque[3,4]
STOR NUL TO tarjeta,cheques,efecaus,efecdol,sumpag,cheque,SENIA
STORE '999999999.99' TO picu
@ IIF(ESMERCA,13,7),1 say 'PAGADO'
@ IIF(ESMERCA,13,7),20 GET sumpag PICT picu
CLEA GETS
DO WHILE .T.
   @ 3,1 SAY "PAGO EN "+ALLTRIM(UPPER(xauss))
   @ 3,20 GET efecaus PICTURE picu MESS 'Monto del Pago en '+xauss
   @ 4,1 SAY "PAGO EN "+ALLTRIM(UPPER(xadols))
   @ 4,20 GET efecdol PICTURE picu MESS 'Monto del Pago en '+xadols
   IF ESMERCA
      @ 5,1 SAY "SE¥A (N§ FACTURA)"
      @ 5,20 GET SENIA pict '9999999'
      @ 7,1 SAY "PAGO CON TARJETA"
      @ 7,20 GET tarjeta PICTURE picu MESS 'Monto del Pago con Tarjeta de Cr‚dito'
      FOR A=1 TO 3
         @ 8+A,1 SAY "CHEQUE "+ALLTRIM(STR(A))
         @ 8+A,20 GET cheque[A,1] PICTURE picu MESS 'Monto del '+ALLTRIM(STR(A))+'§ Cheque'
      ENDFOR
   ENDIF
   READ
   @ IIF(ESMERCA,13,7),1 say 'TOTAL  '
   IF !EMPTY(SENIA)
      SELE FAC
      IF SEEK(m.SENIA)
         IF !BLOQUEO
            M.SENIA=FAC.MONTONET
            @ 5,20 GET SENIA pict picu
            clea gets
            senia1=recno("fac")
						SENIA2=SENIA
         ENDIF
      ENDIF
   ENDIF
   sumpag=efecaus+efecdol*NADA10+tarjeta+cheque[1,1]+cheque[2,1]+cheque[3,1]+SENIA
   @ IIF(ESMERCA,13,7),1 say 'PAGADO'
   @ IIF(ESMERCA,13,7),20 GET sumpag PICT picu
   CLEA GETS
   IF sumpag=tomon
      *** EFECTIVO EN MONEDA NACIONAL
      IF efecaus#NUL
         SELE caj
         SCAT MEMV BLAN
         m.caja='00'
         m.codcli=PER.codcli
         m.fechaop=fechaem
         m.compr='FACT N§ '+ALLTRIM(STR(m.factura))
         m.compre='RE'
         m.numere=m.factura
         m.monto=efecaus
         m.moneda=xauss
         m.equivale=efecaus/NADA10
         m.fecha=DATE()
         m.usuario=usador
         DO flok WITH "CAJ"
         APPE BLAN
         GATH MEMV
         UNLO IN caj
      ENDIF
      *** EFECTIVO EN DOLARES
      IF efecdol#NUL
         SELE caj
         SCAT MEMV BLAN
         m.caja='00'
         m.codcli=PER.codcli
         m.fechaop=fechaem
         m.compr='FACT N§ '+ALLTRIM(STR(m.factura))
         m.compre='RE'
         m.numere=m.factura
         m.monto=efecdol
         m.moneda=xadols
         m.equivale=efecdol
         m.fecha=DATE()
         m.usuario=usador
         DO flok WITH "CAJ"
         APPE BLAN
         GATH MEMV
         UNLO IN caj
      ENDIF
      IF tarjeta#NUL
         STOR NUL TO respuesta
         DO WHILE EMPTY(elitar("del Pago",-1,1))
            ACTI WIND win1
            STOR NUL TO respuesta
         ENDDO
         STORE "" TO respuesta
         DO WHILE EMPTY(respuesta)
            DO infic1 WITH "NUMERO DE TARJETA",10
            ACTI WIND win1
         ENDDO
         NUTAR=RESPUESTA
         TARTAR=MIX.TEXTO1
         SELE cch
         SCAT MEMV BLAN
         m.codcli=PER.codcli
         m.fechaop=fechaem
         m.tipo='TA'
         m.compr='FACT N§ '+ALLTRIM(STR(m.factura))
         m.compre='FA'
         m.numere=m.factura
         m.banco=mix.texto1
         m.nroche=respuesta
         m.monto=tarjeta
         m.moneda=xauss
         m.diasac=30-DAY(DATE())
         m.fechade=CTOD("31/"+STR(MONTH(DATE()))+"/"+STR(YEAR(DATE())))
         m.fechaac={}
         m.equivale=tarjeta/NADA10
         m.fecha=DATE()
         m.usuario=usador
         DO flok WITH "CCH"
         APPE BLAN
         GATH MEMV
         UNLO IN cch
      ENDIF
      IF cheque[1,1]+cheque[2,1]+cheque[3,1]#NUL
         FOR A=1 TO 3
            IF cheque[A,1]#NUL
               DEFINE WINDOW fic FROM 10,0 TO 17,78 DOUBLE TITL ' Datos del Cheque N§ '+alltrim(str(a)) SHADOW COLOR SCHE 8
               ACTI WINDOW fic
               @ 1,1 say 'BANCO'
               @ 2,1 say 'N§ de CHEQUE'
               @ 3,1 say 'FECHA DE DEPOSITO'
               @ 4,1 SAY 'Hs. ACREDITACION'
               STORE SPACE(30) TO COBAN
               STORE SPACE(10) TO NUCHE
               STORE DATE() TO FEdep
               STOR NUL TO HOAC
               DO WHILE .T.
                  @ 1,30 GET COBAN mess 'Banco de Origen del Cheque'
                  @ 2,30 get nuche mess 'N§ de Cheque'
                  @ 3,30 get fedep mess 'Fecha de Dep¢sito'
                  @ 4,30 get hoac pict '999' mess 'Horas de Acreditaci¢n'
                  read
                  if !empty(coban) .and. !empty(nuche) .and. !empty(fedep) .and. SIGN(hoac)>-1 .and. lastkey()#27
                     exit
                  endif
               enddo
               CHEQUE[A,2]=COBAN
               CHEQUE[A,3]=NUCHE
               CHEQUE[A,4]=FEDEP
               RELE WINDOW fic
               SELE cch
               SCAT MEMV BLAN
               m.codcli=PER.codcli
               m.fechaop=fechaem
               m.tipo='CH'
               m.compr='FACT N§ '+ALLTRIM(STR(m.factura))
               m.compre='FA'
               m.numere=m.factura
               m.banco=coban
               m.nroche=nuche
               m.monto=cheque[a,1]
               m.moneda=xauss
               m.diasac=hoac
               m.fechade=fedep
               m.fechaac={}
               m.equivale=CHEQUE[A,1]/NADA10
               m.fecha=DATE()
               m.usuario=usador
               =flock("CCH") .OR. flok("CCH")
               APPE BLAN
               GATH MEMV
               UNLO IN cch
            ENDIF
         ENDFOR
      ENDIF
      if !empty(senia)
      go senia1 in fac
      repl fac.bloqueo with .t.
      endif
      EXIT
   ELSE
      ? sumpag
      ? tomon
      DO mensaj1 WITH "EL MONTO DEL PAGO NO COINCIDE CON LA DEUDA GENERADA - CORRIJA POR FAVOR"
   ENDIF
ENDDO
RELE WIND win1
RETURN
