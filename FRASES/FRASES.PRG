CLOSE DATA
SET SAFE OFF
SET TALK OFF
SET DATE FREN
CLEA
ON KEY LABEL F1 DO AUT1
ON KEY LABEL F2 DO AUT2
ON KEY LABEL F3 DO PER1
ON KEY LABEL F4 DO PER2
ON KEY LABEL F5 DO LIB1
ON KEY LABEL F6 DO LIB2
ON KEY LABEL F7 DO COL1
ON KEY LABEL F8 DO COL2

ON KEY LABEL CTRL+A DO BROAUT
ON KEY LABEL ALT+A  DO LISAUT
ON KEY LABEL CTRL+L DO BROLIB
ON KEY LABEL ALT+L  DO LISLIB1
ON KEY LABEL ALT+K  DO LISLIB2
ON KEY LABEL CTRL+E DO BROPER
ON KEY LABEL ALT+E  DO LISPER
ON KEY LABEL CTRL+C DO BROCOL
ON KEY LABEL ALT+C  DO LISCOL
ON KEY LABEL CTRL+B DO BROBIO
ON KEY LABEL CTRL+X DO FINAL
ON KEY LABEL CTRL+R RETURN TO MAIN
ON KEY LABEL ALT+R A=REPEAT()
ON KEY LABEL CTRL+S A=BUSCA()
ON KEY LABEL ALT+I DO INFO
ON KEY LABEL END GO BOTT
ON KEY LABEL HOME GO TOP
ON KEY LABEL INS DO INSERTA

DO OPAUT
DO OPLIB
DO OPPER
DO OPBIO
=OPMIX()

* BROWSES
DO BROAUT WITH .T.
DO BROPER WITH .T.
DO BROCOL WITH .T.
DO BROLIB WITH .T.

DO MAIN
DO FINAL
RETURN

PROCEDURE FINAL
CLEA READ
CLOSE ALL
RELE WIND AUT
RELE WIND BIO
RELE WIND LIB
RELE WIND PER
RELE WIND MIX

ON KEY LABEL F1
ON KEY LABEL F2
ON KEY LABEL F3
ON KEY LABEL F4
ON KEY LABEL F5
ON KEY LABEL F6
ON KEY LABEL F7
ON KEY LABEL F8
ON KEY LABEL CTRL+A
ON KEY LABEL CTRL+L
ON KEY LABEL CTRL+E
ON KEY LABEL CTRL+C
ON KEY LABEL CTRL+B
ON KEY LABEL CTRL+X
ON KEY LABEL END
ON KEY LABEL HOME
ON KEY LABEL INS
QUIT
RETURN

PROCEDURE AUT2
AL=ALIAS()
SELE AUT
SET ORDER TO TAG AUTOR
=SACUDE()
SELE (AL)
RETURN

FUNCTION AUT3
PARAMETER ALIS
IF EMPTY(ALIS)
   REPL AUT.CODIGO WITH ZERO(AUT.CODIGO,10)
   RETURN !XSEEK(AUT.CODIGO,"AUT","CODIGO")
ELSE
   IF ALIS="BIO"
      REPL BIO.CODIGO WITH ZERO(BIO.CODIGO,10)
   ELSE
      REPL LIB.AUTOR1 WITH ZERO(LIB.AUTOR1,10)
   ENDIF
ENDIF
RETURN .T.

FUNCTION SACUDE
RC=RECNO()
GO TOP
GO BOTT
GO RC
RETURN .T.

FUNCTION ZERO
PARAMETER nnm,lr
PRIVATE NNM,LR
NNM=VAL(NNM)
nn=REPL("0",lr)+ALLTRIM(STR(nnm,lr))
nn=RIGHT(nn,lr)
RETURN(nn)

FUNCTION OFF_RELA
RELE WIND BIO
FOR A=1 TO 5
   IF !EMPTY(ALIAS((A)))
      SET RELA OFF INTO ALIAS((A))
   ENDIF
NEXT
RETURN .T.

PROCEDURE OPAUT
SELE 0
USE c:\sistemas\frases\AUTORES ALIAS AUT
Index TAG  CODIGO   ON CODIGO
Index TAG  AUTOR   ON AUTOR
SET ORDER TO TAG CODIGO
RETURN

