FUNCTION QW_sto
EXTERNAL ARRAY HABILITADO
if filsto=1
   HABILITADO[8]=.f.
   ttsto='STOCKS'
else
   variable[8]=.t.
   if filsto=2
      resta='stock-stockmin'
      QUESTO='stock>stockmax'
      TTSTO='Stock Mayor que el M ximo'
   else
      QUESTO='stock<stockmin'
      resta='stockmin-stock'
      TTSTO='Stock Menor que el M¡nimo'
   endif
endif
RETURN .T.
