FUNCTION CUFTOGAL
PARAMETERS CU_FT
PRIVATE CU_FT, RVALUE
************************************************************
*  cuftogal(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-06-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts cubic feet liquid measure to    *
*  gallons.                                                *
*  MOFIC. GOYO 09/08/95 12:59 - 1 sola linea               *
************************************************************
RETURN IIF(TYPE('CU_FT') = 'N', 7.480520 * CU_FT,PARERROR('CUFTOGAL','N'))
