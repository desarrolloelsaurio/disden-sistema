* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCPRP.PRG             บ
* บ COMENTARIO    :                       บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 06-26-94                 บ
* บ HORA       : 11:56:02am               บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE PAIP   "|"                               && PAIP

PARAMETER PORPAN,SEGUNDA
ULPR=HORA_ULP(PROGRAM())
PR_DIJO=ALLTRIM(PROMPT())
DO CASE
case pr_dijo='Un Propietario' .or. SEGUNDA
   store nul to respuesta
   if eliprp("a Listar",-1,1)
      M.FECINI=INFEC("WIN","Vencim. ")
      IF !EMPTY(M.FECINI)
         =working()
         =dotalk()
         fisc="prpcod='"+per.codcli+"'"
         tt="Rasumen de Cuenta"+;
           crlf+;
		 "Operaciones con vencimiento hasta el "+datecomp(M.FECINI)+;
		 CRLF+;
           alltrim(per.cliente)+" ("+;
           alltrim(per.codcli)+")"
         CANT_MAX=9
         DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
         TEXTO[1,1]='PROPIETARIO'
         TEXTO[2,1]='F. OPERACION'
         TEXTO[3,1]='F. VENC.'
         TEXTO[4,1]='DETALLE'
         TEXTO[5,1]='COMPROBANTE'
         TEXTO[6,1]='ORIGEN'
         TEXTO[7,1]='MONTO'
         TEXTO[8,1]="AU"
         TEXTO[9,1]='INMUEBLE'

         TEXTO[1,2]=IIF(PORPAN,20,30)
         TEXTO[2,2]=8
         TEXTO[3,2]=8
         TEXTO[4,2]=30
         TEXTO[5,2]=20
         TEXTO[6,2]=20
         TEXTO[7,2]=IIF(PORPAN,XACDIGI,XACDIGI*3+2)
         TEXTO[8,2]=2
         TEXTO[9,2]=IIF(PORPAN,20,40)

         TMP=GENTMP()
         SELE CCP         
         =FLOCK() .OR. FLOK()
         SORT ON FECHAVE ;
           FOR PROCOD=PER.CODCLI .AND. ;
           FECHAVE<=M.FECINI ;
           TO (TMP)
         USE (TMP) ALIAS CCP EXCL
         =untalk()
         =unwork()
         STORE .T. TO HABILITADO
         STORE .F. TO HABILITADO[1],VARIABLE[1]
         DO WHILE CFGFAC()
            STORE .F. TO HABILITADO[1],VARIABLE[1]
            STORE "" TO M.LINEA,M.ACLA
            STORE NUL TO M.CASOS,M.SALDO,M.DEBE,M.HABER
            IF !PORPAN
               TEXTO[7,1]=PADC("DEBE",XACDIGI)+;
                 PAIP+;
                 PADC("HABER",XACDIGI)+;
                 PAIP+;
                 PADC("SALDO",XACDIGI)
            ENDIF
            ACLA=HAZ_ACLA()
            M.LINEA=REPL("=",LEN(ACLA))
            IF PORPAN
               DO LCPRPP
            ELSE
               DO LCPRPI
            ENDIF
            STORE .T. TO HABILITADO
            STORE .F. TO HABILITADO[1],VARIABLE[1]
            TEXTO[7,1]='MONTO'
         ENDDO
         =REOPCCP()
      ENDIF
   ELSE
      =NOSELEC("PROPIETARIO")
   ENDIF
case pr_dijo="Resumen por Propietario"
ENDCASE
RETURN MEN_LIN(BOTOM)
