FUNCTION fechatxt
PARAMETERS lafe
IF EMPTY(lafe)
   RETURN  "ver envase"
ELSE
   RETURN inttxt(MONTH(lafe),2)+"/"+inttxt(YEAR(lafe),4)
ENDIF 
