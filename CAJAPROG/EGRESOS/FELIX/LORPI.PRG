* 浜様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LORPI.PRG                  �
* � COMENTARIO    : LISTADO DE ORDENES DE PAGO �
* 麺様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                   �
* � FECHA      : 11-01-93                      �
* � HORA       : 01:50:15pm                    �
* � COPYRIGHT  : 1993 by GREGORIO REINER       �
* 藩様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
PARAMETER DEPROVE
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   STOR NUL TO CASOS
   STORE "" TO M.LINEA,M.ACLA
   =CABPRI()
   _PCOPIES=1
   PRINTJOB
      =CABPRI1()
      ?
      ? janname
      ?
      SELE ORP
      ? PADL("ORDEN DE PAGO N� "+ZERO(ORP.NUMERO,8),80)
      ? PADL(DATECOMP(ORP.FECHAOP),80)
      ?
      ?
      ? "Orden de Pago N�:"
      ?? ZERO(ORP.NUMERO,8) AT 40
      IF DEPROVE
         ?
         ? "VIAJE:"
         ?? STR(CCP.NUMERO,10) AT 40
         ? "PROVEEDOR:"
         ?? PER.CODCLI AT 40
         ?  PER.CLIENTE AT 40
         ? "FACTURA:"
         ?? CCP.FACTURA AT 40
         ? "DETALLE:"
         ?? CCP.DETALLE AT 40
         ?
      ENDIF
      ?
      ? "Banco           :"
      ?? SAYMIX(ORP.BANCO,"BANCOD") AT 40
      ?  MIX.TEXTO2 AT 40
      ? "N� de Cheque    :"
      ?? orp.nint at 40
      ? "Monto           :"
      ?? trans(orp.cheques,"9,999,999.99") at 40
      ? "Detalle         :"
      ?? orp.detalle at 40

      ? "Usuario         :"
      ?? orp.usuario at 40
      ?
      ?
      ? padc("Firmado",80)
   ENDP
   =FINIMP()
   =IAUD("O.P. N� "+ZERO(ORP.NUMERO,8))
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
