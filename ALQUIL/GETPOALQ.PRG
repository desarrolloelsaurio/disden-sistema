* ษอออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GETPOALQ.PRG  บ
* บ COMENTARIO    :               บ
* ศอออออออออออออออออออออออออออออออผ
FUNCTION GETPOALQ
IF GETENV("EQUIPO")="RAFULS"
   REST FROM ("F:\USR\"+GETENV("USERNAME")+"\POSICALQ.MEM") ADDI
ELSE
   IF GETENV("EQUIPO")="MICASA"
      REST FROM POSIC ADDI
   ENDIF
ENDIF
RETURN GETPATH()
