********************************************************************************
*-- Programa: crem.prg
*-- Fecha   : 07/25/91 07:56pm
*-- Version : G. REINER
*-- Notas   : corrige remito de transporte de avios y telas a fabricas y talleres
********************************************************************************
#DEFINE PICU '99999999'
#DEFINE PICU1 "@!"
#DEFINE ERR "EL A¥O ESTA ENTRE LIMITES INACEPTABLES"
parameter entrada
STORE HORA_ulp(program()) to ulpr
if cheqseg()
   =MOVEWIN(2,1,21,79,"WIN",' Datos de Env¡o y Recepci¢n ')
   =XSEEK(FAX.REMITO,'REM','REMITO')
   ANI1=YEAR(DATE())-1
   ANI2=YEAR(DATE())+1
   @ 1,1 SAY "REMITO" COLO SCHE 3
   @ 1,40 SAY "O CORTE" COLO SCHE 3
   @ 2,1 SAY "FECHA" COLO SCHE 3
   @ 2,40 SAY "PROCESO" COLO SCHE 3
   @ 3,1 SAY "TALLER" COLO SCHE 3
   @ 1,15 GET REM.REMITO
   @ 1,50 GET REM.NUMOT
   @ 2,15 GET REM.FECHAOP
   =XSEEK(REM.TALLER,'PER','TALCOD')
   @ 3,15 GET PER.CLIENTE
   CLEA GETS
   @ 2,50 SAY LEFT(SAYGRL(FAX.PRC,"PRC","PRCCOD","PRC.PROCFAB"),25)
   SELE FAX
   SCAT MEMV
   m.fpreant=m.ffinprev
   @ 4,0 say "        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
   @ 5,0 say "        ³         ENTRADA A TALLER        ³        SALIDA DE TALLER         ³"
   @ 6,0 say "        ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
   @ 7,0 say "        ³FECHA         :                  ³FECHA         :                  ³"
   @ 8,0 say "        ³HORA          :                  ³HORA          :                  ³"
   @ 9,0 say "        ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
   @ 10,0 say "        ³    ENTREGA    ³     RECIBE      ³    ENTREGA    ³     RECIBE      ³"
   @ 11,0 say "ÚÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
   @ 12,0 say "³CANTID:³               ³                 ³               ³                 ³"
   @ 13,0 say "ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
   @ 14,0 say "³RESPONS³               ³                 ³               ³                 ³"
   @ 15,0 say "ÀÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
   @ 16,0 SAY "Final Previsto del Proceso:"
   @ 7,26 GET M.EF MESS "Fecha de Entrada al Taller" ;
     WHEN EMPTY(M.EF) ;
     VALID BETW(YEAR(M.EF),ANI1,ANI2) ;
     ERROR ERR
   @ 8,26 GET M.EH MESS "Hora de Entrada al Taller" pict '99:99';
     WHEN !EMPTY(M.EF) .AND. EMPTY(M.EH)
   @ 12,12 GET M.EEC MESS "Cantidad Ingresada de Casa Central al Taller" pict PICU ;
     WHEN USADOR="GOYO" .OR. (!EMPTY(M.EF) .AND. EMPTY(M.EEC))
   @ 14,12 GET M.EER MESS "Responsable de la Entrada por Parte de la Empresa " pict PICU1;
     WHEN !EMPTY(M.EF) .AND. EMPTY(M.EER)
   @ 12,28 GET M.ESC MESS "Cantidad Recibida por parte del Taller" pict PICU;
     WHEN USADOR="GOYO" .OR. (!EMPTY(M.EF) .AND. EMPTY(M.ESC))
   @ 14,28 GET M.ESR MESS "Responsable de Recepci¢n por Parte del Taller " pict PICU1;
     WHEN !EMPTY(M.EF) .AND. EMPTY(M.ESR)
   @ 16,28 get m.ffinprev mess "Fecha Prevista de Finalizaci¢n" 
   IF ENTRADA
      READ
   ELSE
      CLEA GETS
      @ 3,60 GET M.MONTO ;
        MESS "Monto de la Operaci¢n por Unidad sin IVA" ;
        PICT "99999999.99" ;
        WHEN !EMPTY(M.MONTO)
      @ 7,60 GET M.SF MESS "Fecha de Salida del Taller" ;
        WHEN EMPTY(M.SF)  ;
        VALID BETW(YEAR(M.SF),ANI1,ANI2) ;
        ERROR ERR
      @ 8,60 GET M.SH MESS "Hora de Salida del Taller" pict '99:99';
        WHEN !EMPTY(M.SF) .AND. EMPTY(M.SH)
      @ 12,44 GET M.SEC MESS "Cantidad Entregada por el Taller" pict PICU;
        WHEN USADOR="GOYO" .OR. (!EMPTY(M.SF) .AND. EMPTY(M.SEC))
      @ 14,44 GET M.SER MESS "Responsable de la Entrega por Parte del Taller" pict PICU1;
        WHEN !EMPTY(M.SF) .AND. EMPTY(M.SER)
      @ 12,62 GET M.SSC MESS "Cantidad Recibida por la Empresa" pict PICU;
        WHEN USADOR="GOYO" .OR. (!EMPTY(M.SF) .AND. EMPTY(M.SSC))
      @ 14,62 GET M.SSR MESS "Responsable de Recepci¢n por Parte de la Empresa" pict PICU1;
        WHEN !EMPTY(M.SF) .AND. EMPTY(M.SSR)
      READ
   ENDIF
   IF LAST()#27 .AND. CONFIRMA("Datos Ingresados",.T.,20,40)
      IF !ENTRADA
         M.FFINPREV = M.SF      
      ENDIF
      M.DIFF = IIF(EMPTY(M.FPREANT),0,M.FPREANT-M.FFINPREV)
      =AGRABAR1("FAX")
      =IAUD(REM.REMITO)
      IF !EMPTY(M.DIFF)
      **  BATA 27-12-95 MODIFICA FECHAS DE FIN PREVISTO
         SELE FAX
         SET ORDE TO NUMTRU
         IF SEEK(M.NUMERO)
         	M.MAXFE={}
            SCAN WHILE NUMERO=M.NUMERO
               IF EMPTY(SF) .AND. !EMPTY(FFINPREV)
                  REPLACE FFINPREV WITH FFINPREV+M.DIFF
               ENDIF
               M.MAXFE=IIF(M.MAXFE>FFINPREV,M.MAXFE,FFINPREV)
            ENDSCAN
            IF !EMPTY(M.MAXFE)
            	IF XSEEK(M.NUMERO,"COR","NUMERO")
            		REPL COR.FECHAPRE WITH M.MAXFE
            	ENDIF
            ENDIF
         ENDIF
      **  FIN BATA 27-12-95
      ENDIF
   ENDIF
   =RELEWIN("WIN")
ELSE
   =IAUDI()
ENDIF
UNLO ALL
DEAC WIND ALL
RETURN men_lin(botom)
