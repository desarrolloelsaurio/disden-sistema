* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �  APLICACION: ADMINISTRCION RAFULS                  �
* �    ARCHIVO: LIMPU.PRG                              �
* �       AUTOR: R. 'EL BATA'                          �
* � Date created: 12-11-92                             �
* � Time created: 02:05:41pm                           �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L. �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   STORE '' TO TT
   TIPIMPU=BAR()
	 M.QUEIMP=Q_IMP(TIPIMPU)
   M.ORDERTAG=CHRTRAN(M.QUEIMP,".","")
   DEFI WIND INGCHE FROM 0,0 TO 20,77 TITL " Ingreso de Impuesto "+QUEIMP+" " foot " "+alltrim(Janname)+" " colo sche 8
   =CENTWIN("INGCHE")
   @ 4,0 SAY PADC("DATOS DEL INGRESO",76,"*") COLO SCHE 3
   @ 8,1 say "PERIODO" COLO SCHE 3
   @ 10,1 SAY "A쩙" COLO SCHE 3
   @ 12,1 SAY "CUOTA" COLO SCHE 3
   STORE DATE() TO M.FECHADE
   STORE INT(MONTH(DATE())/2)+1 TO M.PERIODO
   STORE YEAR(DATE()) TO M.ANIO
   STORE 1 TO CUOTA
   STORE NUL TO MONTO
   STORE SPACE(15) TO PARTIDA
   @ 8,20 GET M.PERIODO ;
  MESS "PERIODO DEL IMPUESTO"
   @ 10,20 GET M.ANIO ;
  MESS "A쩙 CORRESPONDIENTE"
   @ 12,20 GET M.CUOTA ;
  MESS "CUOTA DEL IMPUESTO"
   READ
   IF LAST()#27
      store str(m.periodo,2)+RIGHT(str(m.anio,4),2)+str(cuota,1) to laepoca
      STORE "" TO ACLA,LINEA
      =LIMPU0()
      =WIN0()
      PAG=1
      =CABPAN()
      STOR NUL TO CASOS
      =TIT_LIN(1)
      DO CASE
      CASE TIPIMPU=1
         SCAN FOR !EMPTY(INM.MUNICIPAL) .AND. RECMUN
            IF ROW()>21
               IF !FIN_LIN(1,NUL)
                  EXIT
               ENDIF
               CLEA
               STOR PAG+1 TO PAG
               =CABPAN()
               =TIT_LIN(2)
            ENDIF
            IF !XSEEK(INM.MUNICIPAL+LAEPOCA,"CCI","CONTROL")
               ?PAIP+INM.DOMICILIO+PAIP+INM.MUNICIPAL+PAIP
               CASOS=CASOS+1
            ENDIF
         ENDS
      CASE TIPIMPU=2
         SCAN FOR !EMPTY(INM.INMOBILIAR) .AND. RECINM
            IF ROW()>21
               IF !FIN_LIN(1,NUL)
                  EXIT
               ENDIF
               CLEA
               STOR PAG+1 TO PAG
               =CABPAN()
               =TIT_LIN(2)
            ENDIF
            IF !XSEEK(INM.INMOBILIAR+LAEPOCA,"CCI","CONTROL")
               ?PAIP+INM.DOMICILIO+PAIP+INM.INMOBILIAR+PAIP
               CASOS=CASOS+1
            ENDIF
         ENDS
      CASE TIPIMPU=3
         SCAN FOR !EMPTY(INM.DIPOS) .AND. RECDIP
            IF ROW()>21
               IF !FIN_LIN(1,NUL)
                  EXIT
               ENDIF
               CLEA
               STOR PAG+1 TO PAG
               =CABPAN()
               =TIT_LIN(2)
            ENDIF
            IF !XSEEK(INM.DIPOS+LAEPOCA,"CCI","CONTROL")
               ?PAIP+INM.DOMICILIO+PAIP+INM.DIPOS+PAIP
               CASOS=CASOS+1
            ENDIF
         ENDS
      ENDCASE
   ENDIF
   =IAUD(QUEIMP)
   =FIN_LIN(2,CASOS)
   =RELEWIN("WIN")
ELSE
   =IAUDI()
ENDIF
RETURN RELEWIN("INGCHE") .AND. MEN_LIN(BOTOM)
