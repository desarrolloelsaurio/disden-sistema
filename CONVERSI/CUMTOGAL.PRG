FUNCTION CUMTOGAL
PARAMETERS CU_METS
PRIVATE CU_METS, RVALUE
************************************************************
*  cumtogal(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-06-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function converts cubic meters into gallons.      *
*  MOFIC. GOYO 09/08/95 12:59 - 1 sola linea               *
************************************************************
RETURN IIF(TYPE('CU_METS')='N',CU_METS * 264.17205,PARERROR('CUMTOGAL','N'))
