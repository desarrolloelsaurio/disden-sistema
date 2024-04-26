FUNCTION AYUDA
PARAMETER QUETEX
QUETEX=IIF(EMPTY(QUETEX),0,7)
@ 2,37 FILL TO 11, 77 COLOR B
@ 1,38 FILL TO 10, 78 COLOR R/R
IF QUETEX=7
@ 3,50 SAY "[ENTER ] Ing Cont Caja    "
@ 4,50 SAY "[INS   ] Ing Cont Caja    "
@ 5,50 SAY "[DEL   ] Borra Cont Caja  "
ELSE
@ 3,50 SAY "[ENTER ] Prx Nivel        "
@ 4,50 SAY "[INS   ] Ing Rubro        "
@ 5,50 SAY "[DEL   ] Borra Rubro      "
ENDIF
@ 6,50 SAY "[CTRL I] Ing Cont Caja    "
@ 7,50 SAY "[ALT  I] Muestra Cont Caja"
@ 8,50 SAY "[CTRL B] Muestra Cont Caja"
RETURN .T.
