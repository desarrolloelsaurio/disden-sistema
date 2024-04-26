FUNCTION PSPECODE
PARAMETER CLINN
IF GETENV("PRN")="BUBL"
   _PSCODE='{027}{069};
     {027}{038}{108}{051}{065};
     {027}{040}{115}{020}{072}'
   * RESET
   * LARGO DE PAGINA
   * PRINT PITCH
ELSE
   IF GETENV("PRN")="LASER"
      ??? CHR(27)
      ??? "%"
      ??? "0"
      ??? "A"
      _PSCODE='{27}{69}'
   ELSE
      IF GETENV("PRN")="BROTHER"
         _PSCODE='{27}{64}{27}{67}{'+CLINN+'}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}'
         _PECODE='{27}{13}{69}'
      ELSE
         _PSCODE='{27}{64}{27}{67}{'+CLINN+'}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}'
      ENDIF
   ENDIF
ENDIF
RETURN
