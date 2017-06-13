local datebase = {
"
`!lock [links|spam|flood|member|sticker|username|fwd|inline|tag|all|leave|join|arabic|media|fosh|Strict|bots]`
`!unlock [links|spam|flood|member|sticker|username|fwd|inline|tag|all|leave|join|arabic|media|fosh|Strict|bots]`
••••••••••
`!setflood [3/20]`
••••••••••
`!mute [audio|photo|video|gifs|documents|text|all]`
`!unmute [audio|photo|video|gifs|documents|text|all]`
••••••••••
`!markread [yes|no]`
••••••••••
`!setlang [fa|en]`
••••••••••
`!silent  [ reply]`
`!unsilent [reply]`
••••••••••
`!setname [text]`
`!setabout [text]`
`!setrules [text]`
`!setphoto [text]`
`!setusername [text]` ",
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