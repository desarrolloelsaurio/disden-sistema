* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPAGI.PRG            บ
* บ COMENTARIO    : LISTA COND. DE PAGO  บ
* ศออออออออออออออออออออออออออออออออออออออผ
STORE "" TO CASOS,ACLA,TT
RETURN LPAGX0() .AND. LGRLI("TMP","LPAGX1()","","LPAGI") .AND. MEN_LIN(BOTOM)
