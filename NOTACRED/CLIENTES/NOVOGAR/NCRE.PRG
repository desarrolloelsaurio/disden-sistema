*************************************************
*-- Programa: NCRE.PRG
*-- Fecha   : 03-02-92 12:11pm
*-- Version : G. REINER
*-- Notas   : MENU DE GESTION DE NOTAS DE CREDITO
*************************************************
parameter nc_ren,nc_col
ulpr=program()
=cabpan1()
INVOICE='NC'
TIT_INVO='NOTA DE CREDITO'
fil_INVO='fac.tipo="NC"'
TIT_INVOs='Notas de Cr‚dito'
fisc='.T.'
tt='A'
abr_invo="N. Cr‚d."
DO CASE
CASE BAR()=1
=OPMAR()
   nc_ren=IIF(TYPE("nc_ren")="L",6,nc_ren)
   nc_col=IIF(TYPE("nc_col")="L",30,nc_col)
   respuesta='nada#'+ALLTRIM(STR(NC_REN))+'#'+ALLTRIM(STR(NC_COL))+';
#Tipo de Nota de Cr‚dito#3;
#Devoluci¢n \<Total de Factura;
#Devoluci¢n \<Parcial;
#\<Monto'
   =DEFPOP()
   ON SELE POPU nada DO icre
   ACTI POPU nada
   RELE POPU nada
case bar()=3
   respuesta='nCRE#8#40#Tipo de Nota de Cr‚dito a Listar#3#Tipo "\<A"#Tipo "\<B"#\<Todas'
   =DEFPOP()
   ON SELE POPU NCRE DO lcrep
   ACTI POPU NCRE
   RELE POPU NCRE
CASE BAR()=4
   respuesta='nCRE#8#40#Tipo de Nota de Cr‚dito a Listar#3#Tipo "\<A"#Tipo "\<B"#\<Todas'
   =DEFPOP()
   ON SELE POPU NCRE DO lcrep WITH .T.
   ACTI POPU NCRE
   RELE POPU NCRE
case bar()=6
   IF buscre()
      quefac=fac.factura
      registro=str(recno())
      =FLOCK("CCL") .OR. FLOK("CCL")
      =FLOCK("fac") .OR. FLOK("fac")
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
RETURN MEN_LIN(BOTOM)

******************************************************
*-- Programa: ICRE.PRG
*-- Fecha   : 08/11/91 02:13pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE NOTAS DE CREDITO
******************************************************
PROCEDURE ICRE
=HORA_ULP(PROGRAM())
DO CASE
CASE BAR()=1
   DO ICRE2
CASE BAR()=2
   DO ICRE3
CASE BAR()=3
   DO CLI
ENDCASE
RETURN MEN_LIN(BOTOM)
