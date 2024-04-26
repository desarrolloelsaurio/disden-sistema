FUNCTION tone
PARAMETERS freq, duration, reps
PRIVATE freq, duration, reps, i

************************************************************
*  tone([<expN1>[<expN2>[,<expN3>]]])                      *
*  Version # 1.1  FP          Date: 05-21-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note:  Function sets the bell to the proper frequency   *
*  and duration and then sounds the tone.  Function uses   *
*  the Clipper syntax.                                     *
*  Modified 5-21-90 to include the third parameter that    *
*  allows the tone to be repeated more than once.          *
************************************************************

DO CASE

  CASE parameters() = 0
    freq = 4000
    duration = 2
    reps = 1

  CASE parameters() = 1
    duration = 3
    reps = 1

  CASE parameters() = 2
    reps = 1

ENDCASE

freq = iif(freq<20,20,freq)
duration = iif(duration=0,1,duration)

FOR i = 1 to reps
  SET BELL TO freq, duration
  ?? chr(7)
  = inkey(.01)
ENDFOR

SET BELL TO

RETURN('')
