*:*********************************************************************
*:
*: Procedure file: SINO.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:  Procs & Fncts: SINO()
*:
*:      Documented 04/05/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: sino.fnc
*-- Fecha   : 02/23/91 01:19pm
*-- Version : g. reiner
*-- Notas   : funcion que recibe el contenido de una variable l¢gica y devuelve
*--			  el Picture correspondiente SINO o NOSI
********************************************************************************
*!*********************************************************************
*!
*!       Function: SINO()
*!
*!      Called by: IMPREC.PRG                    
*!
*!*********************************************************************
FUNCTION sino
PARAMETER ripo
RETURN(IIF(ripo,"@M SI,NO","@M NO,SI"))

*: EOF: SINO.PRG
