FUNCTION LCCLPZ1
=WORKING()
dime ttl[CANT_MAX],ctrl[CANT_MAX]
hay=.f.
if variable[4]
   ttl[4]=nul
   store .t. to hay
endif
if variable[8]
   STOR NUL TO ttl[8],TTL[9],TTL[11],TTL[12]
   store .t. to hay
endif
if variable[10]
   STOR NUL TO ttl[10]
   store .t. to hay
endif
if !hay
   rele ttl,ctrl
endif
IF HISTORICO
   SELE CCLH
ELSE
   SELE CCL
ENDIF
set order to
IF HABILITADO[1]
   set order to tag CODCLI in PER
   IF HISTORICO
      set relation to cclH.CODCLI INTO PER
   ELSE
      set relation to ccl.CODCLI INTO PER
   ENDIF
   #IF "EXPENSA" $ CURDIR()
      SET ORDER TO TAG CODCLI IN CNX
      SET RELA TO CODCLI INTO CNX ADDI
   #ENDIF
ENDIF
TMP=GENTMP()
=DOTALK()
=FLOCK() .OR. FLOK()
IF '.T.'==FISC
   IF HISTORICO
      SORT ON CCLH.CODCLI,FECHAOP TO (TMP)
   ELSE
      SORT ON CCL.CODCLI,FECHAOP TO (TMP)
   ENDIF
ELSE
   IF HABILITADO[1]
      IF HISTORICO
         SORT ON CCLH.CODCLI,FECHAOP TO (TMP) FOR &FISC
      ELSE
         SORT ON CCL.CODCLI,FECHAOP TO (TMP) FOR &FISC
      ENDIF
   ELSE
      IF HISTORICO
         SORT ON CCLH.CODCLI,FECHAOP TO (TMP) FOR &FISC
      ELSE
         SORT ON CCL.CODCLI,FECHAOP TO (TMP) FOR &FISC
      ENDIF
   ENDIF
ENDIF
=UNTALK()
=IIF(HISTORICO,CLOSDBF("CCLH"),.T.)
=CLOSDBF("CCL")
USE (TMP) ALIAS CCL EXCL
IF HAYCAMPO("CODCLI","CCL")
      set relation to ccl.CODCLI INTO PER
ENDIF
acla=paip
for a=1 to CANT_MAX
   IF A=8
      IF VARIABLE[8]
         ACLA=ACLA+padc('DEBE',texto[a,2])+paip+padc('HABER',texto[a,2])+PAIP+PADC('PENDIENTE',TEXTO[A,2])+paip+padc('SALDO',texto[a,2])+paip
      ENDIF
   ELSE
      store acla+iif(variable[a],padc(texto[a,1],texto[a,2])+paip,'') to acla
   ENDIF
NEXT
linea=REPL("=",LEN(acla))
tt='Listado de Cta. Cte. '+;
  IIF(SSTM2="EXPENSAS","Consorcistas","Clientes")+;
  TTQUE
=UNWORK()
RETURN .T.
