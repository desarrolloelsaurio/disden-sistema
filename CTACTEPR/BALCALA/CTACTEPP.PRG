*******************************
*-- Programa: CTACTEPP.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : R. 'EL BATA' /GOYO
*-- Notas   : MENU VARIOS
*******************************
C_DIJO=ALLTRIM(PROMPT())
=cabpan1()
DO OPINM
DO CASE
CASE C_DIJO="Ajuste Cta Cte a Favor del Propietario"
   IF ESJEFE()
      =OPCIU()
      =OPCCP()
      =OPPRP()
      =ICREP(.T.)
   ELSE
      =IAUDI()
   ENDIF
CASE C_DIJO="Ajuste Cta Cte a Favor de la Administraci¢n"
   IF ESJEFE()
      =OPCCP()
      =OPPRP()
      =OPCIU()
      =ICREP()
   ELSE
      =IAUDI()
   ENDIF
CASE BAR()=4
   * CALCULA SALDO
   =CSALP()
CASE BAR()=7 .OR. BAR()=6
   ELBAR=BAR()
	=OPCIU()
   DO OPINM
   DO OPCCP
   DO OPPRP
   respuesta='nada#13#53#Estado de Cuenta de Propietarios;
#3;
#\<Un Propietario;
#\<Resumen por Propietario'
   =defpop()
   ON SELE POPU nada DO lcprp with ELBAR=6
   ACTI POPU nada
   RELE POPU nada
CASE C_DIJO='Reindexa'
	=OPCCL()
   DO XCCP
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
