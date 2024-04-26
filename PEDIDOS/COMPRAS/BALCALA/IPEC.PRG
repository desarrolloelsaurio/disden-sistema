*:*********************************************************************
*-- Programa: IPEC.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : INGRESA NOTAS DE PEDIDO PROVEEDORES
*--           MODIFICACION 26-03-92
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- Modificaci¢n GOYO 07-27-92 06:43pm RECORTE TIPOFAC.
*-- Version BALCALA - MULTIEMPRESA
*:**********************************************************************
SELE seg
STORE HORA_ULP(PROGRAM()) TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   =MOVEWINN(NUL,NUL,24,79,'WIN2')
   REBLA=pecmask()
   SELE pec
   SCAT MEMV BLAN
   SELE pro
   STORE nul TO respuesta,puntero,pexito
   IF !EMPTY(elipro("",1,13))
      m.procod = pro.procod
      @ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
      @ 2,nul SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
      @ 3,nul SAY pro.localidad
      SELE Pec
      @ 1,53 GET m.pedido PICT "@!";
        MESS 'Ingrese Nro de Pedido [ENTER] p/menu'
      READ
      M.PEDIDO=Q_FAC(M.PEDIDO)
      @ 1,53 GET M.PEDIDO
      CLEA GETS
      IF !EMPTY(m.pedido) .AND. RIGHT(M.PEDIDO,8)#'00000000'
         SELE pec
         IF !SEEK(m.pedido+m.procod)
            STORE nul TO respuesta
            IF !EMPTY(ELIEMP(' [ESC] para Men£ ',2,53))
               m.marca = MIX.NU1
               nada = MIX.TEXTO1
               ACTI WIND win2
               @ 2,53 GET nada
               CLEA GETS
               m.fechaem = DATE()
               @ 3,53 GET m.fechaem
               READ
               DO WHILE m.fechaem>DATE()
                  DO cartel2 WITH "La fecha no puede ser mayor","","a la fecha del d¡a de HOY",""
                  m.fechaem = DATE()
                  @ 3,53 GET m.fechaem
                  READ
               ENDDO
               RELE CONDPAGO,PRESUP
               DIME CONDPAGO[3],PRESUP[3]
               STORE '' TO CONDPAGO
               STORE NUL TO PRESUP
               FOR A=1 TO 3
                  STORE nul TO respuesta
                  IF !EMPTY(elipag("",3+A,15))
                     CONDPAGO[A]=LEFT(MIX.TEXTO2,2)
                     nada = mix.texto1
                     @ 3+A,15 GET nada PICT "@R 999-999-999-999-999-999"
                     CLEAR GETS
                     @ 3+A,53 GET PRESUP[A] PICT "999,999,999,999.99"
                     READ
                  ELSE
                     EXIT
                  ENDIF
               NEXT
               M.CONDPAGO1=CONDPAGO[1]
               M.CONDPAGO2=CONDPAGO[2]
               M.CONDPAGO3=CONDPAGO[3]
               M.PRESUP1=PRESUP[1]
               M.PRESUP2=PRESUP[2]
               M.PRESUP3=PRESUP[3]
               ren=10
               =XMERP()
               IF IPEC1()
                  IF confirma("Grabar la nota de pedido",.T.,17,10)
                     m.FECHAPROM=INFEC("WFE",'Entrega Prometida')
                     =AGRABAR("PEC")
                     =AGRABAR("PE1",@PEXITO)
                     =IAUD(M.PEDIDO+PAIP+PRO.PROCOD)
                  ENDIF
               ENDIF
               sele mer
               SET ORDER TO TAG ARTICULO
         ENDIF
            ELSE
               =cartel2("LA NOTA DE PEDIDO N§ "+ALLTRIM(m.pedido)," DEL PROVEEDOR "+ALLTRIM(pro.proveedor)," YA FUE INGRESADA","SOLO SE PUEDE MODIFICAR")
            ENDIF
      ENDIF
   ENDIF
   =RELEWIN("win2")
ELSE
   =IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
