*************************************
*-- Programa: XCCP.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE CCPTA
**************************************
PROCEDURE XCCP
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG() .AND. FUERARED()#27
   DO OPCCP
   SELE CCP
   =men_lin('Reindexando el Archivo de Cuenta Corriente de Propietarios')
   =FLOCK("CCP") .OR. FLOK("CCP")
   =DOTALK()
   =OPCCPX()
   Index on PROCOD tag PROCOD
          Index  ON FECHAOP TAG FECHAOP  
           Index ON NUMERORE TAG NUMERORE   
           Index ON LEFT(DETALLE,7)+CODINM TAG ALQUILER   
           Index ON STR(R_MES,2)+STR(R_ANIO,4) TAG TIEMPO
   TX='CREA INDICE '
   =REOPCCP()
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
