* 浜様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LINMP.PRG                         �
* � COMENTARIO    : LISTADO DE INMUEBLES POR PANTALLA �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
STORE "" TO ACLA,LINEA
RETURN LINM0() .AND. LGRLP("TMP","LINM1()",FISC,"LINMP") .AND. OFF_TMP() .AND. MEN_LIN(BOTOM)
