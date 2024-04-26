***************************************************************
*-- Programa: ELIFCO.PRG
*-- Fecha   : 12-10-91 09:31am
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE LA FACTURA
**************************************************************
FUNCTION elifco
=MOVECENT(1,0,6,78,'win2'," Elija la Factura ","[ESC] Abandona")
SELE far
SCAT MEMV BLAN
@ 1,2 SAY "Proveedor   :"
@ 2,2 SAY "Nro FACTURA :"
SELE PER
STORE nul TO respuesta
respu=.F.
IF !EMPTY(elipro("",1,13))
   ACTI WIND win2
   m.procod = PER.CODCLI
   @ 1,15 SAY ALLTRIM(PER.CODCLI) + " - " + ALLTRIM(PER.CLIENTE)
   m.a=space(13)
   @ 2,15 GET m.a PICT "@!"
   READ
   m.a = q_fac(m.a)
   @ 2,15 GET m.a
   CLEAR GETS
   IF m.a#"0000-00000000"
      SELE far
      respu=SEEK(m.a+m.procod)
      if respu
         sele cns
         set order to tag concod
         SEEK far.concod
         set order to tag consorcio
      endif
   ENDIF
ENDIF
=relewin('win2')
RETURN respu
