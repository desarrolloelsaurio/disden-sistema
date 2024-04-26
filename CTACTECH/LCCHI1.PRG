********************************************************************************
*-- Programa: LCCHI1.PRG
*-- Fecha   : 09/14/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE CHEQUES NO PAGADOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
mxrn=66
stor (PAIP+PADC("N§del Cheque",15)+PAIP+PADC("BANCO",20)+PAIP+PADC("MONTO",14)+"| MONEDA|FECHA CHEQUE|"+PADC("CLIENTE",15)+"| FECHA  |  USUARIO |") TO acla
stor REPL("=",LEN(acla)) TO lns
stor "Listado de Cheques NO acreditados" TO tt
STOR NUL TO totche,natotmon
stor LEN(acla) TO largo
stor MIN(xacancho,xachoja) TO largoim
@ 24,nul SAY IMPRIMIENDO COLO SCHE 19
IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
A=left(sincosas(janname),8)+'.TXT'
ACTI SCRE
@ 24,nul SAY PADC("Imprimiendo Listado en Archivo "+ALLTRIM(A),80) COLO SCHE 19
SET PRINTER TO FILE &a
mxrn=iIF(largoim>80,63,53)
ENDIF
=CABPRI()
_PCOPIES=1
PRINTJOB
=CABPRI1()
=TIT_LNS(3)
SELE cch
SCAN for &fisc
IF _PLINENO>mxrn
   =FIN_LNS(3,0)
   =CABPRI1()
   =TIT_LNS(4)
ENDI
IF EMPTY(cch.fechaac)
? PAIP
?? cch.nroche
?? PAIP
?? cch.banco
?? PAIP
?? STR(cch.monto,14,2)
stor natotmon+cch.monto TO natotmon
?? PAIP
?? IIF (cch.moneda=LEFT(xadols,1),SUBSTR(xadols,1,7),SUBSTR(xauss,1,7))
?? PAIP
?? PADC(DTOC(cch.fechade),12)
?? PAIP
?? IIF(XSEEK(cch.codcli,'PER',"CODCLI"),LEFT(PER.cliente,15),PADL("NO EXISTE",15))
SELE cch
?? PAIP
?? cch.fecha
?? PAIP
?? cch.usuario
?? PAIP
totche=totche+1
ENDIF
ENDSCAN
? lns
?
?
? SPACE(26)+"Monto Total:"+SPACE(5)+ALLTRIM(STR(natotmon,14,2))
?
?
? "Total de cheques por acreditar: "+ALLTRIM(STR(totche))
_WRAP=.F.
?
EJECT PAGE
?
ENDP
=FINIMP()
=iaud(fisc)
ELSE
=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
