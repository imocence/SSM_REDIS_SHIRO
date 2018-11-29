package com.llft.dao.im;

import com.llft.dao.DaoSupport;
import com.llft.entity.Page;
import com.llft.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/*****************************
 *   @author GuoYaNan        *
 *   @date 2018/11/24 9:50   *
 *   @email gyn@yixutech.com *
 ****************************/

@Service("BroadcastDao")
public class BroadcastDao {


    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**新增
     * @param pd
     * @throws Exception
     */
    public void save(PageData pd)throws Exception{
        dao.save("BroadcastMapper.save", pd);
    }

    /**列表
     * @param page
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<PageData> list(Page page)throws Exception{
        return (List<PageData>)dao.findForList("BroadcastMapper.datalistPage", page);
    }

}
