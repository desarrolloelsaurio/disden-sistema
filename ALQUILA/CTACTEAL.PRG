* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : CTACTEAL.PRG         �
* � COMENTARIO    : CTA CTE ALQUILERES   �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 11-24-93                �
* � HORA       : 11:43:29am              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
CTA_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
DO CASE
CASE CTA_DIJO='Genera Alquiler'
	=OPIAC()
	=OPINQ()
	=OPINM()
	=OPALQ()
	=OPALQFUT(.T.)
	=OPCCL()
	=OPCCP()
	DO ICCL
	USE IN FUT
CASE CTA_DIJO='Emite Control'
	=OPINM()
	=OPINQ()
	=OPALQ()
	=OPALQFUT(.T.)
	=OPCCL()
	=OPCCP()
	DO LALQCTR1
	USE IN FUT
CASE CTA_DIJO='Emite Liquidaci�n Informal'
	=OPCIU()
	=OPIAC()
	=OPINM()
	=OPALQ()
	=OPCCL()
	=OPCCP()
	=OPINQ()
    DO CLIGRL WITH 5,47,'L�mites del Listado',.t.,"I"
    ON SELE POPU CLIGRL DO LLIQ
    ACTI POPU CLIGRL
    RELE POPU CLIGRL
CASE CTA_DIJO="Recibos Bancarios"
	=OPCIU()
	=OPIAC()
	=OPINM()
	=OPALQ()
	=OPCCL()
	=OPCCP()
	=OPINQ()
	respuesta='RECB#6#50#Gesti�n de Recibos Bancarios#3;
#\<Listado de Control Completo;
#Listado de \<Control un Inquilino;
#\<Modifica Recibo;
#\<Emite Todos los Recibos p/banco'
respuesta=respuesta+';
#E\<mite Un Recibo p/banco;
#\<Anula Recibo;
#-;
#\<Recepci�n Planilla de Cobro;
#Listados por \<Pantalla;
#Listados por \<Impresora'
	=DEFPOP()
	ON SELE POPU recb DO RECB
	ACTI POPU RECB
	RELE POPU RECB
CASE CTA_DIJO="Estado Patrimonial"
   DO CLIGRL WITH 17,47,'L�mites del Listado',.t.,"I"
   ON SELE POPU CLIGRL DO LPAT WITH POR_PAN
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
CASE CTA_DIJO='Reindexa'
	=OPCCL() .AND. XCCL()
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
