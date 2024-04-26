PROCEDURE LFACPAN
parameter qlis
if !pideclav(1)
	return
endif
ULPR=hora_ulp(program())
STORE .T. TO M.OK
=OPCLI()
do case
case qlis=1
   fisc=".T."
   TT="Todas las Facturas"
case qlis=2
   =OPCLI()
   =OPZON()
   STORE NUL TO M.RESPUESTA
   IF ELIZON("a Listar",-1,1)
      fisc="left(per.texto1,2)='"+left(mix.texto2,2)+"'"
      TT="Clientes de Zona "+alltrim(mix.texto1)
   ELSE
      =NOSELEC("ZONA")
      STORE .F. TO M.OK
   ENDIF
CASE QLIS=3
   =OPCAG()
   STORE NUL TO M.RESPUESTA
   STORE 2 TO M.FILCAG
   STORE "" TO FISC,TT,TTCAG,QUECAG
   =QW_CAG(.F.,.F.,"PER.CAG")
   IF QUECAG#".F."
      SELE PER
      SET ORDER TO TAG CLIENTES
      FISC=QUECAG
      TT=TTCAG
   ELSE
      STORE .F. TO M.OK
      =NOSELEC("AGRUPACION")
   ENDIF
ENDCASE
IF M.OK
   store {} to m.fecini,m.fecfin
   if entre_fe("a Listar")
      tmp=gentmp()
      =opfac()
      SELE FAC
      set order to
      GO BOTT
**      FECINI=FECHAEM-DAY(FECHAEM)+1
**      FECFIN=GOMONTH(FECINI,1)-1
      FISC=FISC+" .AND. "+;
        "BETW(FAC.FECHAEM,{"+;
        DTOC(M.FECINI)+"},{"+;
        DTOC(M.FECFIN)+"})"
      IF QLIS>1
         SET ORDER TO TAG CODCLI IN PER
         SET RELA TO CODCLI INTO PER
      ENDIF
***      =flock() .or. flok()
      sort on factura to (tmp) for &FISC
      UNLO IN FAC
      =PRXAREA(.T.)
      USE (TMP) ALIAS TMP
      do lfacpan.spr
      =OFF_TMP()
   endif
ENDIF
RETURN
