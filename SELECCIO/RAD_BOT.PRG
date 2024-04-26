function rad_bot
parameter BOT_REN,BOT_COL,BOT_VAR,BOT_COSA,BOT_COLOR,BOT_ENTRA
if BOT_ENTRA
@ BOT_REN,BOT_COL get (BOT_VAR) function BOT_COSA COLo sche 6
else
@ BOT_REN,BOT_COL get (BOT_VAR) function BOT_COSA disa COLo sche 6
endif
return .t.
