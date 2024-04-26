*:*********************************************************************
*-- Programa: IREC.PRG
*-- Fecha   : 06/06/91 04:30pm
*-- Versi¢n : G. REINER
*-- Notas   : INGRESA REMITOS DE PROVEEDORES
*:**********************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =MOVEWINN(NUL,NUL,24,79,'WIN2')
   REBLA=pecmask(.F.,.T.)
   SELE REC
   SCAT MEMV BLAN
   SELE pro
   STORE nul TO respuesta,puntero,pexito
   IF !EMPTY(elipro("",1,13))
      m.procod = pro.procod
      @ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
      @ 2,nul SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
      @ 3,nul SAY pro.localidad
      SELE REC
      @ 1,53 GET m.remito PICT "@!";
        MESS 'Ingrese Nro de Remito - [ENTER] p/menu'
      READ
      store Q_FAC(m.remito) to m.remito,m.numero
      @ 1,53 GET m.remito
      CLEA GETS
      IF !EMPTY(m.remito) .AND. RIGHT(m.remito,8)#'00000000'
         SELE REC
         IF !SEEK(m.remito+m.procod)
            STORE nul TO respuesta
            IF !EMPTY(ELIEMP(' [ESC] para Men£ ',2,53))
               m.marca = MIX.NU1
               nada = MIX.TEXTO1
               ACTI WIND win2
               @ 2,53 GET nada
               CLEA GETS
               m.fecharem = DATE()
               @ 3,53 GET m.fecharem
               READ
               DO WHILE m.fecharem>DATE()
                  DO cartel2 WITH "La fecha no puede ser mayor","","a la fecha del d¡a de HOY",""
                  m.fecharem = DATE()
                  @ 3,53 GET m.fecharem
                  READ
               ENDDO
               ren=8
					=XMERP()
	               IF IPEC1(.T.)
                  IF confirma("Grabar el Remito",.T.,17,10)
                     m.numero=m.remito
                     =AGRABAR("REC")
                     =AGRABAR("RE1",@PEXITO)
                     FOR XA=1 TO ALEN(PEXITO,1)
                     IF XSEEK(PEXITO[XA,3],'MER','ARTICULO')
                        =LOCK("MER") .OR. LOCK("MER",STR(RECNO("MER")))
                        REPL MER.STOCK WITH MER.STOCK+PEXITO[XA,5]
                        UNLO IN MER
                     ENDIF
                     NEXT
                  ENDIF
               ENDIF
               sele mer
               set filter to
         ENDIF
            ELSE
               =cartel2("LA NOTA DE PEDIDO N§ "+ALLTRIM(m.remito)," DEL PROVEEDOR "+ALLTRIM(pro.proveedor)," YA FUE INGRESADA","SOLO SE PUEDE MODIFICAR")
            ENDIF
      ENDIF
   ENDIF
   =RELEWIN("win2")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