PROCEDURE OPLIB
SELE 0
USE c:\sistemas\frases\LIBROS ALIAS LIB
Index TAG  AUTOR1   ON AUTOR1
Index TAG  LIBRO   ON LIBRO
RETURN

PROCEDURE OPPER
SELE 0
USE c:\sistemas\frases\PERSONAS ALIAS PER
Index TAG  CLIENTE   ON CLIENTE
Index TAG  CODCLI   ON CODCLI
RETURN


PROCEDURE OPMIX
SELE 0
USE c:\sistemas\frases\MIXTA ALIAS MIX
Index TAG  TEXTO1   ON TEXTO1
Index TAG  COLECCION   ON TEXTO1+STR(NU1,4)
RETURN

PROCEDURE INSERTA
APPE BLAN
RETURN

PROCEDURE OPBIO
SELE 0
USE c:\sistemas\frases\BIOGRAFI ALIAS BIO
Index TAG  CODIGO  ON CODIGO
Index TAG  BIOGRAF ON CODIGO+IIF(EMPTY(ANIO),"9999",STR(ANIO,4))
RETURN

PROCEDURE AUT1
AL=ALIAS()
SELE AUT
SET ORDER TO TAG CODIGO
=SACUDE()
SELE (AL)
RETURN

PROCEDURE PER1
AL=ALIAS()
SELE PER
SET ORDER TO TAG CODCLI
=SACUDE()
SELE (AL)
RETURN

PROCEDURE PER2
AL=ALIAS()
SELE PER
SET ORDER TO TAG CLIENTE
=SACUDE()
SELE (AL)
RETURN

PROCEDURE LIB1
AL=ALIAS()
SELE LIB
SET ORDER TO TAG AUTOR1
=SACUDE()
SELE (AL)
RETURN

PROCEDURE LIB2
AL=ALIAS()
SELE LIB
SET ORDER TO TAG LIBRO
=SACUDE()
SELE (AL)
RETURN

PROCEDURE COL1
AL=ALIAS()
SELE MIX
SET ORDER TO TAG TEXTO1
=SACUDE()
SELE (AL)
RETURN

PROCEDURE COL2
AL=ALIAS()
SELE MIX
SET ORDER TO TAG COLECCION
=SACUDE()
SELE (AL)
RETURN

FUNCTION XSEEK
PARAMETER QUEBUSCA,APODO,HORDEN
PRIVATE QUEBUSCA,APODO,HORDEN,SALIDA,APODOANT,HORDENANT
IF PARAMETER()<2
   M.SALIDA=.F.
ELSE
   STORE ALIAS() TO M.APODOANT
   ELREGISTRO=RECNO()
   SELE (M.APODO)
   IF PARAMETER()=3
	  M.ORDENANT=ORDER()
	  SET ORDER TO TAG (M.HORDEN)
   ENDIF
   M.SALIDA=SEEK(M.QUEBUSCA) .AND. RECNO()#ELREGISTRO
   IF PARAMETER()=3
	  SET ORDER TO TAG (M.ORDENANT)
   ENDIF
   IF !EMPTY(M.APODOANT)
      SELE (M.APODOANT)
   ENDIF
ENDIF
RETURN M.SALIDA

PROCEDURE MAIN
DO WHILE LAST()#27
   READ
   IF LAST()=27
      EXIT
   ENDIF
ENDDO
RETURN

FUNCTION BUSCA
WANT=WONTOP()
DEFINE WINDOW BUSCA FROM 10,0 TO 14,79
ACTI WIND BUSCA
STORE SPACE(10) TO LOBUSCO
@ 1,1 SAY "QUE BUSCA ?"
@ 1,20 GET LOBUSCO
READ
RELE WIND BUSCA
ACTI WIND (WANT)
SEEK ALLTRIM(LOBUSCO)
RETURN .T.

FUNCTION WIN0
ACTI SCRE
DEFI WIND WIN0 FROM 0,0 TO 24,79 NONE
ACTI WIND WIN0
RETURN .T.

FUNCTION REPEAT
SCAT MEMV
APPE BLAN
GATHER MEMV
RETURN .T.
