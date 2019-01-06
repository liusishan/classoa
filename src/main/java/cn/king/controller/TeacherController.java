package cn.king.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Title:
 * @CreateTime: 2018/12/28 10:00
 * @Author: king
 * @Description:
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {

    /**
     * @param: []
     * @return: java.lang.String
     * @auther: king
     * @date: 2019/1/6 15:34
     * @description: 跳转到作业管理页面
     */
    @RequestMapping("/task")
    public String task() {
        return "teacher/task";
    }
}
