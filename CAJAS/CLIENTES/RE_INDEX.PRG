on error 
close data
erase rub1.cdx
use rub1
index on str(rub1,3) tag rub
index on rubro1 tag rubro
erase rub2.cdx
use rub2
index on str(rub1,3)+str(rub2,3) tag rub
index on rubro2 tag rubro
index on str(rub1,3)+RUBRO2 tag rubX
erase rub3.cdx
use rub3
index on str(rub1,3)+str(rub2,3)+str(rub3,3) tag rub
index on rubro3 tag rubro
index on str(rub1,3)+str(rub2,3)+rubro3 tag rubX
erase rub4.cdx
use rub4
index on str(rub1,3)+str(rub2,3)+str(rub3,3)+str(rub4,3) tag rub
index on rubro4 tag rubro
index on str(rub1,3)+str(rub2,3)+str(rub3,3)+rubro4 tag ruBX
erase rub5.cdx
use rub5
index on str(rub1,3)+str(rub2,3)+str(rub3,3)+str(rub4,3)+str(rub5,3) tag rub
index on rubro5 tag rubro
index on str(rub1,3)+str(rub2,3)+str(rub3,3)+str(rub4,3)+rubro5 tag rubX
erase rub6.cdx
use rub6
index on str(rub1,3)+str(rub2,3)+str(rub3,3)+str(rub4,3)+str(rub5,3)+str(rub6,3) tag rub
index on rubro6 tag rubro
index on str(rub1,3)+str(rub2,3)+str(rub3,3)+str(rub4,3)+str(rub5,3)+rubro6 tag rubX
erase contenid.cdx
use contenid
index on str(rub1,3)+str(rub2,3)+str(rub3,3)+str(rub4,3)+str(rub5,3)+str(rub6,3) tag rub
index on contenido tag rubro
close data