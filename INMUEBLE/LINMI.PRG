* 浜様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LINMI.PRG                          �
* � COMENTARIO    : LISTADO DE INMUEBLES POR IMPRESORA �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE BOTOM "  "+repl("�",78)                  && BOTOM
STORE "" TO ACLA,LINEA
RETURN LINM0() .AND. LGRLI("TMP","LINM1()",FISC,"LINMP") .AND. OFF_TMP() .AND. MEN_LIN(BOTOM)
