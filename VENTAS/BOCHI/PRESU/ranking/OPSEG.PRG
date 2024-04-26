**********************************************
*-- Programa: opseg.prg
*-- Fecha   : 06/06/91 11:51am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE AUDITORIA
*-- Modificaci¢n GOYO (area 23)
**********************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
=MEN_LIN(ABA+'Seguridad')
=GETDBF('SEGURIDA','PROGRAMA','SEG',23)
RETURN MEN_LIN(botom)
