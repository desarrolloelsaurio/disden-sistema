      CANT_MAX=2
      DIME TEXTO[2,3],variable[2]
      store .t. to variable
      TEXTO[1,1]='CIUDAD'
      TEXTO[1,2]=20
      texto[1,3]="eltexto"
      TEXTO[2,1]='CANTIDAD'
      TEXTO[2,2]=10
      texto[2,3]="TOTAL"
      TT='Listado de Proveedores'+ttque
      SELE PRO
      SET ORDER TO
      SELE MIX
      SET ORDER TO TAG CIUCOD
      SELE PRO
      SET RELA TO LOCAL INTO MIX
      IF PORPAN
         DO LRESP WITH "LPROPR","PRO","MIX.TEXTO1","PRO.LOCAL","MIX.TEXTO1",'"|"+STR(GTOTAL)+"|"'
      ELSE
         DO LRESI WITH "LPROIR","PRO","MIX.TEXTO1","PRO.LOCAL","MIX.TEXTO1",'"|"+STR(GTOTAL)+"|"'
      ENDIF
      =REOPPRO()
