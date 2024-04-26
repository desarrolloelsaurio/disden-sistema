********************************************************
*-- Programa: CNX.prg
*-- Fecha   : 01-18-92 09:26am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE DATOS DE UNIDADES
********************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
CN_DIJO=ALLTRIM(PROMPT())
ulpr=PROGRAM()
=CABPAN1()
SELE CNS
DO CASE
CASE CN_DIJO="Ingreso Manual"
   DO WHILE .T.
      STORE NUL TO RESPUESTA
      IF EMPTY(ELICNS(" ",-1,1))
         EXIT
      ELSE
         DO ICNX
      ENDIF
   ENDDO
CASE CN_DIJO="Ingreso por Rangos"
   DO WHILE .T.
      STORE nul TO respuesta
      IF empty(elicns(" ",-1,1))
         EXIT
      else
         DO gCNX
      endif
   ENDDO
CASE CN_DIJO="Corrige Propietario"
   DO WHILE .T.
      STORE nul TO respuesta
      IF EMPTY(elicns(" a Corregir",-1,1))
         EXIT
      ELSE
        DO CCNXP.SPR
      ENDIF
   ENDDO
CASE CN_DIJO="Corrige"
   DO WHILE .T.
      STORE nul TO respuesta
      IF EMPTY(elicns(" a Corregir",-1,1))
         EXIT
      ELSE
        DO CCNX
      ENDIF
   ENDDO
CASE BAR()="Borra"
   DO WHILE .T.
      STORE nul TO respuesta
      IF empty(elicns(" a Borrar",-1,1))
         EXIT
      ELSE
         respuesta='nada#16#20#Tipo de Borrado#3#Por \<Unidades#\<Todas las Unidades del Consorcio'
         =defpop()
         ON SELE POPU nada DO BCNX
         ACTI POPU nada
      ENDIF
   ENDDO
   RELE POPU nada
CASE BAR()="Lista por Impresora"
   respuesta='nada#10#20#Tipo de Listado#3#Un \<Consorcista#\<Todo el Consorcio'
	=DEFPOP()
   ON SELE POPU nada DO LCNX
   ACTI POPU nada
   RELE POPU nada
CASE BAR()="Lista por Pantalla"
   respuesta='nada#10#20#Tipo de Listado#3#Un \<Consorcista#\<Todo el Consorcio'
	=DEFPOP()
   ON SELE POPU nada DO LCNX with .t.
   ACTI POPU nada
   RELE POPU nada
CASE BAR()="Posici¢n de Ventanas"
   DO vCNX
CASE BAR()="Restaura el Archivo"
   DO xCNX
ENDCASE
ulpr=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
