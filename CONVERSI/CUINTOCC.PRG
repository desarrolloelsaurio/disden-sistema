FUNCTION CUINTOCC
PARAMETERS PASS_VOL
PRIVATE PASS_VOL, RVALUE
************************************************************
*  cuintocc(<expN>)                                        *
*  Version #  1.0   FP        Date: 11-02-89               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function converts cubic inches to cubic           *
*  centimeters.                                            *
*  MOFIC. GOYO 09/08/95 12:59 - 1 sola linea               *
************************************************************
RETURN IIF(TYPE('PASS_VOL') = 'N',PASS_VOL * 16.387064,PARERROR('CUINTOCC','N'))
