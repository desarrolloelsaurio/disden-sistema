************************************************
*-- Programa: xanum.prg
*-- Fecha   : 10/04/91 06:00pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA numeros de documentos
***********************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   do opcns
   =opdoc()
   store NUL to respuesta
   if !EMPTY(elicns(" a Ingresar",-1,1))
      =MOVEWIN(2,10,11,64,'WIN',' N§ de Documentaci¢n - Consorcio '+alltrim(cns.consorcio)+' ')
      sele doc
      m.fechali = GETFELIQ(CNS.CONCOD)
      M.REGFE = nrorec(m.fechali,'FE')
      M.NLIQUID=GETNULIQ(CNS.CONCOD)
      M.REGNU = nrorec(m.nliquid,'NL')
      m.vencimi = GETVELIQ(CNS.CONCOD)
      M.REGVE = nrorec(m.vencimi,'VE')
      m.mes = GETMELIQ(CNS.CONCOD)
      M.REGME = nrorec(m.mes,'ME')
      @ 1,1 SAY "N§ Liquidaci¢n"
      @ 2,1 SAY "Fecha de Liquidaci¢n"
      @ 3,1 SAY "Fecha de Vencimiento"
      @ 4,1 say "Corresp. al Mes de  "
 
      @ 1,30 get m.nliquid pict '9999999' ;
        mess "N§ de Liquidaci¢n" ;
        valid LAST()=27 .OR. m.nliquid>0 ;
        error "EL NUMERO DEBE SER MAYOR QUE CERO"
 
      @ 2,30 get m.fechali ;
        WHEN LAST()#27 ;
        MESS "Fecha de Emisi¢n de la Liquidaci¢n" ;
        valid LAST()=27 .OR. !EMPTY(M.FECHALI) ;
        ERROR "DEBE TENER UNA FECHA"
 
      @ 3,30 get m.vencimi ;
        WHEN LAST()#27 ;
        MESS "Fecha de Vencimiento de la Liquidaci¢n" ;
        valid LAST()=27 .OR. (!EMPTY(M.vencimi) .and. m.vencimi>m.fechali) ;
        ERROR "LA FECHA NO DEBE SER VACIA NI MENOR QUE LA FECHA DE EMISION"
 
      MESU=QMES(M.MES)
      @ 4,34 SAY MESU
 
      @ 4,30 get m.mes ;
        PICT "99";
        WHEN LAST()#27 ;
        MESS "Liquidaci¢n Correspondiente al mes de..." ;
        VALID XFUN1() .AND. M.MES>0 .AND. MES <13 ;
        ERROR "EL MES DEBE SER ENTRE 1 Y 12"
 
      @ 6,20 GET m.OPCION ;
        PICTURE "@*HN \!\<O K;\?\<N O" ;
        SIZE 1,10,3 ;
        DEFAULT 2 ;
        VALID XFUN3() ;
        MESSAGE "Confirma las operaciones realizadas ?"
 
      read CYCLE ;
        SHOW XFUN2()
 
   ENDIF
   =RELEWIN("win")
   UNLO IN DOC
ELSE
   =iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
 
function nrorec
para cosa,tipx
priv cosa,tipx
if empty(cosa)
   append blank
   REPL concod with cns.concod
   REPL tipo with tipx
endif
return RECNO('DOC')
 
FUNCTION XFUN1
MESU=QMES(M.MES)
RETURN SGET("WIN")
 
FUNCTION XFUN2
MESU=QMES(M.MES)
@ 4,34 SAY MESU
RETURN .T.
 
FUNCTION XFUN3
IF M.OPCION=1
   m.regte = nrorec(GETTELIQ(CNS.CONCOD),'TE')
   registro =STR(M.REGNU)+','+STR(M.REGFE)+','+STR(M.REGVE)+','+STR(m.regte)+','+STR(m.regme)
   =lock(registro,"DOC") .or. LOK("DOC")
   =men_lin("[ESC] Sale sin Grabar - [TAB] Graba - [Ctrl A y DEL] Borra Todo")
   ON KEY LABEL TAB KEYBOARD CHR(23)
   =movewin(9,5,20,75,"win1",' Texto General al pie de Liquidaci¢n ')
   MODI MEMO parrafo WINDOW win1
   CLOSE MEMO parrafo
   ON KEY LABEL TAB
   GO M.REGNU
   REPL numero with m.nliquid
   gath memv
   go regfe
   REPL fecha with m.fechali
   gath memv
   go regve
   REPL fecha with m.vencimi
   gath memv
   go regme
   REPL NUMERO with m.MES
   gath memv
   =RELEWIN("win1")
   =iaud(alltrim(CNS.CONCOD)+"-"+CNS.CONSORCIO)
ENDIF
CLEA READ
RETURN .T.
