package com.llft.service.im;

import com.llft.entity.Page;
import com.llft.util.JsonResult;
import com.llft.util.PageData;

public interface BroadcastService {
    JsonResult sendMessage(PageData pageData);

    JsonResult getMessList(Page page);

    JsonResult recall(PageData pageData);
}
