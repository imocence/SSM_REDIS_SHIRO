package com.llft.service.im.impl;

import com.llft.dao.im.BroadcastDao;
import com.llft.dao.im.RongCloudDao;
import com.llft.entity.Page;
import com.llft.entity.ResponseCode;
import com.llft.service.im.BroadcastService;
import com.llft.util.JsonResult;
import com.llft.util.PageData;
import io.rong.messages.ImgMessage;
import io.rong.messages.ImgTextMessage;
import io.rong.messages.TxtMessage;
import io.rong.messages.VoiceMessage;
import io.rong.models.message.PrivateMessage;
import io.rong.models.response.ResponseResult;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BroadcastServiceImpl implements BroadcastService {

    @Resource(name = "BroadcastDao")
    private BroadcastDao broadcastDao;

    @Resource(name = "RongCloudDao")
    private RongCloudDao rongCloudDao;

    /**
     * sendMessage
     * 发送消息
     *
     * @param pageData
     * @return
     */
    public JsonResult sendMessage(PageData pageData) {
        //TODO 获取用户信息，之后由接口提供
        Map user = getUserInfo(1);
        pageData.put("senderID", user.get("id"));
        JsonResult JsonResult = new JsonResult();
        if (checkPbIsEmpty(pageData, JsonResult)) return JsonResult;
        try {
            //objectName content
            String targetID = pageData.getString("target_id");
            String[] targets = {targetID};
            String objectName = pageData.getString("objectName");
            PrivateMessage mes = new PrivateMessage();
            mes.setSenderId(pageData.getString("senderID"));
            mes.setTargetId(targets);
            switch (Integer.valueOf(objectName)) {
                case 1:
                    // 文本消息
                    TxtMessage txtMessage = new TxtMessage(pageData.getString("content"), user.toString());
                    mes.setObjectName(txtMessage.getType());
                    mes.setContent(txtMessage);
                    break;
                case 2:
                    // 图片消息
                    ImgMessage imgMessage = new ImgMessage(pageData.getString("content"), user.toString(), pageData.getString("imgUrl"));
                    mes.setObjectName(imgMessage.getType());
                    mes.setContent(imgMessage);
                    break;
                case 3:
                    // 图文消息
                    ImgTextMessage imgTextMessage = new ImgTextMessage(pageData.getString("content"), user.toString(), pageData.getString("title"), pageData.getString("imgUrl"), pageData.getString("url"));
                    mes.setObjectName(imgTextMessage.getType());
                    mes.setContent(imgTextMessage);
                    break;
                case 4:
                    // 语音消息
                    VoiceMessage voiceMessage = new VoiceMessage(pageData.getString("content"), user.toString(), Long.parseLong(pageData.getString("duration")));
                    mes.setObjectName(voiceMessage.getType());
                    mes.setContent(voiceMessage);
                    break;
                default:
                    return null;
            }
            ResponseResult responseResult = rongCloudDao.sendMessage(mes);
            if (responseResult.code != 200 || responseResult == null) {
                JsonResult.setDesc(responseResult.msg);

                JsonResult.setCode(ResponseCode.PARAMS_ERROR);
                return JsonResult;
            }
            broadcastDao.save(pageData);
            JsonResult.setDesc("保存成功");
        } catch (Exception e) {
            e.printStackTrace();
            JsonResult.setCode(ResponseCode.DATABASE_ERROR);
            JsonResult.setDesc(e.toString());
        }
        return JsonResult;
    }

    /**
     * getMessList
     * 获取历史消息列表
     *
     * @param page
     * @return
     */
    public JsonResult getMessList(Page page) {
        JsonResult jsonResult = new JsonResult();
        try {
            List<PageData> listData = broadcastDao.list(page);
            jsonResult.setDatas(listData);
            return jsonResult;
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(ResponseCode.DATABASE_ERROR, e.toString());
        }
    }

    public JsonResult recall(PageData pageData) {
        JsonResult jsonResult = new JsonResult();

        return jsonResult;
    }

    private boolean checkPbIsEmpty(PageData pageData, JsonResult jsonResult) {
        if (pageData.isEmpty()) {
            jsonResult.setDesc("参数不合法");
            jsonResult.setCode(ResponseCode.PARAMS_ERROR);
            return true;
        }
        return false;
    }

    private HashMap getUserInfo(Integer id) {
        HashMap user = new HashMap();
        if (id == 1) {
            user.put("id", "1");
            user.put("userName", "guoyanan");

        } else {
            user.put("id", "2");
            user.put("userName", "gaolong");
        }
        return user;
    }

}
