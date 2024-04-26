*:*********************************************************************
*:
*:        Program: BUEMPL.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CRETR.PRG                     
*:
*:          Calls: INFIC2.PRG
*:               : MEMPL.PRG
*:
*:      Documented 04/25/91 at 10:19               FoxDoc  version 2.01
*:*********************************************************************
*****************************************************************
*-- Programa: Buempl.PRG
*-- Fecha   : October 12, 1990
*-- Version : G. REINER
*-- Notas   : DERIVA A BUSQUEDA DE empleados
*****************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,'Û')
elige=BAR()
respuesta=''
DO infic2 WITH ' '+ALLTRIM(PROMPT())+' a Buscar ','XXXXXXXXXXXXXXX',PROMPT()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
IF respuesta<>SPACE(LEN(respuesta))
   DIMENSION pt(5)
   pt(1)='legajo'
   pt(2)='apynom'
   pt(3)='domicilio'
   pt(4)='localidad'
   pt(5)='telefono'
   respuesta=ALLTRIM(respuesta)
   r1=PROPER(respuesta)
   r2=LOWER(respuesta)
   r3=UPPER(respuesta)
   SELE emp
   endonde=pt(elige)
   ACTI SCREEN
   @ 24,0 SAY PADC('[ESC] para Men£',80,'*')
   SELE emp
   SCAN FOR r1 $ &endonde .OR. r2 $ &endonde .OR. r3 $ &endonde
      SCATTER MEMVAR
      DO mempl WITH 'Encontr‚'
      DO WHILE INKEY()=0
      ENDDO
      RELE WIND win
      IF LASTKEY()=27
         EXIT
      ENDIF
   ENDSCAN
   RELE legajo,apynom,domicilio,localidad,telefono,tipodoc,nrodoc,fechanac,fechaing,fechaegr,nujub,nacion,puntaje,noliq,ccos,cat,CONV,jan,texto,me1,apy,pct
   RELE r1,r2,r3,endonde
   @ 24,0 SAY SPACE(80)
ENDIF
RETURN

*: EOF: BUEMPL.PRG
