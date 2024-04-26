function qw_tar
parameter QT_REN,QT_COL,QT_CUAL
private QT_REN,QT_COL,QT_CUAL
STORE NUL TO tar_salida
if filtar=2
   QWSALIDA=QWMIX(MIXGRL("Tipos de Arancel","Tipo de Arancel","Tipos de Arancel",.t.),QT_CUAL,'L¡mites del Tipo de Arancel',"TARTEX","ELITAR('Tipo de Arancel',qt_ren,qt_col)",.T.)
   IF QWSALIDA#".F."
   QW=AT("ú",QWSALIDA)
   QUEtar=LEFT(QWSALIDA,QW-1)
   TTtar=SUBSTR(QWSALIDA,QW+1)
   ELSE
      store 1 to filtar
   endif
endif
return tar_salida#2
