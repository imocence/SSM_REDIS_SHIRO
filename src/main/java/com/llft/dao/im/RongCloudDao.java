package com.llft.dao.im;

import io.rong.RongCloud;
import io.rong.methods.message._private.Private;
import io.rong.methods.user.User;
import io.rong.models.message.PrivateMessage;
import io.rong.models.response.ResponseResult;
import io.rong.models.response.TokenResult;
import io.rong.models.user.UserModel;

import org.springframework.stereotype.Service;

/*****************************
 *   @author GuoYaNan        *
 *   @date 2018/11/28 16:44   *
 *   @email gyn@yixutech.com *
 ****************************/
@Service("RongCloudDao")
public class RongCloudDao {

    private static final String appKey = "z3v5yqkbz1zv0";
    private static final String appSecret = "mt817Jzvcns";

    private TokenResult getRongCloudToken(String userID, String userName) {
        RongCloud rongCloud = RongCloud.getInstance(appKey, appSecret);
        User User = rongCloud.user;
        UserModel user = (new UserModel()).setId(userID).setName(userName);
        try {
            TokenResult result = User.register(user);
            User.update(user);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResponseResult sendMessage(PrivateMessage mes) {
        try {
            RongCloud rongCloud = RongCloud.getInstance(appKey, appSecret);
            Private p = rongCloud.message.msgPrivate;
            return p.send(mes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
