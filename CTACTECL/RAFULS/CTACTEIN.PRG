* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CTACTEIN.PRG                                             บ
* บ COMENTARIO    : CUENTA CORRIENTE DE INQUILINOS                           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 01-01-94                                                    บ
* บ HORA       : 06:47:35pm                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM

C_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
STORE .F. TO AFUTURO
DO CASE
CASE C_DIJO="Nota de Crdito"
	=OPCIU()
	=OPCCL()
	=OPINM()
	=OPALQ()
	=OPPRP()
	ndt=" Crdito "
	TIPONDT="NC"
	DO ICRE.SPR WITH .F.,.F.,"ALQ"," Nota de Crdito a Inquilinos ",.T.,.T.,.T.
CASE C_DIJO="Nota de Dbito"
	respuesta='ALGO#9#20#Tipo de Nota de Dbito#3;
#\<Todos los Contratos;
#\<Un Inmueble;
#\<Inquilino sin Contrato'
	=DEFPOP()
	ON SELE POPU ALGO DO NDEB
	ACTI POPU ALGO
	RELE POPU ALGO
CASE C_DIJO="Ingreso de Gastos"
	DO OPIAC
	DO OPINM
	DO OPINQ
	=OPCCL()
	DO OPCCP
	DO OPIMP
	DO IIMPINQ
CASE C_DIJO="Reimputa"
	DO INQ
case LEFT(C_DIJO,11)="Cta Cte por"
	=OPCIU()
	DO OPINQ
	=OPCCH()
	=OPCCL()
	respuesta='NADA#7#20#Tipo de Listado#3;
#\<Saldos Completos;
#Saldos \<por Propietario;
#Un \<Inquilino;
#Sขlo Al\<quileres;
#-;
#Histขrico'
=defpop()
	ON SELE POPU NADA DO CTACTEC1 WITH (C_DIJO#"Cta Cte por Impresora")
	ACTI POPU NADA
	RELE POPU NADA
CASE C_DIJO="Pasa a Histขrico"
    DO INQ
CASE C_DIJO='Reindexa'
	=OPCCL() .AND. XCCL()
CASE C_DIJO="Compacta el Archivo"
	=OPCCH()
	=OPCCL()
   DO XCCL WITH .T.
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
