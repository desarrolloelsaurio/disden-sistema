function armararo
para que
sale=""
for i=1 to len(que)
	a= upper(subs(que, i, 1))
	do case
		case a="º"
			a="RO"
		case a="Ñ"
			a="N"
		case a="Á"
			a="A"
		case a="É"
			a="E"
		case a="Í"
			a="I"
		case a="Ó"
			a="O"
		case a="Ú"
			a="U"
		case betw(asc(a),65,90) .or. ;
	  		 betw(asc(a),48,57) .or. ;
	  		 a="." .or. a="(" .or. a=")" .or. a="-"
			a=a
		other
			a=" "
	endcase
	sale = sale + a 
next
return sale