procedure reimrec
param porimpre
=OPCCP()
=OPPRO()
set orde to procod
m.remi=""
DO ELIREC2.SPR
SELE CCP
if !empty(m.remi)
	SELE * FROM CCP WHERE NUMERORE=M.REMI into cursor tmp
	sele tmp
	=seek(tmp.procod, "per")
	scatter memv
	scan
		if left(compr,1)="R"
			m.lasf = substr(detalle, 11)
			m.totfinal = monto
		else
			m.ingbrut = monto
		endif
	ends 
	m.totnet = m.totfinal + m.ingbrut
	m.codibru = allt(per.texto1)
	m.porbru = iif(!empty(m.codibru) .and. xseek(m.codibru, "MIX", "BRUCOD"),mix.nu3,0)
**	if totnet=>2000
**		store m.porbru * m.totbru / 100 to m.ingbrut
**	endif
	m.totbru = iif (m.porbru=0,0,m.ingbrut * 100 / m.porbru)
	scan
		scatter memvar
		if left(compr,1)="R"
			if porimpre
				repo form lpagpro noco reco recn() to printer prompt
			else
				repo form lpagpro noco reco recn() prev
			endif
		else
			if porimpre
				repo form lpagpro2 noco reco recn() to printer prompt
			else
				repo form lpagpro2 noco reco recn() prev
			endif
		endif
	ends 
endif
return