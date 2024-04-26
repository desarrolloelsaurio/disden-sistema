FUNCTION EFECT21
parameters xstart,ystart,instr1,instr2,instr3,instr4,I_ESPERAR
length = parameters() - 2
if length < 2
	return
endif
length = IIF(length >4,4,length )
#DEFINE NUL    0                                 && NUL
width = nul
for cnt = 1 to length
	if len(evaluate("instr"+alltrim(str(cnt)))) > width
		width = len(evaluate("instr"+alltrim(str(cnt))))
	endif
endfor

defi wind upleft from xstart,ystart to ;
 xstart+ceiling(length/2)-1,ystart+ceiling(width/2)-1 NONE shad COLO SCHE 5
activate window upleft noshow
xcnt = NUL
for cnt = 1 to ceiling(length/2)
	@ NUL + xcnt,nul say substr(evaluate("instr"+alltrim(str(cnt))),1,ceiling(width/2))
	xcnt = xcnt + 1
endfor
move window upleft to 1,0
show window upleft

defi wind upright from xstart,ystart to ;
 xstart+ceiling(length/2)-1,ystart+ceiling(width/2)-1 NONE shad  COLO SCHE 5
activate window upright noshow
xcnt = NUL
for cnt = 1 to ceiling(length/2)
	@ NUL + xcnt,nul say substr(evaluate("instr"+alltrim(str(cnt))),ceiling(width/2)+1)
	xcnt = xcnt + 1
endfor
move window upright to 1,80-ceiling(width/2)
show window upright

defi wind lowleft from xstart,ystart to ;
 xstart+ceiling(length/2)-1,ystart+ceiling(width/2)-1 NONE shad  COLO SCHE 5
activate window lowleft noshow
xcnt = NUL
for cnt = ceiling(length/2)+1 to length
	@ NUL + xcnt,nul say substr(evaluate("instr"+alltrim(str(cnt))),1,ceiling(width/2))
	xcnt = xcnt + 1
endfor
move window lowleft to 23,0
show window lowleft

defi wind lowright from xstart,ystart to ;
 xstart+ceiling(length/2)-1,ystart+ceiling(width/2)-1 NONE shad  COLO SCHE 5
activate window lowright noshow
xcnt = NUL
for cnt = ceiling(length/2)+1 to length
	@ NUL + xcnt,nul say substr(evaluate("instr"+alltrim(str(cnt))),ceiling(width/2)+1)
	xcnt = xcnt + 1
endfor
move window lowright to 23,80-ceiling(width/2)
show window lowright

for cnt = 1 to xstart
	move window upleft to cnt,0
endfor
for cnt = NUL to ystart
	move window upleft to xstart,cnt
endfor

for cnt = 1 to xstart
	move window upright to cnt,80-ceiling(width/2)
endfor
for cnt = 80-ceiling(width/2) to ystart+ceiling(width/2) step -1
	move window upright to xstart,cnt
endfor

for cnt = 23 to xstart+ceiling(length/2) step -1
	move window lowleft to cnt,0
endfor
for cnt = NUL to ystart
	move window lowleft to xstart+ceiling(length/2),cnt
endfor

for cnt = 23 to xstart+ceiling(length/2) step -1
	move window lowright to cnt,80-ceiling(width/2)
endfor
for cnt = 80-ceiling(width/2) to ystart+ceiling(width/2) step -1
	move window lowright to xstart+ceiling(length/2),cnt
endfor
IF !I_ESPERAR
=INKEY(NUL,'HM')
rele wind upleft,upright,lowleft,lowright
ENDIF
RETURN LAST()

