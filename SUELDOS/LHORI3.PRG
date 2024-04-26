********************************************************************************
*-- Programa: lhori3.prg
*-- Fecha   : 03/08/91 06:22pm
*-- Version : g. reiner
*-- Notas   : decide los l¡mites del listado
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo=BAR()-10
DO CASE
CASE BAR()=1
   STORE '.t.' TO fisc
   ttl1='Todos los Empleados'
      sele emp
      set order to
      sele liq
      set rela to empleado into emp
      if ordlis=1
         index on emp->apynom+STR(REGISTRO,4) TO TMP1 FOR filtcon=bsc .AND. imprime
      else
	 index on legajo+STR(REGISTRO,4) TO TMP1 FOR filtcon=bsc .AND. imprime
      endif
   DO lhori4
      SELE EMP
      SET ORDER TO ORDLIS
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicat(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Categor¡a:'+ALLTRIM(cat->categoria)
      @ 24,0 SAY PADC(" Indexando el Archivo - Espere por Favor ",80,"*") colo sche 19
      sele emp
      set order to
      sele liq
      set rela to empleado into emp
      if ordlis=1
         index on emp->apynom+STR(REGISTRO,4) TO TMP1 FOR emp->cat=xcos .and. filtcon=bsc .AND. imprime
      else
	 index on legajo+STR(REGISTRO,4) TO TMP1 FOR emp->cat=xcos .and. filtcon=bsc .AND. imprime
      endif
      DO lhori4
      SELE EMP
      SET ORDER TO ORDLIS
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicon(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Convenio:'+ALLTRIM(con->convenio)
      @ 24,0 SAY PADC(" Indexando el Archivo - Espere por Favor ",80,"*") colo sche 19
      sele emp
      set order to
      sele liq
      set rela to empleado into emp
      if ordlis=1
         index on emp->apynom+STR(REGISTRO,4) TO TMP1 FOR emp->CON=xcos .and. filtcon=bsc .AND. imprime
      else
	 index on legajo+STR(REGISTRO,4) TO TMP1 FOR emp->CON=xcos .and. filtcon=bsc .AND. imprime
      endif
      DO lhori4
      SELE EMP
      SET ORDER TO ORDLIS
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF eliccos(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Centro de Costos:'+ALLTRIM(ccos->cencos)
      @ 24,0 SAY PADC(" Indexando el Archivo - Espere por Favor ",80,"*") colo sche 19
      sele emp
      set order to
      sele liq
      set rela to empleado into emp
      if ordlis=1
         index on emp->apynom+STR(REGISTRO,4) TO TMP1 FOR emp->CCOS=xcos .and. filtcon=bsc .AND. imprime
      else
	 index on legajo+STR(REGISTRO,4) TO TMP1 FOR emp->CCOS=xcos .and. filtcon=bsc .AND. imprime
      endif
      DO lhori4
      SELE EMP
      SET ORDER TO ORDLIS
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliesp(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Especialidad:'+ALLTRIM(esp->especiali)
      @ 24,0 SAY PADC(" Indexando el Archivo - Espere por Favor ",80,"*") colo sche 19
      sele emp
      set order to
      sele liq
      set rela to empleado into emp
      if ordlis=1
         index on emp->apynom+STR(REGISTRO,4) TO TMP1 FOR emp->ESP=xcos .and. filtcon=bsc .AND. imprime
      else
	 index on legajo+STR(REGISTRO,4) TO TMP1 FOR emp->ESP=xcos .and. filtcon=bsc .AND. imprime
      endif
      DO lhori4
      SELE EMP
      SET ORDER TO ORDLIS
   ENDIF
ENDCASE
RETURN
