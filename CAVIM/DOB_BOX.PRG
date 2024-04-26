function dob_box
parameter r,c,r1,c1,tp
private r,c,r1,c1,tp
tp=iif(parameter()=4,1,tp)
=HAZ_BOX(r,c,r1,c1)
=HAZ_BOX(r+1,c+1,r1-1,c1-1)
return(.t.)
