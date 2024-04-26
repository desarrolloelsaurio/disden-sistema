FUNCTION GALTOCUF
PARAMETERS GALLONS
PRIVATE GALLONS, RVALUE
************************************************************
*  galtocuf(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-06-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function converts gallons into cubic feet.        *
************************************************************
RETURN IIF(TYPE('GALLONS')='N',GALLONS/7.480520,PARERROR('GALTOCUF','N'))
