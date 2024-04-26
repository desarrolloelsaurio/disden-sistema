*********************************************************************************
*-- Programa: IIMPINQ.PRG
*-- Fecha   : 10/10/91
*-- Versi¢n : G. REINER
*-- Notas   : INGRESO DE IMPUESTOS
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   me1=" - [ESC] para Salir"
   PICU="99999999999.99"
   DO WHIL .T.
      =movewin(3,10,15,69,"win","Impuestos",ALLTRIM(JANNAME))
      sele ccl
      scat memv blan
      col=30
      @ 1,1 SAY "Inmueble"
      @ 2,1 SAY "Ubicaci¢n"
      @ 3,1 SAY "Propietario"
      @ 4,1 SAY "Inquilino"
      @ 5,1 SAY "Impuesto"
      @ 6,1 SAY "Importe"
      @ 7,1 SAY "Fecha de vencimiento"
      @ 8,1 SAY "Moneda"
      @ 9,1 SAY "Cotizaci¢n"
      @10,1 SAY "Nota"
      SELE inm
      STOR NUL TO respuesta
      IF !EMPTY(eliinm(" - [ESC] para Salir",1,COL,"T"))
         scat memv
         if EMPTY(inm.codcli)
            m.inqui=' ** NO ESTA ALQUILADO ** '
         else
            if xseek(inm.CODCLI,'PER',"CODCLI")
               m.inqui=Alltrim(PER.CODCLI)+' '+Alltrim(PER.CLIENTE)
            else
               m.inqui=Alltrim(PER.CODCLI)+' ** FALTA EN ARCHIVO **'
            endif
         endif
         if xseek(inm.PROCOD,"PRP","PROCOD")
            m.propi=Alltrim(PRP.PROCOD)+' '+Alltrim(PRP.PROVEEDOR)
         else
            m.propi=Alltrim(PRP.PROCOD)+' ** FALTA EN ARCHIVO **'
         endif
         acti wind win
         @ 1,col GET m.codinm
         @ 2,col GET m.domicilio
         @ 3,col GET m.propi
         @ 4,col GET m.inqui
         CLEA GETS
         if eliimp("a ingresar",5,col)
            m.nada=mix.texto1
            m.comprre=left(mix.texto2,2)
            @ 5,col GET m.nada
            clear gets
            STOR DATE() TO fechave
            STOR xauss TO m.moneda
            STOR "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
            STOR xacotiz TO m.cotizadol
            @ 6,col GET m.monto
            @ 7,col GET m.fechave
            @ 8,col GET m.moneda PICT nn
            @ 9,col GET m.cotizadol PICT PICU
            @10,col GET m.detalle PICT "@!"
            READ
            IF LASTKEY()#27
               m.fechaop=date()
               if m.moneda=xadols
                  m.equivale=m.monto
                  m.monto   =m.monto*m.cotizadol
               else
                  m.equivale=m.monto/m.cotizadol
               endif
               IF confirma("el impuesto",.T.,19,40)
                  =AGRABAR(iif(empty(inm.codcli),"CCP","CCL"))
                  =LCREI(.T.)
               ENDI
            ENDI
         ENDI
      ELSE
         =relewin("win")
         EXIT
      endif
   ENDDO
   deac wind ALL
ELSE
   =iaudi()
ENDI
RETURN MEN_LIN(BOTOM)
