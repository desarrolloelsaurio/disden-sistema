********************************************************************************
*-- Programa: xanum.prg
*-- Fecha   : 10/04/91 06:00pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA numeros de documentos
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
********************************************************************************
SELE seg
STORE HORA_ULP(PROGRAM()) TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   do OPEMP
   store NUL to respuesta
   numarca=ELIEMP(" a Ingresar",-1,1)
   if !EMPTY(numarca)
      =MOVEWIN(7,10,17,64,'WIN',' N£mero de Documentaci¢n - Empresa '+alltrim(JANNAME)+' ')
      in=(numarca-1)*20+1
      fi=in+12
      REGISTRO=""
      for a=in to fi
         REGISTRO=REGISTRO+alltrim(str(a))+","
      endf
      REGISTRO=SINULT(REGISTRO)
      =LOK("DOC")
      for a=in to fi
         go a in doc
         b=mod(a,20)
         B=IIF(B=0,20,B)
         xanum[1,b]=Doc->numero
      endf
      ACTI WINDOW win
      @ 1,1 SAY "N§ Remito"
      @ 2,1 SAY "N§ Remito Interno"
      @ 3,1 SAY "N§ Factura"
      @ 4,1 SAY "N§ Recibo"
      @ 5,1 SAY "N§ Nota de Cr‚dito"
      @ 6,1 SAY "N§ Nota de D‚bito"
      @ 7,1 SAY "N§ Orden de Pago"
      @ 1,30 get xanum[1,3] pict '9999999'
      @ 2,30 get xanum[1,4] pict '9999999'
      @ 3,30 get xanum[1,5] pict '9999999'
      @ 4,30 get xanum[1,7] pict '9999999'
      @ 5,30 get xanum[1,9] pict '9999999'
      @ 6,30 get xanum[1,11] pict '9999999'
      @ 7,30 get xanum[1,12] pict '9999999'
      read
      IF LASTKEY()#27
         for a=in to fi
            go a in doc
            b=mod(a,20)
            B=IIF(B=0,20,B)
            REPL DOC->NUMERO WITH xanum[1,b]
         endf
      ENDIF
      UNLO IN DOC
      =RELEWIN("win")
      =iaud('MODIFICACION NUMEROS DE DOCUMENTO')
   endif
   UNLO IN DOC
ELSE
   =iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
* EOF - INDENT
