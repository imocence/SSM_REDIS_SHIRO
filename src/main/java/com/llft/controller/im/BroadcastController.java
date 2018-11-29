package com.llft.controller.im;

import com.llft.controller.base.BaseController;
import com.llft.entity.Page;
import com.llft.service.im.BroadcastService;
import com.llft.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/broadcast")
public class BroadcastController extends BaseController {

    @Autowired
    BroadcastService broadcastService;


    /**
     * sendMessage
     * 保存发送消息
     *
     * @return
     */
    @RequestMapping(value = "/send", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult sendMessage() {
        return broadcastService.sendMessage(this.getPageData());
    }


    /**
     * getMessageList
     * 获取历史消息列表
     *
     * @return
     */
    @RequestMapping(value = "/getMessageList", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult getMessageList(Page page) {
        page.setPd(this.getPageData());
        return broadcastService.getMessList(page);
    }


    /**
     * recall
     * 撤回消息（仅支持撤回自己发送的消息，无时间限制）
     *
     * @return
     */
    @RequestMapping(value = "/recallMessage", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult recallMessage(){
        return broadcastService.recall(this.getPageData());
    }
}
