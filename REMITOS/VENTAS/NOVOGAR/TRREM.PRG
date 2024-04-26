* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : TRREM.PRG                                                บ
* บ COMENTARIO    : TRANSFERENCIA DE INFORMACION DE REMITOS                  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 11:01:31pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
TR_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   DO CASE
   CASE TR_DIJO='Genera Diskette'
      IF CONDISCO("GENERAR DISKETTE CON REMITOS DE TRANSFERENCIA","PONGA UN DISKETTE VACIO EN LA DISKETTERA")
         =WORKING()
         DO OPREM
         SELE REM
         DATEMES=GOMONTH(DATE(),-1)
         =FLOCK() .OR. FLOK()
         =DOTALK()
         SET ORDER TO
         SORT ON REMITO ;
           TO A:REMITOS.DBF FOR ;
           TIPO="I" .AND. ;
           FECHAEM>=M.DATEMES
         TALLY=" "+ALLTRIM(STR(_TALLY))+" "
         USE
         IF FILE("A:REMITOS.DBF")
            USE A:REMITOS ALIAS REM EXCL
            INDEX ON REMITO TAG REMITO
            SET ORDER TO TAG REMITO
            SELE REX
            =FLOCK() .OR. FLOK()
            SET RELA TO REMITO INTO REM
            SORT ON REMITO ;
              TO A:REMITDAT.DBF FOR ;
              REX.REMITO=REM.REMITO
            USE IN REM
         ENDIF
         =UNTALK()
         USE IN REX
         =OPREM()
         =UNWORK()
         =IAUD("MANDA"+TALLY+"REMITOS")
         =CARTEL("PROCESO DE COPIA TERMINADO",;
           "PUEDE RETIRAR EL DISKETTE",;
           "GUARDARLO Y ETIQUETARLO CONVENIENTEMENTE",;
           "Y ENVIARLO A LA SUCURSAL CORRESPONDIENTE")
      ENDIF
   CASE TR_DIJO='Verifica Informaciขn Enviada'
      *
   CASE TR_DIJO='Verifica Informaciขn Recibida'
      *
   CASE TR_DIJO='Resumen Actualizaciขn Stock'
      *
   CASE TR_DIJO='Carga Informaciขn de Diskette'
      IF CONDISCO("LEER REMITOS DE TRANSFERENCIA Y ACTUALIZAR STOCK","PONGA EL DISKETTE RECIBIDO")
         IF FILE("A:REMITOS.DBF") .AND. FILE("A:REMITDAT.DBF")
            =WORKING()
            =OPKAR()
            =OPMER()
            SET ORDER TO TAG ARTICULO
				=OPCLI()
				SELE PER
            TR_AREA=SELE()
            USE
            DO OPREM
            SELE REM
            USE
            =GETDBF("REMITOC","REMITO","REC")
            SELE REX
            USE
            =GETDBF("REMITDAC","REMITO","RE1")
            SELE (TR_AREA)
            USE A:REMITDAT ALIAS REX EXCL
            SELE 0
            USE A:REMITOS ORDER TAG REMITO ALIAS REM EXCL
            =DOTALK()
            DELE FOR CODVIA="SUC"+SUCU
            DELE FOR CODCLI#SUCU
            DELE FOR XSEEK(REMITO+CODVIA,'REC','REMITO')
            PACK
            SCAN
               SCAT MEMV
               M.NUMERO=M.REMITO
               M.PROCOD=M.CODVIA
               STORE "" TO M.PEDIDO,FACTURA
               STORE {} TO M.FECHAPED,M.FECHAFAC
               STORE M.FECHAEM TO M.FECHAREM
               =AGRABAR("REC")
               =IAUD("LEE "+REM.REMITO+"/"+M.CODCLI)
               SELE REX
               SCAN FOR REX.REMITO=REM.REMITO
                  SCAT MEMV
                  M.NUMERO=M.REMITO
                  M.PROCOD=M.CODCLI
                  M.MONTO=M.MONTO1
                  =AGRABAR("RE1")
                  SELE MER
                  IF SEEK(M.ARTICULO)
                     =LOCK() .OR. LOK()
                     REPL STOCK WITH STOCK+M.CANTIDAD
                     UNLO IN MER
                     M.FECHAOP=M.FECHAEM
                     M.OPK="RT"
                     M.DOCREF="RE"
                     M.NRODOCREF=M.REMITO
                     M.CLIENTE=M.CODVIA
                     M.DETALLE="TRANSFERENCIA DE SUCURSAL"
                     M.ENTRADA=M.CANTIDAD
                     M.SALIDA=0
                     M.PROVEEDOR=.T.
                     =AGRABAR("KAR")
                     =IAUD(ALLTRIM(M.ARTICULO)+;
                       "+"+ALLTRIM(STR(M.CANTIDAD))+;
                       "="+ALLTRIM(STR(MER.STOCK,XACDIGI,2)))
                  ELSE
                     =IAUD("NO ENCONTRE "+;
                       ALLTRIM(M.ARTICULO)+;
                       "+"+ALLTRIM(STR(M.CANTIDAD)))
                  ENDIF
                  SELE REX
               ENDSCAN
               SELE REM
            ENDSCAN
            =UNTALK()
            =UNWORK()
				=OPCLI()
            USE IN REC
            USE IN RE1
            =REOPREM()
         ELSE
            =CARTEL("UNO DE LOS DOS ARCHIVOS",;
              "NECESARIOS PARA ESTA OPERACION",;
              "NO SE ENCUENTRA EN EL DISCO",;
              "LA OPERACION DE LECTURA Y ACTUALIZACION NO SE HA REALIZADO")
         ENDIF
      ENDIF
   ENDCASE
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
