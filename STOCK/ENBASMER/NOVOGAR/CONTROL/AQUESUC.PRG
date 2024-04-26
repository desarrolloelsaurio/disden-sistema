FUNCTION AQUESUC
DO CASE
CASE LASUC#"0004"
   LARECTEX="ARROYO SECO"
   RETURN "0004"
OTHERWISE
   M.SALSUC=POPMENU(10,30," Sucursal de Destino ",;
     IIF(LASUC="0004","ROSARIO","ARROYO SECO"),;
     "EMPALME",;
     "DEPOSITO 25 DE MAYO",;
     "DEPOSITO LIBERTAD")
   if last()#27
      if m.SALSUC=1
         IF ESARROYO
            LARECTEX="ROSARIO"
            return "0005"
         ELSE
            LARECTEX="ARROYO SECO"
            return "0004"
         ENDIF
      else
         if m.SALSUC=2
            LARECTEX="EMPALME"
            return "0003"
         else
            if m.SALSUC=3
               LARECTEX="DEPOSITO 25 DE MAYO"
               return "0008"
            ELSE
               if m.SALSUC=4
                  LARECTEX="DEPOSITO LIBERTAD"
                  return "0007"
               endif
            ENDIF
         endif
      endif
   ENDIF
ENDCASE
RETURN
