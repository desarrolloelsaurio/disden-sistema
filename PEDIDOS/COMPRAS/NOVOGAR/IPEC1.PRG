FUNCTION IPEC1
PARAMETER ESREMITO
IF ESREMITO
   M.ALIASOK="RE1"
   M.NROOK=m.REMITO
ELSE
   M.ALIASOK="PE1"
   M.NROOK=m.pedido
ENDIF
DO WHILE .T.
   SELE (M.ALIASOK)
   SCAT MEMV BLANK
   m.marca  = 1
   m.procod = pro.procod
   IF ren>22
      =for_say(10,23,0,rebla)
      ren=10
   ENDIF
   ACTI WIND win2
   STORE nul TO respuesta
   IF !EMPTY(elimer("",ren,c1,.t.))
      SELE MER
      =XSEEK(MER1.ARTICULO,"MER","ARTICULO")
      m.articulo   = mer.articulo
      m.descripcio = LEFT(mer.merca,29)
      ACTI WIND win2
      @ ren ,c1 GET m.articulo
      @ ren ,c2 GET m.descripcio
      CLEAR GETS
      nada = '  '
      @ ren, c3 GET m.cantidad PICT "@Z 9999999999"
      READ
      IF m.cantidad>nul
         @ ren,c4 get m.monto pict '999,999,999.99'
         read
         IF confirm1("el Ingreso",.T.,20,10)
            puntero=puntero+1
            dime pexito[puntero,10]
            pexito[puntero,1]=m.NROOK
            pexito[puntero,2]=m.procod
            pexito[puntero,3]=mer.articulo
            pexito[puntero,4]=''
            pexito[puntero,5]=m.cantidad
            pexito[puntero,6]=m.monto
            pexito[puntero,7]=nul
            pexito[puntero,8]=nul
            =REPUSE1(@PEXITO,PUNTERO,iif(esremito,7,9))
            if m.monto#mer.costo
               =movewinn(10,10,18,70,'win5')
               @ 1,0 say padc("DETECTO DIFERENCIAS DE PRECIO",WCOLS())
               @ 3,1 SAY "ARTICULO      :"
               NADA=MER.MERCA
               @ 3,20 GET NADA
               @ 4,1 SAY "COSTO ANTERIOR:"
               NADA=MER.COSTO
               @ 4,20 GET NADA PICT '999,999,999.99'
               @ 5,1 SAY "NUEVO COSTO   :"
               NADA=M.MONTO
               @ 5,20 GET NADA PICT '999,999,999.99'
               CLEA GETS
               algo='NO'
               @ 7,1 SAY 'CAMBIA EL COSTO ? ' GET ALGO PICT '@M NO,SI' ;
                 MESS 'Modifica el Costo del Producto de acuerdo al '+IIF(ESREMITO,'Remito ?','Pedido ?')
               read
               if ALGO="SI" .and. last()#27
                  =men_lin("Grabando Nuevo Precio")
                  sele mer
                  registro=str(recno())
                  =lock() .or. lok()
                  repl mer.costo with m.monto
                  unlo in mer
                  SELE (M.ALIASOK)
               endif
               =relewin('win5')
            endif
            ren=ren+1
         endif
      ELSE
         DO cartel2 WITH "DEBE TENER UNA CANTIDAD","","(NO PUEDE SER CERO)",""
         @ REN,nul SAY REBLA
      ENDIF
   ELSE
      IF LAST()=27
         EXIT
      ENDIF
   ENDIF
ENDDO
RETURN !EMPTY(PUNTERO)
