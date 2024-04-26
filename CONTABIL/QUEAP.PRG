function queap
PARAMETER DIRECTO
IF DIRECTO
RETURN "MES DE "+ALLTRIM(KMESES[KPERIODO])+" (Desde Asiento "+ALLTRIM(str(inicio))+" a Asiento "+ALLTRIM(str(final))+")"
ENDIF
	if AP="P"
		QAP="(Peri¢dico / "+;
  	    LEFT(ALLT(KMESES[PERINI]),3)+" "
	else
		QAP="(Acumulado / "+;
		LEFT(ALLT(KMESES[PERINI]),3)+"-"+LEFT(ALLT(KMESES[PERFIN]),3)+" "		
	endif
	QAP=QAP+IIF(PORFEC,"/ desde "+tran(FECINI,PICFEC)+" al "+tran(FECFIN,"@E ##/##/## - "),"")
return ALLTRIM(QAP)+")"
