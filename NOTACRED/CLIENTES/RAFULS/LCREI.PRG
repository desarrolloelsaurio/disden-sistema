******************************************************************************
*-- Programa: LCREIB.PRG
*-- Fecha   : 10-14-92 11:47am
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE NOTAS DE CREDITO O DEBITO POR IMPRESORA
********************************************************************************
#DEFINE PICU "99,999.99"
para parainqui
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	=cabpri3(2,36)
	PRINTJOB
	***************************************************
	?
	?
	?? CHR(14)
	?
    ? PADL(m.cart_cred +' '+m.numerore,40)
    ?
    ?? chr(18)
    ? PADL("Rosario, "+datecomp(m.fechaop),80)
    ?
    ?"PROPIETARIO: "
    ??m.propi
    ?
	if parainqui
       ?"INMUEBLE : "
       ??m.codinm
       ?space(11)
       ??m.domicilio
       ?space(11)
       ??IIF(XSEEK(INM.LOCALIDAD,'MIX','CIUCOD'),MIX.TEXTO1,SPACE(15))
       ?
	   ?"INQUILINO  : "
       ??m.inqui
       ?
    endif
    ?"IMPORTE   : "
    ??tran(m.monto,picu)
    ??" "
    ??m.moneda
	?
	?
    ?"CONCEPTO : "
    ??m.detalle
	?
	_WRAP=.F.
	_lmargin=NUL
	?
	EJECT PAGE
	ENDP
	=FINIMP()
	=iaud(m.cart_cred+inm.codinm)
else
	=iaudi()
endi
RETURN MEN_LIN(BOTOM)
