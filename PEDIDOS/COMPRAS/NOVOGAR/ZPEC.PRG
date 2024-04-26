*:*********************************************************************
*-- Programa: ZPEC.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : INGRESA NOTAS DE PEDIDO PROVEEDORES
*--           MODIFICACION 26-03-92
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- Modificaci¢n GOYO 07-27-92 06:43pm RECORTE TIPOFAC.
*-- Modificaci¢n GOYO 08-10-92 03:58pm Adaptaci¢n IPEC -> ZPEC
*-- Modificaci¢n GOYO 02-09-93 01:16pm Agrega a Zpec -> Mpec (Muestra)
*:**********************************************************************
parameter muestra,SIGUEDELARGO
*m.unitario = busuni()
#DEFINE PICU "999,999,999,999.99"
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
STORE HORA_ULP(PROGRAM()) TO ulpr
IF CHEQSEG()
   =movewinn(0,0,24,79,'win2')
   REBLA=pecmask()
   SELE pec
   SCAT MEMV
   STORE nul TO respuesta,puntero,pexito
   IF XSEEK(M.PROCOD,'PRO','PROCOD')
      m.procod = pro.procod
      ACTI WIND win2
      @ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
      @ 2,nul SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
      =XSEEK(PRO.LOCAL,'MIX','CIUCOD')
      @ 3,nul SAY MIX.TEXTO1
      SELE pec
      @ 1,53 GET m.pedido PICT "@!"
      CLEA GETS
      STORE nul TO respuesta
      nada = JANNAME
      ACTI WIND win2
      @ 2,53 GET nada
      CLEA GETS
      @ 3,53 GET m.fechaem
      @ 4,15 say zpec11(m.condpago1)
      @ 5,15 say zpec11(m.condpago2)
      @ 6,15 say zpec11(m.condpago3)
      @ 4,53 GET m.PRESUP1 PICT PICU
      @ 5,53 GET m.PRESUP2 PICT PICU
      @ 6,53 GET m.PRESUP3 PICT PICU
      CLEA GETS
      ren=10
      sele pe1
      =seek(pec.pedido+pec.procod)
      scan while pe1.pedido=pec.pedido .and. pe1.procod=pec.procod
         @ ren ,c1 say pe1.articulo
         =xseek(pe1.articulo,'mer','articulo')
         @ ren ,c2 say mer.merca
         @ ren, c3 say pe1.cantidad PICT "@Z 9999999999"
         @ ren,c4 say pe1.monto pict '999,999,999.99'
         IF MUESTRA .AND. ;
         REN>21
            WAIT ENTERCON WIND
         ENDIF
         ren=IIF(ren>21,10,REN+1)
      endscan
      if !muestra
         =XMERP()
         IF IPEC1()
            IF confirma("Grabar Agregados a la Nota de Pedido",.T.,17,10)
               =AGRABAR("PE1",@PEXITO)
               =iaud(PEC.PEDIDO+PAIP+PRO.PROCOD)
            ENDIF
         ENDIF
         =closdbf("MER1")
      ELSE
      IF !SIGUEDELARGO
         WAIT ENTERCON WIND
         ENDIF
      endif
   ENDIF
   IF !SIGUEDELARGO
   =RELEWIN("win2")
   ENDIF
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
