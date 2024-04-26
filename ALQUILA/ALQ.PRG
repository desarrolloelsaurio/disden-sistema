* ษออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ALQ.PRG                บ
* บ COMENTARIO    : MENU DE ALQUILERES     บ
* ฬออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER               บ
* บ FECHA      : 11-23-93                  บ
* บ HORA       : 08:06:27pm                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER   บ
* ศออออออออออออออออออออออออออออออออออออออออผ
PARAMETER AFUTURO
PRIVATE AFUTURO
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM

ULPR=PROGRAM()
A_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
=OPCIU()
=OPINM()
=OPPRP()
=OPGAR()
=IIF(AFUTURO,OPALQFUT(.F.),OPALQ())
DO CASE
CASE A_DIJO="Cargos Por Gestiขn"
   =OPCLQ()
   DO CLQ
CASE A_DIJO="Modifica Descuento"   
   IF ESJEFE(1)
   DO ALQ_MON.SPR WITH .F.,.F.,"ALQ"," Modifica Descuentos ",.T.,.T.,.T.,.T.,.F.,.T.
   ELSE
   =IAUDI()
   ENDIF
CASE A_DIJO="Datos Personales"
   DO ALQ_PER.SPR WITH .F.,.F.,"ALQ"," Alta Nuevo Alquiler ",.T.,.T.
CASE A_DIJO="Datos Contractuales"
   DO ALQ_CON.SPR WITH .F.,.F.,"ALQ"," Datos Contractuales ",.T.,.T.,.T.
CASE A_DIJO="Datos Monetarios"
   DO ALQ_MON.SPR WITH .F.,.F.,"ALQ"," Datos Monetarios ",.T.,.T.,.T.,.T.
CASE A_DIJO="Resumen"
   DO ALQ_RESU.SPR
CASE A_DIJO="Autoriza"
   DO ALQ_AUT.SPR WITH .F.,.F.,"ALQ"," Autoriza / Desautoriza ",.T.,.T.
CASE A_DIJO="Emite recibo bancario"
   DO ALQ_REC.SPR WITH .F.,.F.,"ALQ"," Emite Recibo Bancario ",.T.,.T.
CASE A_DIJO="Fin de Contrato"
   IF !AFUTURO
      DO ALQ_FIN.SPR WITH .F.,.F.,"ALQ"," Fin de Contrato ",.T.,.T.,.T.,.T.,.T.
   ELSE
      =CARTEL("NO ES POSIBLE",;
        "DAR POR FINALIZADO UN CONTRATO",;
        "QUE NO HA COMENZADO",;
        "TOQUE [ENTER] PARA CONTINUAR")
   ENDIF
CASE A_DIJO='Alquileres a Futuro' .OR. ;
     A_DIJO="Consulta por Inquilino"
   STORE .F. TO OK
   respuesta='ALQFUT#5#40#Gestiขn de Alquileres a Futuro#3;
#Datos \<Personales;
#Datos \<Contractuales;
#Datos \<Monetarios;
#\<Autoriza'
   =DEFPOP()
   ON SELE POPU ALQFUT DO ALQ WITH .T.
   IF LEFT(A_DIJO,1)="C"
      STORE NUL TO RESPUESTA
      IF ELIINQ("a Listar",-1,1)
         SELE ALQ
         SET ORDER TO TAG CODINM IN ALQ
         SELE INM
         SET ORDER TO TAG CODINM
         SET RELA TO CODINM INTO ALQ
         TMP=GENTMP()
         SORT ON FECHAOP ;
           TO (TMP) ;
           FOR ALQ.CODCLI=PER.CODCLI
         SELE INM
         USE
         USE (TMP) ALIAS INM EXCL
         INDEX ON CODINM TAG CODINM
         SET ORDER TO TAG CODINM
         STORE .T. TO OK
      ENDIF
   ELSE
      STORE .T. TO OK
   ENDIF
   ACTI POPU ALQFUT
   RELE POPU ALQFUT
   =IIF(LEFT(A_DIJO,1)="C",REOPINM(),REOPFUT(.F.))
CASE LEFT(A_DIJO,23)='Listados de Control por'
   respuesta='CCRAF#4#43#Listados de Control de Alquileres#3;
#Fincas \<OK;
#Fincas con \<Problemas;
#Fincas sin \<Contrato;
#\<Vencimiento de Contrato'
   =DEFPOP()
   ON SELE POPU CCRAF DO LALQCTRL WITH "ntal" $ A_DIJO
   ACTI POPU CCRAF
   RELE POPU CCRAF
ENDCASE
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
