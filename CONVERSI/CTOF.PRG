FUNCTION CTOF
PARAMETERS PASS_TEMP
PRIVATE PASS_TEMP, RVALUE
************************************************************
*  ctof(<expN>)                                            *
*  Version #  1.0   FP        Date: 11-01-89               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function converts a Centigrade temperature to     *
*  a Fahrenheit temperature.                               *
*  MOFIC. GOYO 09/08/95 12:59 - 1 sola linea               *
************************************************************
RETURN IIF(TYPE('PASS_TEMP') = 'N', (PASS_TEMP * 1.8) + 32,PARERROR('CTOF','N'))
