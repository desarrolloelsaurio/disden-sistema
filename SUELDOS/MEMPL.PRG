*:*********************************************************************
*:
*:        Program: MEMPL.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: BUEMPL.PRG                    
*:
*:          Calls: MINUS()        (function  in ?)
*:
*:      Documented 04/25/91 at 10:19               FoxDoc  version 2.01
*:*********************************************************************
******************************************************************************
*-- Programa: MEMPL.PRG
*-- Fecha   : 03/11/90 / 20:29:05
*-- Version : G. REINER - GENERADOR
*-- Notas   : MUESTRA DATOS PERSONALES DE LOS EMPLEADOS
********************************************************************************
PARAMETER cosa
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 1,15 TO 22,71 TITL " Empleados - "+cosa+" Datos Personales " SHAD COLO SCHE 8
me1=" Empleados - "+cosa+" Datos Personales "
ACTI WIND win
psc=minus(ALLTRIM(m->apynom))
m->apy=SUBSTR(m->apynom,psc)+SPACE(30)
m->apynom=LEFT(m->apynom,psc-1)+SPACE(20)
RELE psc
@ 1,1 SAY "N§ de Legajo" COLOR SCHE 3
@ 2,1 SAY "Apellido del Empleado" COLOR SCHE 3
@ 3,1 SAY "Nombre del Empleado" COLOR SCHE 3
@ 4,1 SAY "Domicilio" COLOR SCHE 3
@ 5,1 SAY "Localidad" COLOR SCHE 3
@ 6,1 SAY "Tel‚fono" COLOR SCHE 3
@ 7,1 SAY "Tipo de Documento" COLOR SCHE 3
@ 7,33 SAY "N§" COLOR SCHE 3
@ 8,1 SAY "Fecha de Nacimiento" COLOR SCHE 3
@ 9,1 SAY "Fecha de Ingreso" COLOR SCHE 3
@ 9,33 SAY "Aniversario" COLO SCHE 3
@ 10,1 SAY "N§ de Jubilaci¢n" COLOR SCHE 3
@ 11,1 SAY "Nacionalidad" COLOR SCHE 3
@ 12,1 SAY "Puntaje" COLOR SCHE 3
@ 13,1 SAY "Centro de Costos" COLOR SCHE 3
@ 15,1 SAY "Categor¡a" COLOR SCHE 3
@ 14,1 SAY "Convenio" COLOR SCHE 3
@ 16,1 SAY "Especialidad" COLOR SCHE 3
@ 17,1 SAY "Empresa" COLOR SCHE 3
@ 18,1 SAY "Liquida ? " COLOR SCHE 3
@ 18,30 SAY "Paga S. Fam." COLOR SCHE 3
@ 1,24 GET m->legajo;
   PICTURE "@NNNNNNNNNN"
@ 2,24 GET m->apynom;
   PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
@ 3,24 GET m->apy;
   PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
@ 4,24 GET m->domicilio;
   PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
@ 5,24 GET m->localidad;
   PICTURE "XXXXXXXXXXXXXXXXXXXX"
@ 6,24 GET m->telefono;
   PICTURE "XXXXXXXXXXXXXXX"
@ 7,24 GET tdoc[m->tipodoc]
@ 7,40 GET m->nrodoc;
   PICTURE "99.999.999"
@ 8,24 GET m->fechanac
@ 9,24 GET m->fechaing
@ 9,45 GET m->fechaani
@ 10,24 GET m->nujub;
   PICTURE "XXXXXXXXXXXXXXXXXXXX"
@ 11,24 GET m->nacion
@ 12,24 GET m->puntaje;
   PICTURE "999"
GOTO ccos IN ccos
@ 13,24 GET ccos->cencos
GOTO cat IN cat
@ 15,24 GET cat->categoria
GOTO con IN con
@ 14,24 GET con->convenio
GOTO jan IN jan
GOTO esp IN esp
@ 16,24 GET esp->especiali
jn=ALLTRIM(jan->empresa)
@ 17,24 GET jn
lq=IIF(noliq,'SI','NO')
@ 18,24 GET lq
@ 18,50 GET pagsal
CLEAR GETS
RELE jn,lq,tpi
RETURN
*: EOF: MEMPL.PRG
