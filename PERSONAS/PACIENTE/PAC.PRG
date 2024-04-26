************************************************
*-- Programa: PAC.PRG
*-- Fecha   : 04-23-94
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE PACICOS
*-- Modificaci¢n GOYO 09-10-92 06:33pm
************************************************
PA1_DIJO=ALLTRIM(PROMPT())
RELE PAC_TIPO
DO CASE
CASE PA1_DIJO='Legajo'
   PAC_TIPO="J"
CASE PA1_DIJO='Datos Generales'
   PAC_TIPO=.F.
CASE PA1_DIJO='Datos Espec¡ficos'
   PAC_TIPO="E"
CASE PA1_DIJO='Pr cticas de Pacientes'
   PAC_TIPO="P"
CASE PA1_DIJO='Agrega Pr ctica'
   PAC_TIPO="A"
ENDCASE
=OPCIU()
DO OPMUT
DO OPPAC
IF TYPE("PAC_TIPO")#"U"
ulpr=PROGRAM()
=cabpan1()
sele PER
EXTERNAL ARRAY CONTENIDO,TEXTO
DIME TEXTO[10],CONTENIDO[9]
TEXTO[1]='Paciente'
TEXTO[2]='Paciente'
TEXTO[3]='Pacientes'
*[4] VA DESPUES
TEXTO[5]='Fecha de Nacimiento'
TEXTO[6]='Domicilio Postal'
TEXTO[7]='Legajo'
TEXTO[10]='Apellido y Nombre'
TIPO_PER="PACIENTE"

CONTENIDO[1]='@!'
CONTENIDO[2]=9
CONTENIDO[3]='PACCOD'
CONTENIDO[4]='PACIENTE'
CONTENIDO[5]='P'
CONTENIDO[6]=.F.
CONTENIDO[7]=.T.
CONTENIDO[8]=.F.
CONTENIDO[9]='PACDNI'

TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
IF EMPTY(PAC_TIPO)
   DO IPER.SPR WITH .T.
ELSE
   IF PAC_TIPO="J"
      DO IPER_LEG.SPR
   ELSE
      IF PAC_TIPO="P"
         DO OPPRA
 		 DO OPLIQ
         DO IPAC_PRA.SPR
         =OFF_TMP()
      ELSE
      IF PAC_TIPO="A"
         DO OPPRA
 		 DO OPLIQ
         DO IPAC_PR1.SPR WITH .F.,.T.
         =OFF_TMP()
      ELSE
         DO IPER_PAC.SPR
         ENDIF
      ENDIF
   ENDIF
ENDIF
ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)
