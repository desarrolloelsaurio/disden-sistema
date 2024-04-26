*******************************************************************************
*-- Programa: ICOBTARJ.PRG
*-- Fecha   : 10-19-92 07:12pm
*-- Version : G. REINER
*-- Notas   : INGRESA COBROS DE FACTURAS CONTADO
*-- MODIFICACION GOYO - DE TARJETAS DE CREDITO 04/11/92 -> CHEQUES
*-- VERSION NOVOGAR - CAJA PUBLICO
********************************************************************************
ULPR=hora_ulp(PROGRAM())
IF CHEQSEG()
   VEZ=1
	=OPCCL()
	=OPFAC()
	=OPCCH()
   IF ELIFAC()
      ELCLI=FAC.CODCLI
      SELE CCL
      SET ORDER TO TAG CODCLI
      IF XSEEK(ELCLI,'PER','CODCLI')
         ESCLIENTE=.F.
         IF LEFT(PER.CLIENTE,7)='TARJETA'
            RELE FAXT
            DIME FAXT[1]
            LADEUDA=FAC.MONTONET
            STORE NUL TO PUNTERO,PESOS,DOLARES,CHEQUES,GTTL,PNCHE,LATAR,TARJETA,ELNUMERO
            STORE NUL TO CHEQUES,EFECAUS,EFECDOL,SUMPAG,namonto,vuelto
            IF LADEUDA>0
               JANNRO=1
               M.PUNMAR=(JANNRO-1)*20+7
               GO M.PUNMAR IN DOC
               NADAREC=Q_FAC(SUCU+'-'+ALLTRIM(STR(DOC.NUMERO)))
               STORE NUL TO DEBE
               STORE LADEUDA TO HABER
               STORE .T. TO SALIDA
               IF !ESCLIENTE
                  IF !FILE((PATHVEN+'\A'+righT(FAC.FACTURA,7)+'.TMP'))
                     SALIDA=CLI_TXT(PATHVEN+'\A'+righT(FAC.FACTURA,7)+'.TMP')
                     =RELEWIN("CLITXT")
                  ENDIF
               ENDIF
               IF SALIDA
                  IF !ESCLIENTE
                     REST FROM (PATHVEN+'\A'+righT(FAC.FACTURA,7)+'.TMP') addi
                  ELSE
                     M.CLITXTNA=PER.CLIENTE
                     M.CLITXTAD=PER.DOMICILIO
                     =XSEEK(PER.LOCALIDAD,'MIX','CIUCOD')
                     M.CLITXTLO=MIX.TEXTO1
                  ENDIF
                  =XSEEK(PER.LOCALIDAD,'MIX','CIUCOD')
                  M.CLITXTLO=MIX.TEXTO1
                  =POPCARTE('$$$'+;
                    chr(13)+chr(10)+'Ingresa Cobranza '+;
                    CHR(13)+CHR(10)+'Factura '+alltrim(faC.factura)+;
                    CHR(13)+CHR(10)+'Cliente '+alltrim(m.clitxtna)+;
                    CHR(13)+CHR(10)+'$$$'+;
                    CHR(13)+CHR(10)+'Deuda '+transf(LADEUDA,'99,999,999.99')+;
                    CHR(13)+CHR(10)+'$$$')
                  CLEA GETS
                  GRABO=ICOBT(LADEUDA)
                  =RELEWIN("POPCARTE")
                  IF GRABO
                     SUMPAG=FAC.MONTONET
                     =LRECIT()
                     =IAUD(M.CLITXTNA+"/"+(FAC.FACTURA))
                     SELE DOC
                     GO M.PUNMAR IN DOC
                     REGISTRO=STR(M.PUNMAR)
                     =LOCK() .OR. LOK()
                     REPL DOC.NUMERO WITH DOC.NUMERO+1
                     UNLO IN DOC
                  ENDIF
               ENDIF
            ENDIF
            UNLO IN DOC
         ENDIF
      ENDIF
   ENDIF
ELSE
   =Iaudi()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)
