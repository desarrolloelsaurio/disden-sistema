* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: ICOBC.PRG                                                  ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 11-04-92                                                   ³
* ³    Copyright: SISTEMAS INFORMATICOS S.R.L.                               ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION ICOBC
PARAMETER ICO_TIPO,LOSPESOS
=MOVEWIN(3,30,iif(ico_tipo='TA',12,14),79,'WIN2',' Descripci¢n de '+IIF(ICO_TIPO='TA','la Tarjeta','los Cheques '))
=CENTWIN("WIN2")
STORE NUL TO CHEQUES,PNCHE,TTL,GTTL
STORE .F. TO ENCONTRE,LATAR,CODTAR
STORE '' TO CODTAR
IF ICO_TIPO='TA'
   IF LEFT(PER.CODCLI,7)='TARJETA'
      SELE MIX
      SET ORDER TO TAG TARTEX
      SCAN
         IF MIX.TEXTO1=PER.CLIENTE
            STORE .T. TO ENCONTRE
            STORE LEFT(MIX.TEXTO2,2) TO CODTAR
            STORE MIX.TEXTO1 TO LATAR
            EXIT
         ENDIF
      ENDSCAN
   ENDIF
ENDIF
elbanco=space(20)
elnumero=space(15)
DO WHILE .T.
   CLEA
   @ 1,1 SAY 'CANT. DE '+IIF(ICO_TIPO='TA','Formularios ','Cheques ') colo sche 3
   @ 1,20 say pnche colo sche 3
   @ 2,1 say 'TOTAL EN '+IIF(ICO_TIPO='TA','Tarjeta','Cheques ') colo sche 3
   @ 2,20 SAY CHEQUES PICT '99,999,999.99' COLO SCHE 3
   SELE CCH
   SCAT TO COSA BLAN
    cosa[7]=elbanco
    cosa[8]=elnumero
   @ 4,1 SAY 'MONTO' COLO SCHE 3
   COSA[9]=LOSPESOS
   @ 4,20 GET COSA[9] PICT '99,999,999.99' MESS 'Monto del Cheque' ;
     VALID COSA[9]>0 .AND. COSA[9]<=LOSPESOS ;
     ERROR 'MONTO INACEPTABLE'
   @ 5,1 SAY 'N§ DE '+IIF(ICO_TIPO='TA','Formulario','Cheque') COLO SCHE 3
   @ 5,20 GET COSA[8] PICT '@!' MESS 'N£mero del Cheque'
   @ 6,1 say IIF(ICO_TIPO='TA','TARJETA','BANCO') colo sche 3
   READ
   IF ICO_TIPO='TA'
      IF !ENCONTRE
         STORE 0 TO RESPUESTA
         DO WHILE !ELITAR("",6,20)
         ENDDO
         COSA[7]=MIX.TEXTO1
         CODTAR=LEFT(MIX.TEXTO2,2)
      ELSE
         COSA[7]=LATAR
      ENDIF
      RICO_TIPO='TA'
      @ 6,20 GET cosa[7] pict '@!'
      CLEA GETS
   ELSE
      @ 6,20 get cosa[7] pict '@!' MESS 'Banco de Origen del Cheque'
      RICO_TIPO='CH'
   ENDIF
   IF ICO_TIPO#"TA"
      @ 7,1 say 'F. DEPOSITO' colo sche 3
      @ 7,20 get cosa[11] ;
      valid !empty(cosa[11]) ;
      error "FECHA INACEPTABLE" ;
      MESS 'Fecha de Dep¢sito de Origen del Cheque'
      @ 8,1 say 'Hs. ACREDITACION' colo sche 3
      @ 8,20 get cosa[12] PICT '999' MESS 'Horas de Acreditaci¢n del Cheque'
   ELSE
      COSA[11]={}
      IF !ENCONTRE
         M.CLITXTTN=SPACE(20)
         @ 7,1 SAY 'N§ TARJETA'
         @ 7,20 get M.CLITXTNT PICT '@!' MESS 'N£mero de Tarjeta de Cr‚dito'
      ENDIF
   ENDIF
   READ
   IF LAST()#27
      ZOOM WINDOW WIN2 NORM SIZE WROWS()+iif(ico_tipo='TA',4,6),WCOLS()
      if confirma("los Datos Ingresados",.f.,IIF(ICO_TIPO='TA',9,10),1)
         cosa[ 1]=PER.CODCLI
         cosa[ 2]=DATE()
         cosa[ 3]=RICO_TIPO
         cosa[ 4]='FA N§ '+IIF(TYPE("FAC.FACTURA")="C",FAC.FACTURA,alltrim(STR(FACTURA)))
         cosa[ 5]='RE'
         cosa[ 6]=NADAREC
         cosa[10]=Xauss
         cosa[13]={}
         cosa[14]=cosa[9]/xacotiz
         CHEQUES=CHEQUES+COSA[9]
         PNCHE=PNCHE+1
         DIME CHQ[PNCHE,17],LATA[PNCHE]
         =ACOPY(COSA,CHQ,1,17,(PNCHE-1)*17+1)
         ttl=ttl+COSA[9]
         GTTL=GTTL+COSA[9]
         LATA[PNCHE]=CODTAR
         LOSPESOS=LOSPESOS-COSA[9]
         elbanco=cosa[7]
         elnumero=cosa[8]
      ENDIF
      ZOOM WINDOW WIN2 NORM SIZE WROWS()-1,WCOLS()
   ENDIF
   IF EMPTY(LOSPESOS)
      EXIT
   ENDIF
ENDDO
IF !EMPTY(PNCHE)
   IF CONFIRMA("el Pago",.T.,8,2)
      =AGRABAR("CCH",@CHQ)
      FOR PXA=1 TO ALEN(CHQ,1)
         SELE CAJ
         SCAT MEMV BLAN
         STORE LATA[PXA] TO M.CAJA
         STORE FAC.CODCLI TO M.CODCLI
         STORE DATE() TO M.FECHAOP
         STORE 'FA N§ '+IIF(TYPE("FAC.FACTURA")="C",FAC.FACTURA,alltrim(STR(FACTURA))) TO M.COMPR
         STORE 'RE' TO M.COMPRE
         STORE NADAREC TO M.NUMERE
         STORE CHQ[PXA,9] TO M.MONTO
         STORE XAUSS TO M.MONEDA
         STORE CHQ[PXA,9]/XACOTIZ TO M.EQUIVALE
         STORE CHQ[PXA,8] TO M.NROCHE
         STORE {} TO M.FECHADE
         STORE CHQ[PXA,7] TO M.BANCO
         IF ICO_TIPO='TA'
            =AGRABAR("CAJ")
         ENDIF
         =RESTACCL(FAC.CODCLI,FAC.FACTURA,CHQ[PXA,9],.T.)
	      M.fechave=lastdom(date())
       	  M.detalle="Pago "+IIF(ICO_TIPO='TA','Tarj','Cheq')+" FA N§"+FAC.FACTURA
       	  M.comprre='RE'
          m.numerore=nadarec
          =AGRABAR("CCL")
      NEXT
      sumpag=m.efecaus+m.efecdol*xacotiz+gttl
   ELSE
   PNCHE=NUL
   ENDIF
ELSE
   PNCHE=NUL
ENDIF
=RELEWIN("WIN2")
RETURN PNCHE>0
