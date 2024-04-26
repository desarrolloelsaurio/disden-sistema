**********************************************************************
*-- Programa: CREM.PRG
*-- Fecha   : 05-11-92 00:52am
*-- Versi¢n : G. REINER
*-- Notas   : CORRIGE REMITO DE VIAJANTE
*-- VERSION BALCALA
**********************************************************************
ulpr=hora_ulp(program())
if cheqseg()
   =LREMP1(REM.REMITO,.T.,ULPR)
   =MEN_LIN("CALCULANDO - ESPERE POR FAVOR")
   SELE REX
   =XSEEK(REM.REMITO,'REX','REMITO')
   COPY TO ARRAY REXT WHILE REX.REMITO=REM.REMITO
   LARGO=ALEN(REXT,1)
   DIME REX1[LARGO,7]
   FOR A=1 TO LARGO
      REX1[A,2]=REXT[A,2]
      =XSEEK(REX1[A,2],'MER','ARTICULO')
      REX1[A,1]=MER.MERCA
      REX1[A,3]=REXT[A,3]
      STORE 0 TO REX1[A,4],REX1[A,5]
      REX1[A,6]=REXT[A,4]
      REX1[A,7]=REXT[A,4]      
   ENDF
   RELE REXT
   DO WHILE .T.
      LAMERCA=POP_LIST(0,40,@REX1,'Art¡culo a Corregir',.t.)
      IF LAST()=27
         EXIT
      ENDIF
      =XSEEK(REX1[lamerca,2],'MER','ARTICULO')         
      =MOVEWIN(10,0,IIF(MER.DISCRIM,17,16),60,'WIN8',' Corrige Remito ')
      @ 1,1 GET REX1[LAMERCA,2]
      @ 1,20 GET REX1[LAMERCA,1]
      @ 2,1 SAY 'Remitado:'
      @ 2,20 get rex1[lamerca,3] pict '9999999.99'
      REX1[LAMERCA,5]=REX1[LAMERCA,4]
      CLEA GETS
      @ 3,1 SAY 'Devuelto:'
      @ 3,20 get rex1[lamerca,4] pict '9999999.99'
      READ
      IF rex1[lamerca,4]>rex1[lamerca,3] .OR. LAST()=27
         STORE REX1[LAMERCA,5] TO REX1[LAMERCA,4]
         else
         IF MER.DISCRIM
            rex1[lamerca,6]=INT(REX1[lamerca,4]*REX1[lamerca,6]/REX1[lamerca,3])         
            @ 4,1 SAY 'Un. Devueltas:'
            @ 4,20 get rex1[lamerca,6] pict '9999999.99'
            read
            IF REX1[LAMERCA,6]>REX1[LAMERCA,7]
               STORE REX1[LAMERCA,7] TO REX1[LAMERCA,6]
               STORE REX1[LAMERCA,5] TO REX1[LAMERCA,4]               
            ENDIF     
         endif
         ENDIF
      =RELEWIN("WIN8")
   ENDDO
   CLEA
   @ NUL,NUL SAY 'MODIFICACIONES REALIZADAS:'
   acla=paip+PADC("ARTICULO",30)+paip+padc("C. ORIG",10)+paip+padc("C. DEVUELTA",10)+paip+;
   padc("EN REMITO",10)+paip+PADC("UN. DEV.",10)+PAIP
   ? repl("=",len(acla))
   ? acla
   ? repl("=",len(acla))
   FOR A=1 TO LARGO
      IF !EMPTY(REX1[A,4])
         ? PAIP
         ?? REX1[A,1]
         ?? PAIP
         ?? str(REX1[A,3])
         ?? PAIP
         ?? str(REX1[A,4],10,2)
         ?? PAIP
         ?? str(REX1[A,3]-REX1[A,4],10,2)
         ?? PAIP
         ?? STR(REX1[A,6])
         ?? PAIP
      ENDIF
   ENDF
   ? repl("=",len(acla))
   IF CONFIRMA('Devoluciones del Remito',.f.,21,1)
      =men_lin("PROCESANDO LA DEVOLUCION - ESPERE POR FAVOR")
      SELE REX
      =XSEEK(REM.REMITO,'REX','REMITO')
      STORE NUL TO PUNTERO,TOTAL
      SCAN WHILE REX.REMITO=REM.REMITO
         PUNTERO=PUNTERO+1
         IF !EMPTY(REX1[PUNTERO,4])
            SELE kar
            =FLOCK("KAR") .OR. LOK("KAR")
               APPE BLANK
               REPL kar.fechaop WITH REM.FECHAEM
               REPL kar.articulo WITH rex.articulo
               REPL kar.opk WITH '05'
               repl kar.docref WITH "RI"
               REPL kar.nrodocref WITH Q_FAC(SUCU+"-"+ALLTRIM(STR(REM.Remito)))
               REPL kar.CODVIA WITH REM.CODVIA
               REPL kar.detalle WITH "DEVOLUCION DE REMITO"
               REPL kar.SALIDA WITH NUL
               =XSEEK(REX.ARTICULO,'MER','ARTICULO')
               UNITARIO=PORCEN(MER.COSTO,MER.precio1)
               unitario=round(unitario,2)
               TOTAL=TOTAL+REX1[PUNTERO,4]*UNITARIO
               REPL kar.ENTRADA WITH REX1[PUNTERO,4]
               IF MER.DISCRIM
                  REPL KAR.ENPESO WITH rex1[puntero,6]
               ENDIF
               =repuse()
            UNLO IN KAR
            SELE REX
            =LOCK() .OR. LOK(STR(RECNO()),'REX')
            REPL CANTIDAD WITH CANTIDAD-REX1[PUNTERO,4]
            IF MER.DISCRIM
               REPL PESO WITH PESO-REX1[PUNTERO,6]            
            ENDIF
            UNLO IN REX
         ENDIF
      ENDSCAN
      SELE REM
      =FLOCK() .OR. FLOK('REM')
      REPL VALORIZ WITH VALORIZ-TOTAL
      UNLO IN REM
   ENDIF
   =RELEWIN(WONTOP())
ELSE
   =iaudi()
ENDI
UNLO ALL
=MEN_LIN(BOTOM)
RETURN
