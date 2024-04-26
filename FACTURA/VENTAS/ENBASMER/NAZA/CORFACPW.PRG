FUNCTION CORFACPW
IF KTIPO='111'
   elcorte=fac.codcli
   eltexto1=IIF(EMPTY(PER.CLIENTE),REPL("?",20),left(PER.cliente,20))
   eltexto=fac.codcli
ELSE
   IF KTIPO='231'
      elcorte=fax.articulo
      eltexto1=IIF(EMPTY(MER.MERCA),REPL('?',20),left(mer.merca,20))
      eltexto=left(fax.articulo,13)
   ELSE
      elcorte=left(fax.articulo,3)
      eltexto=IIF(EMPTY(MIX.TEXTO1),REPL('?',20),mix.texto1)
      ELTEXTO1=''
   ENDIF
ENDIF
STORE NUL TO LNEA
RETURN .T.
