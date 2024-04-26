* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LLIQ1.PRG                                                บ
* บ COMENTARIO    : EMITE COMPROBANTE DE LIQUIDACION                         บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-01-93                                                    บ
* บ HORA       : 01:50:15pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CR1    55

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   DO CHVEN.SPR
   IF LAST()#27
      =WORKING()
      =DOTALK()
      STORE "" TO M.VENC1,M.VENC2,M.VENC3,M.MORA1,M.MORA2,M.MORA3,M.XMES,M.XANIO,M.FECHALIM,M.RECIBO
      =GETFOGRL("VENC1","MIX.NU3","M.HAYVENC1","N")
      =GETFOGRL("VENC2","MIX.NU3","M.HAYVENC2","N")
      =GETFOGRL("VENC3","MIX.NU3","M.HAYVENC3","N")
      =GETFOGRL("MORA1","MIX.NU3","M.HAYMORA1","N")
      =GETFOGRL("MORA2","MIX.NU3","M.HAYMORA2","N")
      =GETFOGRL("MORA3","MIX.NU3","M.HAYMORA3","N")
      =GETFOGRL("XANIO","MIX.NU3","M.HAYXANIO","N")
      =GETFOGRL("XMES","MIX.NU3","M.HAYXMES","N")
      =GETFOGRL("RECIBO","MIX.NU3","M.HAYRECIBO","N")
      DIME COLX[3],COLR[3],FEC[3],MOR[3]
      STORE NUL TO COLX[1],COLR[1]
      STORE 47 TO COLX[2]
      STORE 94 TO COLX[3]
      STORE INT(COLX[2]*1.65)+4 TO COLR[2]
      STORE INT(COLX[3]*1.65)+6 TO COLR[3]
      STORE M.VENC1 TO FEC[1]
      STORE M.VENC2 TO FEC[2]
      STORE M.VENC3 TO FEC[3]
      STORE 1+M.MORA2/100 TO MOR[2]
      STORE 1+M.MORA3/100 TO MOR[3]
      SET ORDER TO TAG CODINM IN INM
      SELE ALQ
      SET ORDER TO
      SET RELA TO CODINM INTO INM
      TMP=GENTMP()
      =FLOCK("ALQ") .OR. FLOK("ALQ")
      SORT ON CODCLI TO (TMP) FOR &FISC
      USE (TMP) ALIAS ALQ EXCL
      SET ORDER TO TAG INQCOD IN PER
      SET ORDER TO TAG CODINM IN CCL
      SET RELA TO CODCLI INTO PER
      SET RELA TO CODINM INTO INM ADDI
      =UNTALK()
      =UNWORK()
      STOR NUL TO CASOS
      =CABPRI(.F.,"36","255")
      _PCOPIES=1
      PRINTJOB
         SCAN
            RC="RECIBO Nง 0000-"+ZERO(M.RECIBO,8)
            ?
            FOR LL=1 TO 3
               ?? PADL(RC,30) AT COLX[LL]+COLX[2]-35
            NEXT
            ?
            ?
            M.RECIBO=M.RECIBO+1
            ****************
            ***** CABECERA 1ฆ LINEA (ADMINISTRACION RAFULS)
            ****************
            =LLIQ102("ADMINISTRACION RAFULS","IVA : RESP no Ins.")
            ****************
            ***** CABECERA 2ฆ LINEA DOMICILIO
            ****************
            ?
            =LLIQ102(padr("RIOJA 1426",21),"CUIT: 20-06035454-6")
            ****************
            ***** CABECERA 3ฆ LINEA TELEFONO
            ****************
            ?
            =LLIQ102(padr("Tel: 403007 - 63761",21),"")
            ****************
            ***** CABECERA 4ฆ LINEA LOCALIDAD SUBRAYADO
            ****************
            ?
            =LLIQ102("2000-ROSARIO","")
            ********************* FIN CABECERA

            ?
            ?
            ?

            ** NOMBRE DEL INQUILINO
            =LLIQ102(ALLTRIM(PER.CLIENTE)+"-",PER.CODCLI)

            ** DOMICILIO DEL INMUEBLE
            ?
            =LLIQ102(INM.DOMICILIO,"")

            ** LOCALIDAD DEL INMUEBLE
            ?
            =LLIQ102(ALLTRIM(SAYMIX(INM.LOCALIDAD,"CIUCOD")),"")
            ?
            ?? CHR(15)
            ** INICIO CONCEPTOS
            SELE CCL
            SEEK ALQ.CODINM
            STORE NUL TO M.TTL
            SCAN WHILE CCL.CODINM=ALQ.CODINM
               IF !PAGADA
                  IF !EMPTY(CCL.MONTO)
                     IF ESDEBE(CCL.COMPRRE)
                        ELMONTO=CCL.MONTO
                     ELSE
                        ELMONTO=0-CCL.MONTO
                     ENDIF
                     ?
                     FOR LL= 1 TO 3
                        ?? Q_TIPTEX(CCL.DETALLE) AT COLR[LL]
                        ?? STR(ELMONTO,9,2) AT COLR[LL]+CR1
                     NEXT
                     M.TTL=M.TTL+ELMONTO
                  ENDIF
               ENDIF
            ENDSCAN
            ** TOTAL
            FOR LL= 1 TO 3
               ?? REPL("_",9) AT COLR[LL]+CR1
            NEXT
            ? CHR(18)
            FOR LL= 1 TO 3
               ?? PADR("TOTAL",30) AT COLX[LL]+10
               ?? STR(M.TTL,9,2) AT COLX[LL]+29
            NEXT
            ?
            ** VENCIMIENTOS
            FOR VV=1 TO 3
               ?
               FOR LL=1 TO 3
                  ?? ALLTRIM(STR(VV))+"ง VENC:" AT COLX[LL]
                  ?? "________" AT COLX[LL]
                  ?? " "
                  ?? ARMA_FEC(FEC[VV],M.XMES,M.XANIO)
                  ?? " "
                  IF VV#1
                     ?? STR(M.TTL*MOR[VV],9,2) AT COLX[LL]+29
                  ELSE
                     ?? STR(M.TTL,9,2) AT COLX[LL]+29
                  ENDIF
               NEXT
            NEXT
            ?
            ? "ORIGINAL PARA EL INQUILINO" AT COLX[1]
            ?? "DUPLICADO PARA ADMINISTRACION RAFULS" AT COLX[2]
            ?? "TRIPLICADO PARA EL BANCO" AT COLX[3]
            ?
            ?
            FOR LL=1 TO 3
               ?? "-" AT COLX[LL]
               ?? " Observaciones "
               ?? repl("-",25)
            NEXT
            EJECT PAGE
            SELE ALQ
            =IAUD(ALLTRIM(PER.CLIENTE)+"/"+ALLTRIM(ALQ.CODINM),.T.)
         ENDSCAN
      ENDP
      =FINIMP()
      =REOPALQ()
      =IAUD(FISC)
      ******* MODIFICA Nง RECIBO
      =XSEEK("RECIBO","MIX","FOXGRL")
      REGISTRO=STR(RECNO())
      =LOCK("MIX") .OR. LOK("MIX")
      REPL MIX.NU3 WITH M.RECIBO
      =IAUD("ACT NUM RECIBO")
      UNLO IN MIX
      ***********
   ENDIF
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION LLIQ102
PARAMETER LTEX1,LTEX2
FOR LL=1 TO 3
   ?? LTEX1 AT COLX[LL]
   ?? "  "
   ?? LTEX2
NEXT
RETURN
