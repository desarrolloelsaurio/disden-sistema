* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPMENS.PRG            บ
* บ COMENTARIO    : ABRE BASE DE MENSAJES บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
PARAMETER USNAM,ELOTRO,OPEXCL
IF !EMPTY(USNAM)
   =IIF(ELOTRO,CLOSDBF("MENS1"),CLOSDBF("MENS"))
   =MEN_LIN(ABA+"Mensajes")
   m.laletra=hayusr()
   IF !EMPTY(M.LALETRA)
      m.usnam=alltrim(m.usnam)
      =prxarea(.T.)
      IF ELOTRO
      IF OPEXCL
      USE (PATHALQ+"\usr\"+usnam+"\mensaLID") ALIAS MENS1 EXCL
      ELSE
      USE (PATHALQ+"\usr\"+usnam+"\mensaLID") ALIAS MENS1      
      ENDIF
      ELSE
      IF OPEXCL
      USE (PATHALQ+"\usr\"+usnam+"\mensaje") ALIAS MENS EXCL
      ELSE
      USE (PATHALQ+"\usr\"+usnam+"\mensaje") ALIAS MENS
      ENDIF
      ENDIF
      RETURN MEN_LIN(BOTOM)
   ELSE
      RETURN MEN_LIN(BOTOM) .AND. .F.
   ENDIF
ENDIF
RETURN MEN_LIN(BOTOM) .AND. .F.
