********************************************************************************
*-- Programa: xanum.prg
*-- Fecha   : 10/04/91 06:00pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA numeros de documentos
*-- Modificaci�n GOYO 07-23-92 00:25am marca -> empresa
********************************************************************************
SELE seg
STORE HORA_ULP(PROGRAM()) TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   do OPEMP
   store NUL to respuesta
   numarca=ELIEMP(" a Ingresar",-1,1)
   if !EMPTY(numarca)
      NUMARCA=MIX.NU1
      =MOVEWIN(7,10,17,64,'WIN',' N�mero de Documentaci�n - Empresa '+alltrim(mIX->TEXTO1)+' ')
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
			xan='9999999'
      ACTI WINDOW win
      @ 1,1 SAY "N� Remito"
      @ 2,1 SAY "N� Remito Interno"
      @ 3,1 SAY "N� Factura"
      @ 4,1 SAY "N� Recibo"
      @ 5,1 SAY "N� Nota de Cr�dito"
      @ 6,1 SAY "N� Nota de D�bito"
      @ 7,1 SAY "N� Liquidaci�n"
      @ 1,30 get xanum[1,3] pict xan
      @ 2,30 get xanum[1,4] pict xan
      @ 3,30 get xanum[1,5] pict xan
      @ 4,30 get xanum[1,7] pict xan
      @ 5,30 get xanum[1,9] pict xan
      @ 6,30 get xanum[1,11] pict xan
      @ 7,30 get xanum[1,15] pict xan
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
