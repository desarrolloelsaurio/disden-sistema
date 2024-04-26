* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : COBALQ.PRG                      บ
* บ COMENTARIO    : RECEPCION DE PLANILLA DEL BANCO บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                        บ
* บ FECHA      : 10-20-94                           บ
* บ HORA       : 10:46:34am                         บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER            บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
 
FUNCTION COBALQ
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   =OPCCL()
   =OPINQ()
   =OPALQ()
   =OPINM()
   =OPCCP()
   XMES=GETNU3("XMES","FOXGRL")
   XANIO=GETNU3("XANIO","FOXGRL")
   VENC1=GETNU3("VENC1","FOXGRL")
   VENC2=GETNU3("VENC2","FOXGRL")
   VENC3=GETNU3("VENC3","FOXGRL")
   FVENC1=ARMA_FEC(VENC1,XMES,XANIO)
   FVENC2=ARMA_FEC(VENC2,XMES,XANIO)
   FVENC3=ARMA_FEC(VENC3,XMES,XANIO)
   OPTAR=ALGUN(30,"Fecha de Vencimiento",;
     dtoc(fvenc1)+";"+dtoc(fvenc2)+";"+dtoc(fvenc3))
   if last()#27
      =OPRECB()
      =MOVEWINN(0,0,23,79,'WIN')
      REBLA=CUADRO("5 1 22 0 1 8 20 30 9 2")
      @ 0,0 SAY PADC("INGRESOS AL VENCIMIENTO Nง "+ALLTRIM(STR(OPTAR)),80)
      @ 2,1 SAY padc("RECIBO",8)
      @ 2,10 SAY PADC("INQUILINO",20)
      @ 2,31 SAY PADC("INMUEBLE",30)
      @ 2,62 SAY PADC("MONTO",8)
      @ 2,72 SAY "OK"
      @ 23,1 SAY "TOTAL INGRESADO:"
      REN=4
      RELE REC
      STORE NUL TO M.PUNTERO,M.SUMA
      DO WHILE .T.
         STORE SPACE(8) TO M.RECIBO
         @ REN,1 GET M.RECIBO ;
           MESS "Nฃmero de Recibo - [ESC] para Finalizar"
         READ
         IF LAST()=27
            EXIT
         ENDIF
         IF !EMPTY(VAL(M.RECIBO))
            M.RECIBO=ZERO(M.RECIBO,8)
            @ REN,1 SAY M.RECIBO
            ESTA=IIF(EMPTY(M.PUNTERO),0,ASCAN(REC,M.RECIBO))
            IF EMPTY(ESTA)
               IF XSEEK(M.RECIBO,"RECB","NUMERO")
                  IF EMPTY(RECB.PAGADA)
                     @ REN,10 SAY SAYPER(RECB.CODCLI,"INQCOD",20)
                     @ REN,31 SAY LEFT(SAYGRL(RECB.CODINM,"INM","CODINM","INM.DOMICILIO"),30)
                     DO CASE
                     CASE OPTAR=1
                        ELMONTO=RECB.MON1
                     CASE OPTAR=2
                        ELMONTO=RECB.MON2
                     OTHERWISE
                        ELMONTO=RECB.MON3
                     ENDCASE
                     @ REN,62 SAY M.ELMONTO PICT "99,999.99"
                     STORE "NO" TO M.RESPUESTA
                     @ REN,72 GET M.RESPUESTA PICT "@M NO,SI" ;
                       MESS "Confirma los datos Ingresados ? - [BARRA ESP] Cambia Opciones"
                     READ
                     IF M.RESPUESTA="SI"
                        PUNTERO=PUNTERO+1
                        DIME REC[PUNTERO]
                        REC[PUNTERO]=M.RECIBO
                        M.SUMA=M.SUMA+ELMONTO
                        @ 23,60 SAY M.SUMA PICT "999,999.99"
                        IF REN=21
                           =FOR_SAY(REBLA,4,21,0)
                           REN=4
                        ELSE
                           REN=REN+1
                        ENDIF
                     ELSE
                        @ REN,0 SAY REBLA
                     ENDIF
                  ELSE
                     WAIT "RECIBO COBRADO EL "+DTOC(RECB.FECHA) WIND
                  ENDIF
               ELSE
                  WAIT "RECIBO NO ENCONTRADO - "+ENTERCON WIND
               ENDIF
            ELSE
               WAIT "RECIBO YA INGRESADO - "+ENTERCON WIND
            ENDIF
         ELSE
            =NOSELEC("RECIBO")
         ENDIF
      ENDDO
      IF EMPTY(M.SUMA)
         =NOSELEC("RECIBO")
      ELSE
         *** SE SELECCIONARON RECIBOS
         SELE CCL
         SET ORDER TO
         =MEN_LIN("PROCESANDO RECIBOS - POR FAVOR ESPERE UNOS INSTANTES")
         =WORKING()
         =DOTALK()
         FOR XAX=1 TO PUNTERO
            M.RECIBO=REC[XAX]
            =XSEEK(M.RECIBO,"RECB","NUMERO")
            SELE RECB
            =FLOCK("RECB") .OR. FLOK("RECB")
            M.MONTOORI=RECB.MON1
            DO CASE
            CASE M.OPTAR=1
               M.MONTO=RECB.MON1
               REPL RECB.MON2 WITH NUL
               REPL RECB.MON3 WITH NUL
               STORE 0 TO M.LADIF
            CASE M.OPTAR=2
               M.MONTO=RECB.MON2
               STORE M.MONTO-RECB.MON1 TO M.LADIF
               REPL RECB.MON1 WITH NUL
               REPL RECB.MON3 WITH NUL
            OTHERWISE
               M.MONTO=RECB.MON3
               STORE M.MONTO-RECB.MON1 TO M.LADIF
               REPL RECB.MON2 WITH NUL
               REPL RECB.MON1 WITH NUL
            ENDCASE
            REPL RECB.PAGADA WITH .T.
            =REPUSE()
            UNLO IN RECB
            SELE CCL
            REPL CCL.PAGADA WITH .T.,;
              CCL.CUOTA WITH CCL.MONTO ;
              FOR CCL.NUMERO=M.RECIBO
            =IAUD(M.RECIBO+"/"+STR(M.MONTO,9,2))
            M.CODCLI=RECB.CODCLI
            M.FECHAOP=DATE()
            M.FECHAVE=IIF(OPTAR=1,FVENC1,IIF(OPTAR=2,FVENC2,FVENC3))
            M.DETALLE="ALQ"+STR(RECB.RMES,2)+RIGHT(STR(RECB.RANIO),2)+"๐BANCO"
            M.COMPRRE="RE"
            M.COMPR="RE Nง 0000-"+RECB.NUMERO
            M.NUMERORE=RECB.NUMERO
            M.MONEDA="PE"
            M.EQUIVALE=M.MONTO
            M.PAGADA=.T.
            M.CUOTA=M.MONTO
            M.CODINM=RECB.CODINM
            M.MARCA=.F.
            M.C_MES=RECB.RMES
            M.C_PERIODO=1
            M.C_ANIO=RECB.RANIO
            =XSEEK(RECB.CODINM,"ALQ","CODINM")
            M.C_COMIS=ALQ.COMISION
            M.C_CUOTA=M.MONTO
            M.MARKA=.F.
            M.REGNO=0
            M.NUMERO=M.RECIBO
            =AGRABAR("CCL")
            *** SI HAY DIFERENCIA
            IF !EMPTY(M.LADIF)
               STORE M.LADIF TO M.MONTO,M.EQUIVALE
               M.COMPRRE="FA"
               M.COMPR="RE Nง 0000-"+RECB.NUMERO
               M.DETALLE="ALQ"+STR(RECB.RMES,2)+RIGHT(STR(RECB.RANIO),2)+"๐INT POR MORA"
               =AGRABAR("CCL")
            ENDIF
            ***
            *** GRABA EN CCP SOLO SI NO ES ALQUILER ASEGURADO
            IF EMPTY(ALQ.FECHASEG)
               M.MONTO=M.MONTO-4
               M.PAGADA=.F.
               M.CUOTA=0
               M.PROCOD=SAYGRL(ALQ.CODINM,"INM","CODINM","INM.PROCOD")
               M.COMPR="ND Nง "+M.RECIBO
               M.COMPRRE="ND"
               M.AUTORIZ=.T.
               =AGRABAR("CCP")
               IF LEFT(CCL.DETALLE,3)="ALQ" .AND. LEN(ALLTRIM(CCL.DETALLE))=7
                  STORE M.MONTO*ALQ.COMISION/100 TO M.MONTO,M.EQUIVALE
                  M.COMPRRE="NC"
                  M.DETALLE="ALQ"+STR(RECB.RMES,2)+RIGHT(STR(RECB.RANIO),2)+"๐Comis"
                  M.COMPR="NC Nง "+M.RECIBO
                  =AGRABAR("CCP")
               ENDIF
         ENDIF
         ***
         *** AHORA BUSCA IMPUESTOS COMPARTIDOS A ABONAR
         ***
         *SELE CCL
         *SCAN FOR CCL.NUMERO==M.RECIBO
         *   ELIMPU=LEFT(DETALLE,3)
         *   IF ELIMPU="DIP" .OR. ELIMPU="MUN" .OR. ELIMPU="INM"
         *      =XSEEK(ALQ.CODINM,"INM","CODINM")
         *      DO CASE
         *      CASE ELIMPU="MUN"
         *         M.ELTX=INM.MUNIC
         *         M.SE_FACTURA=INM.FACMUN
         *      CASE ELIMPU="INM"
         *         M.ELTX=INM.INMOC
         *         M.SE_FACTURA=INM.FACINM
         *      CASE ELIMPU="DIP"
         *         M.ELTX=INM.DIPOC
         *         M.SE_FACTURA=INM.FACDIP
         *      ENDCASE
         *      SCAT MEMV
         *      =AGRABAR("CCP")
         *   ENDIF
         *ENDSCAN
      NEXT
      =UNTALK()
      =UNWORK()
   ENDIF
   =RELEWIN()
ELSE
   =NOSELEC("FECHA")
ENDIF
ELSE
=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
