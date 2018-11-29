import io.rong.RongCloud;
import io.rong.methods.user.User;
import io.rong.models.Result;
import io.rong.models.response.TokenResult;
import io.rong.models.user.UserModel;
import org.junit.Test;

public class testUser {
    private static final String appKey = "8w7jv4qb828ey";
    private static final String appSecret = "GwzDca3fWZQb1";
    private static final String api = "http://api.cn.ronghub.com";

    public testUser() {
    }
    @Test
    public void testUserReg() throws Exception{
        RongCloud rongCloud = RongCloud.getInstance(appKey, appSecret);
        User User = rongCloud.user;
        UserModel user = (new UserModel()).setId("1").setName("cloud0072").setPortrait("http://www.rongcloud.cn/images/logo.png");
        TokenResult result = User.register(user);
        System.out.println("getToken:  " + result.toString());
        Result refreshResult = User.update(user);
        System.out.println("refresh:  " + refreshResult.toString());
    }
}