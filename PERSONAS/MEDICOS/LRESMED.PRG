* 浜様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LRESMED.PRG                �
* � COMENTARIO    : LISTA RESUMENES DE MEDICOS �
* 麺様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                   �
* � FECHA      : 11-18-94                      �
* � HORA       : 10:03:42am                    �
* � COPYRIGHT  : 1994 by GREGORIO REINER       �
* 藩様様様様様様様様様様様様様様様様様様様様様夕
PROCEDURE LRESMED
#DEFINE CRLF CHR(13)+CHR(10)                   && CRLF
STORE "" TO M.LISMED
M.MESANIO=MESANIO(" Mes Tope a Listar ",.t.,.t.)
m.x_mes=val(left(m.mesanio,2))
m.x_anio=val(right(m.mesanio,4))
if confirma("Listar "+qmes(m.x_mes)+" de "+str(m.x_anio,4),.t.,20,10)
   STORE NUL TO M.RESPUESTA,PUNTERO
   DIME ELMED[1]
   STORE "!!" TO ELMED[1]
   DO WHILE !EMPTY(ELIMED("a Listar",-1,1))
      =MEN_LIN("[ESC] para Salir")
      IF EMPTY(ASCAN(ELMED,PER.CODCLI))
         M.PUNTERO=M.PUNTERO+1
         DIME ELMED[M.PUNTERO]
         ELMED[PUNTERO]=PER.CODCLI
         M.LISMED=M.LISMED+CRLF+PER.CLIENTE
         =POPCARTE(M.LISMED,.T.)
      ELSE
         WAIT "MEDICO YA SELECCIONADO" WIND
      ENDIF
      STORE NUL TO RESPUESTA
   ENDDO
   IF EMPTY(M.PUNTERO)
      =NOSELEC("MEDICO")
   ELSE
      =OPMUT()
      =OPPRA()
      =OPLIQ()
      IF CONFIRMA("Emitir los res�menes pedidos",.t.,20,1)
         FOR PU_A=1 TO PUNTERO
            DO LRESMEDI WITH ELMED[PU_A]
         NEXT
      ENDIF
      =RELEWIN("POPCARTE")
   ENDIF
ENDIF
RETURN RELEWIN("WIN") .AND. MEN_LIN(BOTOM)
