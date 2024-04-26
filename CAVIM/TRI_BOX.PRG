function tri_box
parameter r,c,r1,c1,tp
private   r,c,r1,c1,tp
tp=iif(parameter()=4,1,tp)
=HAZ_BOX(R,C,r1,c1)
=HAZ_BOX(r+1,c+1,r1-1,c1-1)
=HAZ_BOX(r+2,c+2,r1-2,c1-2)
return(.t.)
