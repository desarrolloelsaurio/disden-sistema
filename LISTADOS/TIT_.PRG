FUNCTION TIT_
parameter KOSA,KOSA1,SINRAP,TIT_NUMERO
private KOSA,KOSA1,SINRAP
MARGANT=_RMARGIN
_RMARGIN=80
IF SYS(102)='ON'
   DO CASE
   CASE GETENV("PRN")="BUBL"
      ??? '{027}{040}{115}{010}{072}'
   CASE GETENV("PRN")="LASER"
         =CH18()
   OTHERWISE
         ??? CHR(18)
   ENDCASE
ELSE
   ON KEY LABEL F10 DO ABPT
ENDIF
_wrap=.t.
_alignment="CENTER"
? tt
IF PARAMETER()>1
   IF SINRAP
      ? ALLTRIM(JANNAME)
      ?
      _WRAP=.F.
      ?
      ? KOSA1
      ?
      _WRAP=.T.
   ELSE
      ? KOSA1
   ENDIF
ENDIF
?? iif(KOSA=2 .or. KOSA=4,' - Continuaci¢n','')
if KOSA>2 .AND. !SINRAP
   ? ALLTRIM(janname)
   ?
endif
_wrap=len(acla)<78
_RMARGIN=MARGANT
ACLA=IIF(TYPE("ACLA")='U','',ACLA)
STORE REPL("=",LEN(acla)) TO m.linea
STORE LEN(acla) TO largo
STORE MIN(xacancho,xachoja) TO largoim
IF largo>largoim .and. SYS(102)='ON'
   DO CASE
   CASE GETENV("PRN")="BUBL"
      ??? '{027}{040}{115}{020}{072}'
   CASE GETENV("PRN")="LASER"
         =COND(.T.)
   OTHER
         ??? CHR(15)
   ENDCASE
   _RMARGIN=IIF(largoim>80,233,132)   
ENDIF
RETURN .T.
