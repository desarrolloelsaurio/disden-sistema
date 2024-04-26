function abr_diA
parameter abr_eldia,LARGOR
PRIVATE ABR_ELDIA,LARGOR
M.LARGOR=IIF(PARAMETER()=1,3,M.LARGOR)
return(left(qdia(M.abr_eldia),M.LARGOR)+'.')
