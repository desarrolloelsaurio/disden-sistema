FUNCTION EFFECT2
	parameters startx,starty,instr1,instr2,instr3
	IF PARAMETER()=1
		CLEA
		? 'parameters RENGLON,COLUMNA,TEXTO1,TEXTO2,TEXTO3'
	ELSE
		largos=max(len(alltrim(instr1)),len(alltrim(instr2)),len(alltrim(instr3)))
		largos=LARGOS+iif(espar(largos),3,2)
		instr1=padc(alltrim(instr1),largos)
		instr2=padc(alltrim(instr2),largos)
		instr3=padc(alltrim(instr3),largos)
		nlines = 3
		if empty(instr3)
			nlines = nlines - 1
		endif
		if empty(instr2)
			nlines = nlines - 1
		endif
		size = max(len(instr1),len(instr2),len(instr3))
		wincnt = 0
		xcnt = 0
		for cnt = 1 to nlines
			wincnt = wincnt + 1
			define window ("ef2win"+alltrim(str(wincnt))) from startx+xcnt,starty to;
				startx+xcnt,starty+len(eval("instr"+alltrim(str(cnt))))-1 none color scheme 7
			activate window ("ef2win"+alltrim(str(wincnt))) noshow
			for cnt2 = 1 to len(eval("instr"+alltrim(str(cnt)))) step 2
				@ 0,cnt2-1 say substr(eval("instr"+alltrim(str(cnt))),cnt2,1)
			endfor
			move window ("ef2win"+alltrim(str(wincnt))) to 0,starty
			show window ("ef2win"+alltrim(str(wincnt)))
			for cnt3 = 0 to startx+xcnt
				move window ("ef2win"+alltrim(str(wincnt))) to cnt3,starty
				*		=INPAUSE(0)
			endfor

			define window ("ef2win"+alltrim(str(wincnt+1))) from startx+xcnt,starty to;
				startx+xcnt,starty+len(eval("instr"+alltrim(str(cnt))))-1 none color scheme 7
			activate window ("ef2win"+alltrim(str(wincnt+1))) noshow
			for cnt2 = 2 to len(eval("instr"+alltrim(str(cnt)))) step 2
				@ 0,cnt2-1 say substr(eval("instr"+alltrim(str(cnt))),cnt2,1)
			endfor
			move window ("ef2win"+alltrim(str(wincnt+1))) to 24,starty
			show window ("ef2win"+alltrim(str(wincnt+1)))
			for cnt3 = 24 to startx+xcnt+1 step -1
				move window ("ef2win"+alltrim(str(wincnt+1))) to cnt3,starty
				*		=INPAUSE(0)
			endfor
			release window ("ef2win"+alltrim(str(wincnt+1)))
			activate window ("ef2win"+alltrim(str(wincnt)))
			for cnt2 = 2 to len(eval("instr"+alltrim(str(cnt)))) step 2
				@ 0,cnt2-1 say substr(eval("instr"+alltrim(str(cnt))),cnt2,1)
			endfor

			xcnt = xcnt+1
		endfor

		do apause

		for cnt = 1 to wincnt
			=relewin("ef2win"+alltrim(str(cnt)))
		endfor
	ENDIF
return .T.
