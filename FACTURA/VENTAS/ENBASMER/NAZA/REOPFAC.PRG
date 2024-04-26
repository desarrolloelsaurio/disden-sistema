********************************************************************************
*-- Programa: REOPFAC
*-- Fecha   : 05-27-92 11:56am
*-- Version : G. REINER
*-- Notas   : REABRE ARCHIVO FACTURAS
*--           EL PROGRAMA SE REALIZA PARA EVITAR CONFLICTOS ENTRE LA APERTURA
*--           DE ARCHIVOS CON PARAMETROS JANNRO Y LA APERTURA SIN.
********************************************************************************
FUNCTION REOPFAC
USE IN FAC
use IN FAX
=OPFAC()
RETURN .T.
