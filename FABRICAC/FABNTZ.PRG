function fabntz
	DO CASE
	CASE agrupa=3
		FISC="EEC>99 .AND. "+FISC
		TT1="Cantidades mayores que 100"
	CASE agrupa=2
		FISC="EEC<100 .AND. "+FISC
		TT1="Cantidades menores que 100"
	ENDCASE
return .t.
