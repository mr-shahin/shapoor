local datebase = {
" !lock [links|spam|flood|member|sticker|username|fwd|inline|tag|all|leave|join|arabic|media|fosh|Strict|bots] \n\n!unlock [links|spam|flood|member|sticker|username|fwd|inline|tag|all|leave|join|arabic|media|fosh|Strict|bots] \n•••••••••• \n!setflood [3/20]\n •••••••••• \n!mute [audio|photo|video|gifs|documents|text|all]\n !unmute [audio|photo|video|gifs|documents|text|all] \n•••••••••• \n!markread [yes|no]\n ••••••••••\n !setlang [fa|en] \n••••••••••\n !silent  [ reply] \n!unsilent [reply\n ••••••••••\n !setname [text]\n !setabout [text]\n !setrules [text]\n !setphoto [text] \n!setusername [text]\n !setwlc [text] \n !delwlc \n !settings \n !public [yes|no] \n !info \n !id",
"\
  }
local function run(msg, matches) 
 send_document(get_receiver(msg), "/root/shapoor/data/sticker.webp", ok_cb, false)
return datebase[math.random(#datebase)]
end
return {
  patterns = {
    "^[/#+×!$]([Hh][Ee][Ll][Pp])",
  },
  run = run
}
