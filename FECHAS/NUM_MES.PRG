function num_mes
parameter n_mes,n_cx
store "ENE*FEB*MAR*ABR*MAY*JUN*JUL*AGO*SET*OCT*NOV*DIC" TO n_cx
n_mes=LEFT(upper(n_mes),3)
return (at(n_mes,n_cx)-1)/4+1