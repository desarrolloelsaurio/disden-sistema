FUNCTION GALTOCUM
PARAMETERS GALLONS
PRIVATE GALLONS, RVALUE
************************************************************
*  galtocum(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-06-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function converts gallons to cubic meters.        *
************************************************************
RETURN IIF(TYPE('GALLONS')='N',GALLONS/264.17205,PARERROR('GALTOCUM','N'))
