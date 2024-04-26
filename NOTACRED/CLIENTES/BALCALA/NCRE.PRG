*********************************************************************************
*-- Programa: NCRE.PRG
*-- Fecha   : 03-02-92 12:11pm
*-- Version : G. REINER
*-- Notas   : MENU DE GESTION DE NOTAS DE CREDITO
********************************************************************************
ulpr=program()
=cabpan1()
fil_invo='FAC.TIPO="NC"'
INVOICE='NC'
TIT_INVO='NOTA DE CREDITO'
TIT_INVOs='Notas de Cr‚dito'
fisc=""
tt='A'
abr_invo="N. Cr‚d."
DO CASE
CASE BAR()=1
   respuesta='nada#6#30#Tipo de Nota de Cr‚dito#3#Devoluci¢n \<Total de Factura#Devoluci¢n \<Parcial#\<Monto'
	=DEFPOP()
   ON SELE POPU nada DO icre
   ACTI POPU nada
   RELE POPU nada
case bar()=3
   DO LFAC WITH .F.
CASE BAR()=4
   DO LFAC WITH .T.
case bar()=6
   IF buscre()
      quefac=fac.factura
      registro=str(recno())
      =flock("ccl") .or. FLOK("CCL")
      =flock("fac") .or. flok("fac")
      sele fac
      dele
      sele ccl
      scan for codcli=fac.codcli
         IF NUMERORE=FAC.FACTURA
            DELE
            sele fac
            dele
            EXIT
         ENDIF
      endscan
      unlo in fac
      UNLO IN CCL
   endif
ENDCASE
=MEN_LIN(BOTOM)
RETURN
