FUNCTION CCTOCUIN
PARAMETERS VOLUME
PRIVATE VOLUME, RVALUE
************************************************************
*  cctocuin(<expN>)                                        *
*  Version #  1.0   FP        Date: 11-01-89               *
*  Programmed by: Malcolm C. Rubel                         *
*  Note: Function converts cubic centimeters to cubic      *
*  inches.                                                 *
*  MOFIC. GOYO 09/08/95 12:59 - 1 sola linea               *
************************************************************
RETURN IIF(TYPE('VOLUME') = 'N',VOLUME / 16.387064,PARERROR('CCTOCUIN','N'))
