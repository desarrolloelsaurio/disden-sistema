************************************************
*-- Programa: OPAUD.PRG
*-- Fecha   : 06/06/91 11:51am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE AUDITORIA
*-- Modificaci¢n GOYO (area 24)
************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
=MEN_LIN(ABA+IIF(_WINDOWS,"Auditoría",'Auditor¡a'))
=GETDBF('AUDITOR',.F.,"AUD",24)
RETURN MEN_LIN(BOTOM)
