_WRAP=.T.
_ALIGNMENT="LEFT"
?
IF JANNAME#"ADMINISTRACION RAFULS"
	??? NLQ
ENDIF
?? '�'+REPL("�",78)+"�"
? '�'
?? alltrim(janname)
?? '�' AT 79
?
?? '�'
?? parse("RIOJA 2811","IVA RESPONSABLE NO INSCRIPTO",78)
?? '�'
? '�'
?? PARSE("2000-ROSARIO","C.U.I.T. 20-06035454-6",78)
?? '�'
? '�'
?? PARSE("TEL: (041) 300800","Ing. BRUTOS: 021-011466-3",78)
?? '�'
? '�'
?? PARSE("FAX: (041) 398287","JUBILACION ex Comercio: 52834936",78)
?? '�'
? '�'+REPL("�",78)+"�"
?
??? OFFWIDE
_WRAP=.F.
_RMARGIN=80
??? OFFNLQ
RETURN
