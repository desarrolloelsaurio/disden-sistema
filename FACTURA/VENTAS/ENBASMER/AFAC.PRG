FUNCTION AFAC
   STORE NUL TO RESPUESTA,M.FACTURA,m.remi
   IF !ELIFAC()
      STORE {} TO RESPUESTA
      fcha=preguNta("FECHA DE LA FACTURA "+ALLTRIM(m.remi),.T.,10,0,'E')
      IF LAST()#27 .AND. !EMPTY(FCHA)
         =MEN_LIN(GRABANDO)
         SELE FAC
         =FLOCK("FAC") .OR. FLOK("FAC")
         APPE BLAN
         =REPUSE()
         REPL FECHAEM WITH fcha
         REPL FECHAVE WITH fcha
         REPL CODCLI WITH "ANULADA"
         REPL FACTURA WITH M.remi
         UNLO IN FAC
      ENDIF
   else
      =cartel("La factura N§ "+SUCU+'-'+ZERO(M.FACTURA,8),"no esta vacia",'',"** ES IMPOSIBLE ANULARLA **")
   endif
RETURN .T.