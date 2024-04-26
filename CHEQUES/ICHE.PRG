********************************************************************************
*-- Programa: ICHE.PRG
*-- Fecha   : 10/16/91
*-- Versi¢n : V.LEEGSTRA
*-- Notas   : INGRESO CHEQUES
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
SELE Seg
STOR HORA_ULP(PROGRAM()) TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   STOR nul TO kok
   STORE "99999999999.99" TO picu
	 =win0()
   =movewin(icher,ichec,icher+ichela+1,ichec+ichean,"winche"," Ingreso cheques ")
      STOR 26 TO COL
      SELE cch
      SCAT memv BLAN
		SELE PER
      STOR nul TO respuesta
      IF !EMPTY(elicli(" - [ESC] para Salir",1,COL))
         STOR kok+1 TO kok
         m.codcli = PER.codcli
         nadacli = PER.codcli
         nadclien = PER.cliente
         acti wind winche
         @ 3,COL SAY LEFT(PER.cliente,25)
         @ 4,COL SAY "C¢d.Cliente:"+Alltrim(PER.codcli)
         @ 6,COL SAY "Marca:"
         SELE mar
         STOR nul TO respuesta
         IF !EMPTY(ELIEMP(" - [ESC] para Salir",6,COL))
            STOR respuesta TO numarca
            acti wind winche
            @ 6,COL+6 SAY ALLTRIM(mar.marca)
            STOR '' TO refe,rche,rdoc
            defi popu elije from 15, 30
            defi pad 1 of elije PROM '\<DOCUMENTO' MESS 'Pago con documentos'
            defi pad 2 of elije PROM '\<CHEQUE'    MESS 'Pago con cheques'
            defi pad 3 of elije PROM '\<FINALIZA'  MESS 'Fin de ingresos - Emisi¢n de Recibos'
            defi pad 4 of elije PROM '\<ANULA'     MESS 'Salir - Borra los datos ingresados'
            on sele bar 1 of popu elije do dociche
            on sele bar 2 of popu elije do cheiche
            on sele bar 3 of popu elije do finiche
            on sele bar 4 of popu elije do AnUiche
            acti popu elije
            rele popu elije
         ENDI
      ENDI
   iif(EMPTY(kok),.t.,iaud('INGRESO DE CHEQUES'))
else
   =iaudi()
