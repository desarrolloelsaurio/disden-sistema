function efect5
	parameters startx,starty,text1,text2,text3,text4
	private startx,starty,text1,text2,text3,text4
	* determine length for widest window
	size = max(len(text1),len(text2),len(text3),len(text4)) + 4

	* define and fill six windows
	define window ef5win1 from startx,starty to startx,starty + size - 1;
		none noshadow color scheme 7
	activate window ef5win1 noshow
	@ 0,0 say "É"
	for cnt = 1 to size - 2
		@ 0,cnt say "Í"
	endfor
	@ 0,size - 1 say "»"

	define window ef5win2 from startx,starty to startx,starty + size - 1;
		none noshadow color scheme 7
	activate window ef5win2 noshow
	@ 0,0 say "º"
	@ 0,round((size/2)-(len(text1)/2),0) say text1
	@ 0,size - 1 say "º"

	define window ef5win3 from startx,starty to startx,starty + size - 1;
		none noshadow color scheme 7
	activate window ef5win3 noshow
	@ 0,0 say "º"
	@ 0,round((size/2)-(len(text2)/2),0) say text2
	@ 0,size - 1 say "º"

	define window ef5win4 from startx,starty to startx,starty + size - 1;
		none noshadow color scheme 7
	activate window ef5win4 noshow
	@ 0,0 say "º"
	@ 0,round((size/2)-(len(text3)/2),0) say text3
	@ 0,size - 1 say "º"

	define window ef5win5 from startx,starty to startx,starty + size - 1;
		none noshadow color scheme 7
	activate window ef5win5 noshow
	@ 0,0 say "º"
	@ 0,round((size/2)-(len(text4)/2),0) say text4
	@ 0,size - 1 say "º"

	define window ef5win6 from startx,starty to startx,starty + size - 1;
		none noshadow color scheme 7
	activate window ef5win6 noshow
	@ 0,0 say "È"
	for cnt = 1 to size - 2
		@ 0,cnt say "Í"
	endfor
	@ 0,size - 1 say "¼"

	* move windows to starting positions
	move window ef5win1 to 0,35
	move window ef5win2 to 0,0
	move window ef5win3 to 0,80 - size
	move window ef5win4 to 24,80 - size
	move window ef5win5 to 24,0
	move window ef5win6 to 24,35

	* move windows to ending positions
	show window ef5win3
	for cnt = 0 to startx + 2
		move window ef5win3 to cnt,80 - size
	endfor
	for cnt = 80 - size to starty step -1
		move window ef5win3 to startx + 2,cnt
	endfor

	show window ef5win5
	for cnt = 24 to startx + 4 step -1
		move window ef5win5 to cnt,0
	endfor
	for cnt = 0 to starty
		move window ef5win5 to startx + 4,cnt
	endfor

	show window ef5win2
	for cnt = 0 to startx + 1
		move window ef5win2 to cnt,0
	endfor
	for cnt = 0 to starty
		move window ef5win2 to startx + 1,cnt
	endfor

	show window ef5win4
	for cnt = 24 to startx + 3 step -1
		move window ef5win4 to cnt,80 - size
	endfor
	for cnt = 79 to starty step -1
		move window ef5win4 to startx + 3,cnt
	endfor

	if starty < 35
		direction = -1
	else
		direction = 1
	endif

	show window ef5win6
	for cnt = 24 to startx + 5
		move window ef5win6 to cnt,35
	endfor
	for cnt = 35 to starty step direction
		move window ef5win6 to startx + 5,cnt
	endfor

	show window ef5win1
	for cnt = 0 to startx
		move window ef5win1 to cnt,35
	endfor
	for cnt = 35 to starty step direction
		move window ef5win1 to startx,cnt
	endfor

	=inkey(0)

	* move windows out of there
	activate window ef5win1
	do while wlrow() > 0 and wlcol() > 0
		move window ef5win1 by -1,-1
	enddo
	release window ef5win1

	activate window ef5win2
	do while wlrow() > 0
		move window ef5win2 by -1,0
	enddo
	release window ef5win2

	activate window ef5win3
	do while wlrow() > 0 and wlcol() < 79
		move window ef5win3 by -1,1
	enddo
	release window ef5win3

	activate window ef5win4
	do while wlrow() < 24 and wlcol() < 79
		move window ef5win4 by 1,1
	enddo
	release window ef5win4

	activate window ef5win5
	do while wlrow() < 24
		move window ef5win5 by 1,0
	enddo
	release window ef5win5

	activate window ef5win6
	do while wlrow() < 24 and wlcol() > 0
		move window ef5win6 by 1,-1
	enddo
	release window ef5win6

return
