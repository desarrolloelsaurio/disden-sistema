function qmes
parameter xcsa
private xcsa,cx
IF TYPE("XCSA")="C"
   XCSA=LEFT(upper(XCSA),3)
   DO CASE
   CASE xcsa="ENE"
      CX="Enero"
   CASE xcsa="FEB"
      CX="Febrero"
   CASE xcsa="MAR"
      CX="Marzo"
   CASE xcsa="ABR"
      CX="Abril"
   CASE XCSA="MAY"
      CX="Mayo"
   CASE XCSA="JUN"
      CX="Junio"
   CASE XCSA="JUL"
      CX="Julio"
   CASE XCSA="AGO"
      CX="Agosto"
   CASE XCSA="SET"
      CX="Setiembre"
   CASE XCSA="OCT"
      CX="Octubre"
   CASE XCSA="NOV"
      CX="Noviembre"
   OTHERWISE
      CX="Diciembre"
   ENDCASE
else
   if type('xcsa')='D'
      xcsa=month(xcsa)
   else
      if type('xcsa')#'N'
         xcsa=month(xxtofec(xcsa))
      endif
   ENDIF
   if xcsa<7
      cx=iif(xcsa=1,"Enero",iif(xcsa=2,"Febrero",iif(xcsa=3,"Marzo",iif(xcsa=4,"Abril",iif(xcsa=5,"Mayo","Junio")))))
   else
      cx=iif(xcsa=7,"Julio",iif(xcsa=8,"Agosto",iif(xcsa=9,"Setiembre",iif(xcsa=10,"Octubre",iif(xcsa=11,"Noviembre","Diciembre")))))
   endif
ENDIF
return cx
