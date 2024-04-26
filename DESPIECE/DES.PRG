#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
PROCEDURE DES
ULPR=HORA_ULP(PROGRAM())
D_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE D_DIJO="Restaura el Archivo"
	DO XDES
CASE D_DIJO="Ingresa Despiece Av¡os"
   DO IMER_DO.SPR WITH .T.," Gesti¢n de Despiece Av¡os ",1,.T.
CASE D_DIJO="Ingresa Despiece Telas"
   DO IMER_DO.SPR WITH .T.," Gesti¢n de Despiece Telas ",2,.T.
CASE D_DIJO="Repite Despiece"
   RESPUESTA="REPDES#9#45#Repite Despiece#3;
#\<Completo;
#\<Telas;
#\<Av¡os;
#Ta\<lle"
   =DEFPOP()
   ON SELE POPU REPDES DO REPDES
   ACTI POPU REPDES
   RELE POPU REPDES
   ULPR=HORA_ULP(PROGRAM())
CASE D_DIJO="Reemplaza Despiece"
   RESPUESTA="REEMDES#9#45#Reemplaza Despiece#3;
#Una \<Tela;
#Un \<Av¡o"
   =DEFPOP()
   ON SELE POPU REEMDES DO REEMDES
   ACTI POPU REEMDES
   RELE POPU REEMDES
   ULPR=HORA_ULP(PROGRAM())
CASE D_DIJO="Borra Despiece"
   RESPUESTA="BORRDES#9#45#Borra Despiece#3;
#\<Un Art¡culo;
#Una \<Tela;
#Un \<Av¡o"
   =DEFPOP()
   ON SELE POPU BORRDES DO BORRDES
   ACTI POPU BORRDES
   RELE POPU BORRDES
   ULPR=HORA_ULP(PROGRAM())
CASE D_DIJO="Actualiza Av¡os"
   DO IMER_DO.SPR WITH .F.," Cambia Av¡os Despiece ",6,.T.
CASE D_DIJO="Actualiza Telas"
   DO IMER_DO.SPR WITH .F.," Cambia Telas Despiece ",7,.T.
CASE left(D_DIJO,7)="Listado"
   porpan=("Pantalla" $ d_dijo)
   RESPUESTA='nada#15#70#Tipo de Listado#3;
#\<Completo;
#\<Enumeraci¢n;
#Por \<'+tella+';
#Por \<'+abio+';
#Colores \<por Art¡culo'
   =DEFPOP()
   on sele popu nada DO LDESN with porpan
   acti popu nada
   rele popu nada
CASE  D_DIJO="Lista 2 despieces (Impresora)" .OR. ;
     D_DIJO="Lista 2 despieces (Pantalla)"
   porpan=("Pantalla" $ d_dijo)
   STORE NUL TO M.RESPUESTA
   IF !EMPTY(ELIMER("a Listar",-1,1))
      =WORKING()
      =DOTALK()
      =OPTELS()
      =OPAVIS()
      TT="Listado de los dos Despieces"+;
        crlf+;
        alltrim(mer.merca)+" - ("+;
        alltrim(mer.articulo)+")"
      ACLA=paip+;
        PADC("ARTICULO",10)+;
        PAIP+;
        IIF(PORPAN,"",PADC("DESCRIPCION",30)+PAIP)+;
        PADC("COD. AVIO.",20)+;
        PAIP+;
        PADC("COD. TELA",20)+;
        PAIP+;
        IIF(PORPAN,"",PADC("DESCRIPCION",40)+PAIP)+;
        PADC("CANT.",12)+;
        PAIP
      SELE DES
      =FLOCK() .OR. FLOK()
      TMP=GENTMP()
      SORT ON AVI TO (TMP) FOR ARTICULO=MER.ARTICULO
      UNLO IN DES
      =PRXAREA(.T.)
      USE (TMP) ALIAS TMP EXCL
      =UNTALK()
      =UNWORK()
      =LGRL2(PORPAN,"TMP","LDES00()","","LDESN")
      =OFF_TMP()
   ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)
  
PROCEDURE REPDES
ULPR=HORA_ULP(PROGRAM())
DE_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE DE_DIJO="Talle"
   DO IMER_DO.SPR WITH .F.," Repite Despiece ",10,.T.
CASE DE_DIJO="Telas"
   store '' to M.ARTIC_CLR
   DO IMER_DO.SPR WITH .F.," Repite Despiece Telas ",99,.T.
   IF !EMPTY(M.ARTIC_CLR)
      M.ARTIC_CLR1=M.ARTIC_CLR
      store '' to M.ARTIC_CLR
      DO IMER_DO.SPR WITH .F.," Repite Telas de "+alltr(M.ARTIC_CLR1)+" ",98,.T.
      IF !EMPTY(M.ARTIC_CLR)
         M.ARTIC_CLR2=M.ARTIC_CLR
         DO RDES.SPR WITH "T", m.artic_clr1, m.artic_clr2, " Repite Despiece Telas "
      ENDIF
   ENDIF