ENDI
=men_lin(botom)
return
*
procedure dociche
SELE cch
SCAT memv BLANK
DO WHIL .T.
   STOR DATE() TO m.fechade
   =movewin(10,10,18,70,'windoc'," Documentos")
   STOR xauss TO nadamo
   @ 1,1 SAY "N§ de Documento:" GET m.nroche PICT "@X";
     MESS "N§ del documento - [ESC] para Salir"
   @ 2,1 SAY "Observaciones  :"
   @ 3,1 SAY "Moneda:"
   @ 4,1 SAY "Monto :"
   @ 4,30 SAY "Fecha vencimiento:"
   READ
   IF LASTKEY()=27 .OR. EMPTY(m.nroche)
      IF !EMPTY(rdoc)
         CLEA
         @ nul,1 SAY (padc("N§Documento",15)+" "+padc("Observaciones",15)+"  "+padc(("Monto ("+ALLTRIM(xadols)+")"),15)+" "+padc("Fecha",8))
         store 1 to ren, NADA1
         store nul I,nadtot
         STOR LEFT(rdoc,LEN(rdoc)-1)  to nadrdoc,nada10
         STOR occur(",",nadrdoc) to nahasta
         do WHIL !i>nahasta
            IF I<nahasta
               STOR AT(",",nadrdoc) TO nada
               IF !EMPTY(nada)
                  STOR nada-nada1 TO nada2
                  STOR SUBS(nadrdoc,nada1,nada2) TO nadpos
                  STOR SUBS(nadrdoc,nada+1,LEN(nadrdoc)-nada) TO nadrdoc
                  GO VAL(nadpos)
               ELSE
                  GO VAL(nadrdoc)
               ENDI
            ELSE
               GO VAL(nadrdoc)
            ENDI
            IF !EMPTY(cch.codcli)
               @ ren,nul SAY cch.nroche
               @ ren,16 SAY cch.banco
               @ ren,33 SAY cch.equivale
               @ ren,50 SAY cch.fechade
               STOR nadtot+cch.equivale TO nadtot
               I=I+1
               IF ren=5
                  @ 1,nul CLEAR TO 5,59
                  ren=1
               ELSE
                  ren=ren+1
               ENDI
            ENDI
         ENDD
         IF ren=5
            @ 5,nul CLEAR TO 5,59
         ELSE
            ren=ren+1
         ENDI
         @ ren,1 SAY "Un total de "+ALLTRIM(STR(nadtot,14,2))+" "+ALLTRIM(XADOLS)+" en "+ALLTRIM(STR(nahasta+1))+IIF (nahasta>nul," documentos"," documento")
         IF !confirma ('Los Datos Ingresados',.T.,20,41)
            SELE cch
            go top
            STOR LEFT(rdoc,LEN(rdoc)-1)  to nadrdoc,nada10
            STOR occur(",",nada10) to nahasta
            nada1=1
            STOR nul TO nadesdoc,i
            do WHIL !i>nahasta
               IF I<occur(",",nada10)
                  STOR AT(",",nadrdoc) TO nada
                  IF !EMPTY(nada)
                     STOR nada-nada1 TO nada2
                     STOR SUBS(nadrdoc,nada1,nada2) TO nadpos
                     STOR SUBS(nadrdoc,nada+1,LEN(nadrdoc)-nada) TO nadrdoc
                     GO VAL(nadpos)
                  ELSE
                     GO VAL(nadrdoc)
                  ENDI
               ELSE
                  GO VAL(nadrdoc)
               ENDI
               STOR nadesdoc+cch.equivale TO nadesdoc
               dele
               i=i+1
            ENDD
            ACTI WIND win
            rdoc=''
         ENDI
      ENDI
      RELE wind windoc
      acti wind win
      EXIT
   ENDI  && LASTKEY()=27
   @ 2,18 GET m.banco PICT "@!" MESS "Observaciones Documento"
   @ 3,9  GET nadamo PICT "@M &xauss,&xadols" MESS "Moneda en que se expide el documento"
   @ 4,9  GET m.monto PICT picu MESS "Cantidad"
   @ 4,50 GET m.fechade RANGE CTOD("01/01/91") MESS "Fecha de vencimiento del documento"
   READ
   IF !EMPTY(m.monto)
      STOR nadamo TO m.moneda
      IF m.moneda#xadols
         STOR xacotiz TO nada
         @ 5,1 SAY "Cotizaci¢n:" GET nada PICT picu MESS "Cotizaci¢n"
         READ
         STOR m.monto/nada TO m.equivale
         @ 6,1 SAY "Monto equivalente en "+Alltrim(xadols)+"="+Alltrim(STR(m.equivale,14,2))
      ELSE
         STOR m.monto TO m.equivale
      ENDI
      IF confirma ('Los Datos Ingresados',.T.,20,40)
         m.codcli = nadacli
         m.fechaop = DATE()
         m.tipo = "DO"
         m.usuario = usador
         m.fecha = DATE()
=AGRABAR("CCH")
         rdoc=rdoc+Alltrim(STR(RECNO()))+","
         acti wind win
         acti wind windoc
      ENDI
   END
ENDD
retu
*
proce cheiche
SELE cch
SCAT memv BLANK
DO WHIL .T.
   STOR DATE() TO m.fechade
   =movewin(10,10,18,70,'wincheq'," Cheques")
   STOR xauss TO nadamo
   @ 1,1 SAY "N§ Cheque:" GET m.nroche PICT "@X" MESS "N§ del cheque - [ESC] para Salir"
   @ 2,1 SAY "Banco    :"
   @ 2,35 SAY "Moneda      :"
   @ 3,1 SAY "Monto    :"
   @ 3,35 SAY "Fecha cheque:"
   @ 4,1 SAY "Horas de acreditaci¢n del cheque:"
   READ
   @ 2,12 GET m.banco PICT "@!" MESS "Cheque del Banco"
   @ 2,49 GET nadamo PICT "@M &xauss,&xadols" MESS "Moneda en que se expide el cheque"
   @ 3,12 GET m.monto PICT picu MESS "Cantidad"
   @ 3,49 GET m.fechade RANGE CTOD("01/01/91") MESS "Fecha del cheque"
   @ 4,35 GET m.diasac PICT "999" MESS "Horas de acreditaci¢n del Cheque"
   READ
   IF !EMPTY(m.banco) .AND. !EMPTY(m.monto)
      STOR nadamo TO m.moneda
      IF m.moneda#xadols
         STOR xacotiz TO nada
         @ 5,1 SAY "Cotizaci¢n:" GET nada PICT picu MESS "Cotizaci¢n"
         READ
         STOR m.monto/nada TO m.equivale
         @ 6,1 SAY "Monto equivalente en "+Alltrim(xadols)+"="+Alltrim(STR(m.equivale,14,2))
      ELSE
         STOR m.monto TO m.equivale
      ENDI
      IF confirma ('Los Datos Ingresados',.T.,20,40)
         =flock("CCH") .or. flok("cch")
         m.codcli = nadacli
         m.fechaop = DATE()
         m.tipo = "CH"
         m.usuario = usador
         m.fecha = DATE()
				 insert into cch from memv
         rche=rche+Alltrim(STR(RECNO()))+","
         UNLO in cch
				 acti wind win
         @ nul,1 SAY (padc("N§Cheque",15)+" "+padc("Banco",15)+"  "+padc(("Monto ("+ALLTRIM(xadols)+")"),15)+" "+padc("Fecha",8))
         @ row()+1,nul SAY cch.nroche
         @ row(),16 SAY cch.banco
         @ row(),33 SAY cch.equivale
         @ row(),50 SAY cch.fechade
