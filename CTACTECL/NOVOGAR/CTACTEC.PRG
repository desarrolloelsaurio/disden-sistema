* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : CTACTEC.PRG                               �
* � COMENTARIO    : DERIVA A OPERACIONES DE CUENTA CORRIENTE  �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                                  �
* � FECHA      : 12-08-93                                     �
* � HORA       : 06:19:03pm                                   �
* � COPYRIGHT  : 1993 by GREGORIO REINER                      �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
PARAMETER CTA_REN,CTA_COL
CT_DIJO=ALLTRIM(PROMPT())
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE CT_DIJO="Notas de D�bito"
   CTA_REN=IIF(TYPE("CTA_REN")="L",4,CTA_REN)
   CTA_COL=IIF(TYPE("CTA_COL")="L",20,CTA_COL)
   =OPVIA()
   =OPCIU()
   =OPPAG()
   =OPEMP()
   =OPCLI()
   =OPCCL()
   =OPFAC()
   respuesta='CTNADA#'+ALLTRIM(STR(CTA_REN))+"#"+ALLTRIM(STR(CTA_COL))+';
#Gesti�n de Notas de D�bito#3;
#Emite Nota de D�bito;
#-;
#\<Lista por Impresora;
#Lista \<por Pantalla;
#-;
#\<Anula'
   =DEFPOP()
   ON SELE POPU CTNADA DO NDEB WITH CTA_REN+2,CTA_COL-10
   ACTI POPU CTNADA
   RELE POPU CTNADA
CASE CT_DIJO="Notas de Cr�dito"
   CTA_REN=IIF(TYPE("CTA_REN")="L",4,CTA_REN)
   CTA_COL=IIF(TYPE("CTA_COL")="L",20,CTA_COL)
   =OPKAR()
   =OPMER()
   =OPVIA()
   =OPCIU()
   =OPPAG()
   =OPEMP()
   =OPCLI()
   =OPCCL()
   =OPMAR()
   =OPFAC()
   RESPUESTA='ALGO#'+;
     ALLTRIM(STR(CTA_REN))+;
     "#"+;
     ALLTRIM(STR(CTA_COL))+';
#Gesti�n de Notas de Cr�dito#3;
#Emite Nota de Cr�dito;
#-;
#\<Lista por Impresora;
#Lista \<por Pantalla;
#-;
#\<Anula'
   =DEFPOP()
   ON SELE POPU ALGO DO NCRE with ctA_REN+2,CTA_COL-10
   ACTI POPU ALGO
   RELE POPU ALGO
CASE CT_DIJO="Estado de Cuenta por Pantalla"
   =OPCIU()
   =OPCHEQ()
   =OPCCL()
   =OPCLI()
   CTA_REN=IIF(TYPE("CTA_REN")="N",CTA_REN,7)
   CTA_COL=IIF(TYPE("CTA_COL")="N",CTA_COL,20)
   =CCLGRL(CTA_REN,CTA_COL)
   ON SELE POPU NADA DO CTACTEC1 WITH .T.
   ACTI POPU NADA
   RELE POPU NADA
CASE CT_DIJO="Estado de Cuenta por Impresora"
   =OPCIU()
   =OPCHEQ()
   =OPCCL()
   =OPCLI()
   CTA_REN=IIF(TYPE("CTA_REN")="N",CTA_REN,7)
   CTA_COL=IIF(TYPE("CTA_COL")="N",CTA_COL,20)
   =CCLGRL(CTA_REN,CTA_COL)
   ON SELE POPU NADA DO CTACTEC1
   ACTI POPU NADA
   RELE POPU NADA
CASE CT_DIJO="Reimputa Cobros"
   =OPCCL()
   =OPCLI()
   respuesta='ALGO#9#20#Tipo de Reimputaci�n#3;
#Reimputaci�n \<Autom�tica;
#Reimputaci�n \<Manual'
   =DEFPOP()
   ON SELE POPU ALGO DO REIMP
   ACTI POPU ALGO
   RELE POPU ALGO
CASE CT_DIJO="Gesti�n de Saldos de Clientes"
   =OPCIU()
   =OPCLI()
   =OPCHEQ()
   =OPCCL()
   RESPUESTA='ALGO#10#20#Tipo de C�lculo de Saldo#3;
#Salda Cta. Cte (Clientes en \<0);
#Salda por \<Partida;
#\<Calcula Saldo Anterior;
#\<Borra Cliente Contado'
   =DEFPOP()
   ON SELE POPU ALGO DO SCCL0
   ACTI POPU ALGO
   RELE POPU ALGO
CASE ct_dijo="Pasa a Hist�rico"
   DO CLI
CASE CT_DIJO="Restaura Archivo Hist�rico"
   =OPCCLh()
   DO XCCLh
CASE CT_DIJO="Restaura el Archivo"
   =OPCHEQ()
   =OPCCL()
   DO XCCL
CASE CT_DIJO="Compacta el Archivo"
   if JANNAME#"DIS-DEN Odontolog�a"
      =OPCHEQ()
   ENDIF
   =OPCCL()
   DO XCCL WITH .T.
CASE CT_DIJO="Anula Cobros"
   =OPCIU()
   =OPGAS()
   =OPPAG()
   =OPEMP()
   =OPCLI()
   =OPCHEQ()
   =OPCCL()
   =OPCAJ()
   =OPFAC()
   =CCOB()
ENDCASE
RETURN MEN_LIN(BOTOM)
