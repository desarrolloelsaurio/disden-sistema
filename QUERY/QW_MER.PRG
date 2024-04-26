function qw_mer
parameter ren,col,cual,valor
private ren,col,cual
STORE .F. TO UNOSOLO
IF EMPTY(VALOR)
   if filmer>1
      save to temporal all like tt*
      save to tempora1 all like que*
      save to tempora2 all like fil*
      STORE "" TO TT,FISC,TTQUE,elque,elfisc
      #IF "PRODUC" $ CURD()
         DO QWMERCA.SPR WITH CUAL
      #ELSE
      ACTI SCRE
      STORE NUL TO M.RESPUESTA
      DO GRL2 WITH 9,45,'L¡mites del Listado',.t.
      ON SELE POPU NADA DO RESP1
      ACTI POPU NADA
      RELE POPU NADA
      STORE "" TO TT
      FISC=QWMER(RESPUESTA)
      TTQUE=TT
      #ENDIF
      if !EMPTY(FISC) .AND. fisc#'.F.'
         elque=TTQUE
         elfisc=FISC
         ELFILMER=2
      ELSE
         store 1 to ELfilmer
      ENDIF
      rest from temporal addi
      rest from tempora2 addi
      rest from tempora1 addi
      FILMER=ELFILMER
      ttmer=elque
      quemer=elfisc
   else
      store 1 to filmer
   endif
ELSE
   quemer=qwmer(VALOR)
ENDIF
*IIF(EMPTY(VALOR),FILmer=1,quemer#".F.")
return !UNOSOLO
 