function arma
para n
m.n=str(n,4)
m.tres   =left(m.n,1)
m.cinco =subs(m.n,2,1)
m.seis   =subs(m.n,3,1)
m.nueve=subs(m.n,4,1)
return  strzero(val(m.nueve)^2)+m.seis+;
		strzero(int(val(m.tres)/val(m.cinco)),1)+ ;
		m.tres+m.cinco+					 ;
		strzero(int(val(m.seis/val(m.nueve)),1)+ ;
		m.nueve+						 ;
		strzero(int(val(m.seis/val(m.cinco)),1)