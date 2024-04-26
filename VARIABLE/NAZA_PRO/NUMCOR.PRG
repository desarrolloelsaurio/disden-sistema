********************************************************************************
*-- Programa: numcor.PRG
*-- Fecha   : 12/13/90 01:28am
*-- Version : G. REINER
*-- Notas   : ACTUALIZA numero de orden de corte
********************************************************************************
SELE seg
STORE HORA_ULP(PROGRAM()) TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   NUMARCA=1
   =MOVEWIN(7,10,13,64,'WIN',' N£mero de Documentaci¢n - '+alltrim(JANNAME)+' ')
   REGISTRO="18,19,20"
   SELE DOC
   =RLOCK(REGISTRO,"DOC") .OR. LOK("DOC")
   RELE NADA
   DIME NADA[20]
   for a=18 to 20
      go a in doc
      NADA[a]=Doc->numero
   endf
   xan='9999999'
   @ 1,1 SAY "N§ Orden "+korte
   @ 2,1 SAY "N§ Orden "+favri
   @ 3,1 SAY "N§ Remito"
   @ 1,30 get NADA[18] pict xan
   @ 2,30 get NADA[19] pict xan
   @ 3,30 get NADA[20] pict xan
   read
   IF LASTKEY()#27
      for a=18 to 20
         go a in doc
         REPL DOC->NUMERO WITH NADA[A]
      endf
   ENDIF
   UNLO IN DOC
   RELE NADA
   =iaud('MODIFICACION NUMEROS DE DOCUMENTO')
   =RELEWIN("win")
ELSE
   =iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
