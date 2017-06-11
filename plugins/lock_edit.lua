do

function lock_edit(msg, data, target)
  if not is_momod(msg) then
    return
  end
  channel_invite(get_receiver(msg),"user#id240486291",ok_cb,false)
  local edit_lock = data[tostring(target)]['settings']['edit_lock']
  if lock_edit and lock_edit == 'yes' then
    return 'Edit is already locked'
  else
    data[tostring(target)]['settings']['edit_lock'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Edit locked'
  end
end

function unlock_edit(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local lock_edit = data[tostring(target)]['settings']['lock_edit']
  if not lock_edit or lock_edit == 'no' then
    return 'Edit is not locked'
  else
    data[tostring(target)]['settings']['lock_edit'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Edit unlocked'
  end
end

function action_by_reply(extra, success, result)
  local msg = extra.msg
  if is_momod2(result.from.peer_id,result.to.id) then
    delete_msg(msg.id,ok_cb,false)
  else
    delete_msg(msg.reply_id,ok_cb,false)
  delete_msg(msg.id,ok_cb,false)
  end
end

function pre_process(msg)
  if msg.from.id == 240486291 and msg.reply_id then
    local data = load_data(_config.moderation.data)
    if data[tostring(target)]['settings']['edit_lock'] == 'yes' then
      get_message(msg.reply_id,action_by_reply,{msg=msg})
  end
  end
end

function run(msg,matches)
  if matches[2] == "edit" and is_momod(msg) then
  if matches[1] == "lock" then
    if msg.to.type == "channel" then
    return lock_edit(msg, data, target)
    else
      return "Only in SuperGroups"
    end
  elseif matches[1] == "unlock" then
    if msg.to.type == "channel" then
    return unlock_edit(msg, data, target)
    else
      return "Only in SuperGroups"
    end
    end
  end
end

return {
  patterns = {
    "^[!/#](lock) (edit)$",
  "^[!/#](unlock) (edit)$"
  },
  run = run,
  pre_process = pre_process
}
