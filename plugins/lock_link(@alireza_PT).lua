--by @alireza_PT (@CliApi)

--Our channel: @create_antispam_bot

local function run(msg, matches)
if msg.to.type == 'channel' then
    if is_owner(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_link'] then
                lock_link = data[tostring(msg.to.id)]['settings']['lock_link']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_link == "yes" and not is_momod(msg) then
        send_large_msg(chat, 'کاربر ('..msg.from.first_name..')['..msg.from.id..'] به دلیل ارسال تبلیغات اخراج شد')
		delete_msg(msg.id,ok_cb,false)
        kick_user(msg.from.id, msg.to.id)
    end
end
end
return {patterns = {
    "[Hh][Tt][Tt][Pp][Ss][:][/][/]",
    "[Hh][Tt][Tt][Pp][:][/][/]",
    "https?://[%w-_%.%?%.:/%+=&]+%",
    "[Hh][Tt][Tt][Pp][Ss]",
    "[Hh][Tt][Tt][Pp]",
}, run = run}
--by @alireza_PT (@CliApi)

--Our channel: @create_antispam_bot