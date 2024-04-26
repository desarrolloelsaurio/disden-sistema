function abr_mes
parameter abr_elmes,LARGOR
PRIVATE ABR_ELMES,LARGOR
M.LARGOR=IIF(PARAMETER()=1,3,M.LARGOR)
return(left(qmes(abr_elmes),M.LARGOR)+'.')
