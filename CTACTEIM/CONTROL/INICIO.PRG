=seteos()
=getfuser()
 
store 'CONTROL IMPUESTOS' TO SSTM,SSTM1
IF GETENV("EQUIPO")="RAFULS"
   STORE "F:\SISTEMAS\ALQUILER\ALQUILEA" TO PATH,PATHALQ
ELSE
   STORE "C:\SISTEMAS\ALQUILER\ALQUILEA" TO PATH,PATHALQ
ENDIF
 
=VAR_INM()
DO OPINM
=OPAUD()
=OPSEG()
SELE 0
USE IMPUESTOS ALIAS IMPU ORDER TAG CONTROL
ULPR=PROGRAM()
USADOR=GETENV("USERNAME")
 
=WIN1()
@ 0,0 SAY "INGRESO DE IMPUESTOS"
STORE 4 TO REN
LINEA=CABEZA()
STORE {} TO M.FECHAOP
STORE SPACE(1) TO M.IMPUESTO
STORE 0 TO M.PERIODO,M.CUOTA,M.ANIO
DO WHILE .T.
   STORE 0 TO M.MONTO
   STORE SPACE(15) TO M.PARTIDA
   @ REN,0 SAY LINEA
   ******* INGRESA FECHA
   @ REN,1 GET M.FECHAOP ;
     MESS "FECHA DE PAGO DEL IMPUESTO" ;
     VALID LAST()=27 .OR. !EMPTY(M.FECHAOP) ;
     ERROR "DEBE TENER UNA FECHA"
   READ
   IF LAST()=27
      IF CONFIRMA("SALIR DEL SISTEMA",.T.,10,1)
         EXIT
      ENDIF
   ELSE
      ******** INGRESA IMPUESTO
      @ REN,10 GET M.IMPUESTO ;
        PICT "@M I,M,D" ;
        MESS "IMPUESTO A INGRESAR" ;
        VALID LAST()=27 .OR. ;
        M.IMPUESTO="I" .OR. ;
        M.IMPUESTO="M" .OR. ;
        M.IMPUESTO="D" ;
        ERROR "IMPUESTO INEXISTENTE"
      READ
      IF LAST()#27
         @ REN,10 SAY PADR(IIF(M.IMPUESTO="I","INMOBILIARIO",IIF(M.IMPUESTO="D","D.I.P.O.S.","MUNICIPAL")),10)
         ************* INGRESA PARTIDA
         @ REN,21 GET M.PARTIDA ;
           MESS "PARTIDA DEL INMUEBLE"
         READ
         IF LAST()#27 .AND. !EMPTY(M.PARTIDA)
            ELORDEN=IIF(M.IMPUESTO="I","INMOBILIAR",IIF(M.IMPUESTO="D","DIPOS","MUNICIPAL"))
            IF XSEEK(M.PARTIDA,"INM",(ELORDEN))
               @ REN,37 SAY PADR(INM.DOMICILIO,20)
               ********* INGRESA PERIODO
               @ REN,58 GET M.PERIODO ;
                 PICT "999" ;
                 MESS "N§ DE PERIODO" ;
                 VALID LAST()=27 .OR. (M.PERIODO>0 .AND. M.PERIODO<13) ;
                 ERROR "NUMERO DE PERIODO INCORRECTO"
               READ
               IF LAST()#27
                  ********* INGRESA A¥O
                  @ REN,62 GET M.ANIO ;
                    PICT "999" ;
                    MESS "A¥O CORRESPONDIENTE" ;
                    VALID LAST()=27 .OR. (M.ANIO>89 .AND. M.ANIO<94) ;
                    ERROR "NUMERO DE A¥O INCORRECTO"
                  READ
                  IF LAST()#27
                     ********* INGRESA CUOTA
                     @ REN,66 GET M.CUOTA ;
                       PICT "999" ;
                       MESS "CUOTA CORRESPONDIENTE" ;
                       VALID LAST()=27 .OR. (M.CUOTA>=0 .AND. M.CUOTA<3) ;
                       ERROR "NUMERO DE CUOTA INCORRECTA"
                     READ
                     IF LAST()#27
                        BUSQ=M.PARTIDA+M.IMPUESTO+STR(M.PERIODO,2)+STR(M.ANIO,2)+STR(M.CUOTA,1)
                        IF XSEEK(BUSQ,"IMPU","CONTROL")
                           =CARTEL("EL IMPUESTO CORRESPONDIENTE",;
                             "AL PERIODO Y A¥O CONSIGNADO YA FUE INGRESADO",;
                             "POR FAVOR REVISE Y REINTENTE",;
                             "PULSE [ENTER] PARA CONTINUAR")
                        ELSE
                           ********* INGRESA MONTO
                           @ REN,70 GET M.MONTO ;
                             PICT "9,999.99" ;
                             MESS "MONTO DEL IMPUESTO ";
                             VALID LAST()=27 .OR. M.MONTO>0 ;
                             ERROR "MONTO DEL IMPUESTO"
                           READ
                           IF LAST()#27
                              IF CONFIRM1("IMPUESTO INGRESADO",.T.,20,10)
                                 =AGRABAR("IMPU")
                                 REN=REN+1
                                 IF REN=23
                                    =CABEZA()
                                 ENDIF
                              ENDIF
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ELSE
               WAIT "PARTIDA INEXISTENTE" WIND
            ENDIF
         ENDIF
      ENDIF
   ENDIF
ENDDO
=RELEWIN("WIN")
RETURN
 
FUNCTION CABEZA
M.SALIDA=CUADRO("8 1 23 0 1 8 10 15 20 3 3 3 8")
@ 2,2 SAY "FECHA"
@ 2,10 SAY PADC("IMPUESTO",10)
@ 2,21 SAY PADC("PARTIDA",15)
@ 2,37 SAY PADC("INMUEBLE",20)
@ 2,58 SAY "PER"
@ 2,62 SAY "A¥O"
@ 2,66 SAY "CUO"
@ 2,70 SAY PADC("MONTO",8)
M.REN=4
RETURN M.SALIDA