CASE DE_DIJO="Av¡os"
   store '' to M.ARTIC_CLR
   DO IMER_DO.SPR WITH .F.," Repite Despiece Av¡os ",99,.T.
   IF !EMPTY(M.ARTIC_CLR)
      M.ARTIC_CLR1=M.ARTIC_CLR
      store '' to M.ARTIC_CLR
      DO IMER_DO.SPR WITH .F.," Repite Av¡os de "+alltr(M.ARTIC_CLR1)+" ",98,.T.
      IF !EMPTY(M.ARTIC_CLR)
         M.ARTIC_CLR2=M.ARTIC_CLR
         DO RDES.SPR WITH "A", m.artic_clr1, m.artic_clr2," Repite Despiece Av¡os "
      ENDIF
   ENDIF
CASE DE_DIJO="Completo"
   store '' to M.ARTIC_CLR
   DO IMER_DO.SPR WITH .F.," Repite Despiece Completo ",99,.T.
   IF !EMPTY(M.ARTIC_CLR)
      M.ARTIC_CLR1=M.ARTIC_CLR
      store '' to M.ARTIC_CLR
      DO IMER_DO.SPR WITH .F.," Repite Completo de "+alltr(M.ARTIC_CLR1)+" ",98,.T.
      IF !EMPTY(M.ARTIC_CLR)
         M.ARTIC_CLR2=M.ARTIC_CLR
         DO RDES.SPR WITH "X", m.artic_clr1, m.artic_clr2," Repite Despiece Completo "
      ENDIF
   ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE REEMDES
ULPR=HORA_ULP(PROGRAM())
DE_DIJO=ALLTRIM(PROMPT())
=OPAVIS()
=OPTELS()
m.qual=0
DO CASE
CASE DE_DIJO="Una Tela"
   m.qual=2
CASE DE_DIJO="Un Av¡o"
   m.qual=1
ENDCASE
if !empty(m.qual)
   RESPUESTA="REEMDES2#11#57#Tipo de Reemplazo#3;
#\<Un Art¡culo;
#\<Todo el Arch."
   =DEFPOP()
   ON SELE POPU REEMDES2 DO REEMDES2
   ACTI POPU REEMDES2
   RELE POPU REEMDES2
endif
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE REEMDES2
ULPR=HORA_ULP(PROGRAM())
DE_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE DE_DIJO="Un Art¡culo"
   DO IMER_DO.SPR WITH .F.," Reemplaza Despiece ",IIF(QUAL=1,19,20),.T.
CASE DE_DIJO="Todo el Arch."
   DO RDESMAT.SPR WITH "T", IIF(QUAL=1,"A","T")
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE BORRDES
ULPR=HORA_ULP(PROGRAM())
DE_DIJO=ALLTRIM(PROMPT())
=OPAVIS()
=OPTELS()
DO CASE
CASE DE_DIJO="Un Art¡culo"
   RESPUESTA="BORRDES2#11#57#Tipo de Borrado#3;
#\<Completo;
#\<Telas;
#\<Av¡os"
   =DEFPOP()
   ON SELE POPU BORRDES2 DO BORRDES2
   ACTI POPU BORRDES2
   RELE POPU BORRDES2
CASE DE_DIJO="Una Tela"
   RESPUESTA="BORRDES3#11#57#Tipo de Reemplazo#3;
#\<Un Art¡culo;
#\<Todo el Arch."
   =DEFPOP()
   ON SELE POPU BORRDES3 DO BORRDES3
   ACTI POPU BORRDES3
   RELE POPU BORRDES3
CASE DE_DIJO="Un Av¡o"
   RESPUESTA="BORRDES4#11#57#Tipo de Reemplazo#3;
#\<Un Art¡culo;
#\<Todo el Arch."
   =DEFPOP()
   ON SELE POPU BORRDES4 DO BORRDES4
   ACTI POPU BORRDES4
   RELE POPU BORRDES4
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE BORRDES2
ULPR=HORA_ULP(PROGRAM())
DE_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE DE_DIJO="Completo"
   DO IMER_DO.SPR WITH .F.," Borra Despiece de un Art.(Completo)",14,.T.
CASE DE_DIJO="Telas"
   DO IMER_DO.SPR WITH .F.," Borra Despiece de un Art.(Telas)",15,.T.
CASE DE_DIJO="Av¡os"
   DO IMER_DO.SPR WITH .F.," Borra Despiece de un Art.(Av¡os)",16,.T.
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE BORRDES3
ULPR=HORA_ULP(PROGRAM())
DE_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE DE_DIJO="Un Art¡culo"
   DO IMER_DO.SPR WITH .F.," Borra Telas del Despiece ",18,.T.
CASE DE_DIJO="Todo el Arch."
   DO BDESMAT.SPR WITH "T", "T"
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE BORRDES4
ULPR=HORA_ULP(PROGRAM())
DE_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE DE_DIJO="Un Art¡culo"
   DO IMER_DO.SPR WITH .F.," Borra Av¡os del Despiece ",17,.T.
CASE DE_DIJO="Todo el Arch."
   DO BDESMAT.SPR WITH "T", "A"
ENDCASE
RETURN MEN_LIN(BOTOM)
