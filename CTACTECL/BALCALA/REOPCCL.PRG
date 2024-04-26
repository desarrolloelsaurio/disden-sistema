**********************************************************
*-- Programa: REOPCCL.PRG
*-- Fecha   : 07/30/91 06:22pm
*-- Version : G. REINER
*-- Notas   : REABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES
*********************************************************
FUNCTION REOPCCL
USE IN CCL
=OPCCL() WITH JANNRO
RETURN .T.
