FUNCTION ELUNI
DO CASE
*CASE !EMPTY(OTRCODPRO)
*RETURN SAYMIX(SAYGRL(OTRCODPRO,"OTRS","OTRCODPRO","OTRS.UNIDAD"),"MDDCOD")
CASE !EMPTY(COMCODPRO)
RETURN SAYMIX(SAYGRL(COMCODPRO,"COMS","COMCODPRO","COMS.UNIDAD"),"MDDCOD")
CASE !EMPTY(TELCODPRO)
RETURN SAYMIX(SAYGRL(TELCODPRO,"TELS","TELCODPRO","TELS.UNIDAD"),"MDDCOD")
ENDCASE
RETURN SAYMIX(SAYGRL(AVICODPRO,"AVIS","AVICODPRO","AVIS.UNIDAD"),"MDDCOD")