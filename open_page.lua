---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by baldwin.
--- DateTime: 2020/09/04 下午17:20
---
--- requires
---
api = require("api")
nlucore = require("nlucore")
dmcore = require("dmcore")

env = dmcore.get_request_basic_env()

info = {
    ["skill_robot_dialog_api"] = "http://172.16.231.37:17003/skill/robot/dialog",
    --["skill_robot_dialog_api"] = "http://beta-jiedai.ainirobot.com/skill/robot/dialog",
    --["skill_robot_dialog_api"] = "http://jiedai.ainirobot.net/skill/robot/dialog",
    ["device_id"] = env.device_id,
    ["request_sn"] = env.request_sn,
    ["skill_name"] = "ainirobot.skill.passthrough.skillresponse",
}

debug = true

function log(msg, value)
    if debug == false then
        return
    end
    dmcore.log({msg, value})
end

function set_response_answer_feed(data)
    dmcore.add_dm_response_feed(info.skill_name,
            {
                ["mini_info"] = {
                    ["raw_response"] = data,
                }
            })
    dmcore.set_return_action(dmcore.DM_ACTION_RETURN_TO_USER_NO_NEXT_ROUND)
end

function generate_doudi_response()
    dmcore.set_return_action(dmcore.DM_ACTION_RETURN_TO_USER_NO_NEXT_ROUND)
    dmcore.add_dm_response_text("我没有听懂你说什么")
end

function generateRequestParam(intent)
    local user_semantics = dmcore.get_old_user_semantics()
    log("user_semantics", user_semantics)
    if user_semantics == nil then
        return nil
    end

    local query = nlucore.get_nlu_parsed_query()
    log("query", query)
    if query == nil then
        return nil
    end

    return {
        context = {
            System = {
                device = {
                    deviceId = user_semantics.deviceid,
                    deviceType = user_semantics.device_type,
                    lang = "zh_CN", -- todo
                    lat = user_semantics.lat,
                    lng = user_semantics.lng,
                    osType = user_semantics.os_type,
                    sys_lang = "auto", -- todo
                    version = user_semantics.version
                },
                params = {
                    date = user_semantics.date,
                    lng = user_semantics.lng,
                    app_version = "", -- todo
                    os_version = user_semantics.os_version,
                    device_type = user_semantics.device_type,
                    enterprise_id = "orion.ovs.entprise.6706610866", -- todo
                    deviceid = user_semantics.deviceid,
                    version = user_semantics.version,
                    ovs_sdk_version = user_semantics.ovs_sdk_version,
                    group_id = "", -- todo
                    ovs_sdk_os = user_semantics.ovs_sdk_os,
                    os_type = user_semantics.os_type,
                    model = user_semantics.model,
                    ovs_sdk_version_name = user_semantics.ovs_sdk_version_name,
                    skill_status = user_semantics.skill_status,
                    lat = user_semantics.lat
                }
            }
        },
        request = {
            asr = {
                text = query
            },
            nlu = {
                semantics_flag = 1,
                query = query,
                moduleInfo = {
                    ["len(ner)"] = 13,
                    grammar = {
                        nlp = { {
                                    slots = {
                                        page = { {
                                                     dict_name = intent.dict_name,
                                                     slot_type = intent.slots[1].slot_type,
                                                     text = intent.slots[1].text,
                                                     value = intent.slots[1].value,
                                                 } }
                                    },
                                    slot_num = 1,
                                    classify_type = "user_define_grammar",
                                    query = query,
                                    domain = "打开页面",
                                    grammar_id = "5c8a07092ebec37100524d60",
                                    matched_level = user_semantics.client_id,
                                    source = "grammar_platform",
                                    intent = "open_page",
                                    version = "1.1000",
                                    english_domain = "open_page"
                                } }
                    },
                    --ner = {
                    --    groupner = { {
                    --                     text = "馆",
                    --                     tag = "group_mall_search_suffix",
                    --                     value = "馆"
                    --                 }, {
                    --                     text = "信息",
                    --                     tag = "group_mall_search_recommend",
                    --                     value = "信息"
                    --                 } }
                    --},
                    --entity = {
                    --    groupner = { {
                    --                     text = "馆",
                    --                     tag = "group_mall_search_suffix",
                    --                     value = "馆"
                    --                 }, {
                    --                     text = "信息",
                    --                     tag = "group_mall_search_recommend",
                    --                     value = "信息"
                    --                 } }
                    --}
                },
                asrText = query,
                source = "grammar_platform",
                intent = "open_page",
                english_domain = "open_page",
                slots = {
                    page = { {
                                 dict_name = intent.slots[1].dict_name,
                                 slot_type = intent.slots[1].slot_type,
                                 text = intent.slots[1].text,
                                 value = intent.slots[1].value
                             } }
                },
                domain = "打开页面",
                sn = info.request_sn,
                current_time = api.get_time_string().currentTime
            },
            type = "IntentRequest"
        },
        session = {
            application = {
                client = {
                    clientId = user_semantics.client_id,
                    enterprise = {
                        enterpriseId = "orion.ovs.entprise.6706610866"
                    }
                },
                skill = {
                    skillId = "orion.ovs.skill.1550307270891",
                    skillStatus = user_semantics.skill_status
                }
            },
            sessionId = "385cf22f-7c1f-6488-c054-60164705154d_auto_test_sn",
            user = {
                isLogin = true,
                openId = "bb9a47e0802209359aaf20f804223490",
                voiceprintExists = false,
                voiceprintPay = false
            }
        },
        version = "0.2.0"
    }
end

function skillRobotDialogRequest(intent)
    return api.request(info.skill_robot_dialog_api, "POST", generateRequestParam(intent), {
        ["Content-Type"] = "application/json",
    }, {
        ["timeout"] = 10,
    })
end

function process()
    local bestIntent = nlucore.get_best_intent()
    if bestIntent == nil then
        log("get best intent error")
        return false
    end
    log("bestIntent", bestIntent)

    local data = skillRobotDialogRequest(bestIntent)
    if data == nil then
        log("request skill robot dialog error")
        return false
    end

    log("data", data)
    set_response_answer_feed(data)
    return true
end

function main()
    dmcore.set_best_nlu_parsed_intent_as_dialog_intent()
    dmcore.set_best_nlu_parsed_slots_as_dialog_slots()

    log("open page start", api.get_unix_timestamp())
    if process() ~= true then
        generate_doudi_response()
    end

    log("open page end", api.get_unix_timestamp())
end

-- 入口函数
main()
