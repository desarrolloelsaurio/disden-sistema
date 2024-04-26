_WRAP=.T.
_ALIGNMENT="LEFT"
?
IF JANNAME#"ADMINISTRACION RAFULS"
	??? NLQ
ENDIF
?? 'Ú'+REPL("Ä",78)+"¿"
? '³'
?? alltrim(janname)
?? '³' AT 79
?
?? '³'
?? parse("RIOJA 2811","IVA RESPONSABLE NO INSCRIPTO",78)
?? '³'
? '³'
?? PARSE("2000-ROSARIO","C.U.I.T. 20-06035454-6",78)
?? '³'
? '³'
?? PARSE("TEL: (041) 300800","Ing. BRUTOS: 021-011466-3",78)
?? '³'
? '³'
?? PARSE("FAX: (041) 398287","JUBILACION ex Comercio: 52834936",78)
?? '³'
? 'À'+REPL("Ä",78)+"Ù"
?
??? OFFWIDE
_WRAP=.F.
_RMARGIN=80
??? OFFNLQ
RETURN
