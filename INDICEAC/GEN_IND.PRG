funct gen_ind
para GEN_FEC1,GEN_FEC2,GEN_ACT
priv GEN_FEC1,GEN_FEC2,GEN_ACT,GEN_IND1,GEN_IND2,indice,GEN_ALIA
M.GEN_ALIA=ALIAS()
SELE iac
if seek(GEN_ACT+str(year(GEN_FEC1),4),'IAC')
   scat to indice
   GEN_IND1=indice[month(GEN_FEC1)]
   if seek(GEN_ACT+str(year(GEN_FEC2),4),'IAC')
      scat to indice
      GEN_IND2=indice[month(GEN_FEC2)]
   else
      GEN_IND2=0
   endif
else
   GEN_IND1=1
   GEN_IND2=0
endif
if !empty(m.GEN_ALIA)
	SELE (M.GEN_ALIA)
endif
return (GEN_IND2/GEN_IND1)
