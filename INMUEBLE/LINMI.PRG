* ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LINMI.PRG                          บ
* บ COMENTARIO    : LISTADO DE INMUEBLES POR IMPRESORA บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
STORE "" TO ACLA,LINEA
RETURN LINM0() .AND. LGRLI("TMP","LINM1()",FISC,"LINMP") .AND. OFF_TMP() .AND. MEN_LIN(BOTOM)