*****    @ ren,1 SAY "Un total de "+ALLTRIM(STR(nadtot,14,2))+" "+ALLTRIM(XADOLS)+" en "+ALLTRIM(STR(nahasta+1))+IIF (nahasta>nul," cheques"," cheque")
      ENDI
   ENDI
ENDD
=relewin('wincheq')
retu
*
proc finiche
rche=rche+rdoc
rche=LEFT(rche,LEN(rche)-1)  && registros de cheques  y docum. agregados
IF !EMPTY(rche)
   SELE cch
   registro=rche
   DO lok WITH "cch"
   STOR 1 TO nada1
   STOR rche TO nadrche
   I=nul
   STOR occur(",",rche) TO nahasta
   STOR .T. TO sigue
   DO WHIL (!I>nahasta) .AND. sigue
      SELE cch
      IF I<OCCUR(",",rche)
         STOR AT(",",nadrche) TO nada
         IF !EMPTY(nada)
            STOR nada-nada1 TO nada2
            STOR SUBS(nadrche,nada1,nada2) TO nadpos
            STOR SUBS(nadrche,nada+1,LEN(nadrche)-nada) TO nadrche
            GO VAL(nadpos)
         ELSE
            GO VAL(nadrche)
            STOR .F. TO sigue
         ENDI
      ELSE
         GO VAL(nadrche)
         STOR .F. TO sigue
      ENDI
      PUNMAR=(M.MARCA-1)*20+7
      GO PUNMAR IN DOC
      REGISTRO=STR(PUNMAR)
      =lock('DOC') .or. LOK("DOC")
      nadare=DOC.NUMERO
      REPL DOC.NUMERO WITH DOC.NUMERO+1
      UNLO IN DOC
      m.compr = "RE. N§"+Alltrim(STR(nadare))
      REPL cch.compr WITH m.compr
      I=I+1
   ENDD
   UNLO IN cch
   ACTI WIND win
ENDI
COPIAS=COPIAS("del RECIBO",.T.,20,40)
ACTI SCREE
IF !EMPTY(COPIAS)
   DO LRECI
ENDI
retu
*
proce anuiche
rche=rdoc+rche
rche=LEFT(rche,LEN(rche)-1)  && registros de cheques  y docum. agregados
IF !EMPTY(rche)
   SELE cch
   go top
   STOR rche to nadrche,nada10
   STOR occur(",",nada10) to nahasta
   i=nul
   nada1=1
   STOR .T. TO sigue
   DO WHIL !i>nahasta .AND. sigue
      IF I<occur(",",nada10)
         STOR AT(",",nadrche) TO nada
         IF !EMPTY(nada)
            STOR nada-nada1 TO nada2
            STOR SUBS(nadrche,nada1,nada2) TO nadpos
            STOR SUBS(nadrche,nada+1,LEN(nadrche)-nada) TO nadrche
            GO VAL(nadpos)
         ELSE
            GO VAL(nadrche)
            STOR .F. TO sigue
         ENDI
      ELSE
         GO VAL(nadrche)
         STOR .F. TO sigue
      ENDI
      dele
      i=i+1
   ENDD
   rche=''
ENDI
retu
