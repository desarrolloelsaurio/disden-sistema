* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPAGP.PRG            บ
* บ COMENTARIO    : LISTA COND. DE PAGO  บ
* ศออออออออออออออออออออออออออออออออออออออผ
STORE "" TO CASOS,ACLA,TT
RETURN LPAGX0() .AND. LGRLP("TMP","LPAGX1()" ,"","LPAGI") .AND. MEN_LIN(BOTOM)
