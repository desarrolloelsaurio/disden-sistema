FUNCTION GETPRIN  
  select MOV
  SET ORDER TO TAG MOVIMIE
  seek(str(KPERIODO,2))
  store recno() to PRINCIPIO
RETURN FOUND()