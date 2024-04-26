function zpec11
  parameter kxa
  if !empty(kxa)
	 =xseek(kxa,'mix','pagcod')
	 KXA=IIF(HAYLETRA(MIX.TEXTO1),MIX.TEXTO1,transf(MIX.TEXTO1,"@R 999-999-999-999-999-999"))
  endif
return kxa
