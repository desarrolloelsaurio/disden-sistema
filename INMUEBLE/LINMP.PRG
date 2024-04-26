* ษอออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LINMP.PRG                         บ
* บ COMENTARIO    : LISTADO DE INMUEBLES POR PANTALLA บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
STORE "" TO ACLA,LINEA
RETURN LINM0() .AND. LGRLP("TMP","LINM1()",FISC,"LINMP") .AND. OFF_TMP() .AND. MEN_LIN(BOTOM)
