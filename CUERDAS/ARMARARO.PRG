function armararo
para que
sale=""
for i=1 to len(que)
	a= upper(subs(que, i, 1))
	do case
		case a="�"
			a="RO"
		case a="�"
			a="N"
		case a="�"
			a="A"
		case a="�"
			a="E"
		case a="�"
			a="I"
		case a="�"
			a="O"
		case a="�"
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