********************************************************************************
*-- Programa: XCCI.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE CTA CTE IMPUESTOS
********************************************************************************
PROCEDURE XCCI
PARAMETER COMPACTA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
Ulpr=hora_ulp(PROGRAM())
IF CHEQSEG()
   SELE CCI
   =men_lin('Reindexando el Archivo de Cta Cte Impuestos')
   =FLOCK("CCI") .or. FLOK("CCI")
   =dotalk()
   =opCCIx(JANNRO)
   SELE CCI
   IF COMPACTA
      SET ORDER TO
      PACK
   ENDIF
   Index on CODCLI TAG CODCLI
   Index on FECHAOP TAG FECHAOP
   Index on NUMERE TAG NUMERE
   Index on NUMERE+PERIO TAG CONTROL
   Index on NUMERE+PERIO+LEFT(DETALLE,3) TAG INDICE
   =reopCCI()
   =untalk()
   =iaud('Cta Cte Imp')
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
