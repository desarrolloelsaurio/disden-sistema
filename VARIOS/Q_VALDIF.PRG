FUNCTION Q_VALDIF
PARAMETER Q_VAL
RETURN IIF(Q_VAL="CH","Cheques",iif(q_val="TA","Tarjetas de Cr‚dito","Documentos"))
