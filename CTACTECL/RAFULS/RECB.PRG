* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : RECB.PRG                    บ
* บ COMENTARIO    : GESTION DE RECIBOS BANCARIOSบ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                    บ
* บ FECHA      : 11-24-93                       บ
* บ HORA       : 12:03:34pm                     บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER        บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM

R_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE R_DIJO='Listado de Control Completo'
DO LLIQBC
CASE R_DIJO='Listado de Control un Inquilino'
STORE NUL TO M.RESPUESTA
=IIF(ELIINQ("Listar",-1,1),LLIQBC1(),.T.)
CASE R_DIJO='Emite Todos los Recibos p/banco'
DO LLIQB
CASE R_DIJO='Emite Un Recibo p/banco'
STORE NUL TO RESPUESTA
IF !EMPTY(ELIINM("a Listar",-1,1))
DO CHVEN.SPR
***
XMES=GETNU3("XMES","FOXGRL")
XANIO=GETNU3("XANIO","FOXGRL")
VENC1=GETNU3("VENC1","FOXGRL")
VENC2=GETNU3("VENC2","FOXGRL")
VENC3=GETNU3("VENC3","FOXGRL")
MORA1=GETNU3("MORA1","FOXGRL")
MORA2=GETNU3("MORA2","FOXGRL")
MORA3=GETNU3("MORA3","FOXGRL")
FVENC1=ARMA_FEC(VENC1,XMES,XANIO)
	=OPCCL()
   SET ORDER TO TAG CODCLI
   DO OPALQ
   DO OPINQ
   DO OPRECB
   SELE RECB
   SET ORDER TO TAG NUMERO
IF GETENV("MAQUINA")="080000128170"
   STORE .F. TO LPT1
   STORE .T. TO LPT2
ENDIF
   SELE ALQ
   SET ORDER TO TAG CODINM
   IF SEEK(INM.CODINM)
   =CABPRI(.F.,"36")
   _PCOPIES=1
   PRINTJOB
	 COL1=5
	 COL3=55
	 COL2=45
	 COL4=65
	 COL5=65
	 COLFEC=70
	 COL6=74
	 COX1=93
	 COX2=90
	 SELE ALQ
        DO LLIQB1
     ENDP
   =FINIMP()
   STORE .F. TO LPT2
   STORE .T. TO LPT1
   ENDIF
  ENDIF
CASE R_DIJO='Anula Recibo'
M.maxrec=GETNU3("RECIBO","FOXGRL")
store nul to m.respuesta
=infic("Recibo a Anular",maxrec)
ELREC=RESPUESTA
if !empty(ELREC) .and. ;
confirma("ANULAR EL RECIBO Nง "+ALLTRIM(STR(ELREC)),.T.,10,2)
=WORKING()
=OPRECB()
SET ORDER TO TAG NUMERO
ELREC=ZERO(ELREC,8)
IF SEEK(ELREC)
   =FLOCK() .OR. FLOK()
   REPL RECB.CODCLI WITH ""
   REPL RECB.CODINM WITH ""
   REPL RECB.MON1 WITH 0
   REPL RECB.MON2 WITH 0
   REPL RECB.MON3 WITH 0
   REPL RECB.RMES WITH 0
   REPL RECB.RANIO WITH 0
   UNLO IN RECB
   =OPCCL()
   SELE CCL
   =FLOCK("CCL") .OR. FLOK("CCL")
   REPL NUMERO WITH "" FOR NUMERO=ELREC
   UNLO IN CCL
ELSE
   WAIT "EL RECIBO "+ELREC+" NO HA SIDO ENCONTRADO"
ENDIF
=UNWORK()
=WCL()
ENDIF
CASE R_DIJO='Modifica Recibo'
	respuesta='RECB1#8#60#Modifica Recibo #3;
#\<Un Inquilino;
#\<Todos los Inquilinos'
	=DEFPOP()
	ON SELE POPU recb1 DO modliq
	ACTI POPU RECB1
	RELE POPU RECB1
CASE R_DIJO='Recepciขn Planilla de Cobro'
DO COBALQ
CASE R_DIJO='Listados por Pantalla' .OR. ;
 R_DIJO='Listados por Impresora'
respuesta='LRECB#12#40#Lกmites del Listado#3;
#Recibo de Prueba;
#Recibos \<Emitidos;
#Recibos \<Pendientes;
#Recibos \<Cobrados;
#-;
#Recibos de un \<Inquilino'
=defpop()
ON SELE POPU LRECB DO LRECB WITH R_DIJO='Listados por Pantalla'
ACTI POPU LRECB
RELE POPU LRECB
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
