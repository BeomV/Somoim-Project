package test.com.moim.point.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.community.service.CommunityService;
import test.com.moim.point.model.PointVO;
import test.com.moim.point.service.PointService;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.somoim.service.SomoimService;
import test.com.moim.userinfo.model.UserinfoVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.util.List;

@Slf4j
@Controller
public class PointController {

    @Autowired
    PointService service;

    @Autowired
    HttpSession session;


    @RequestMapping(value = "/point_selectAll.do", method = RequestMethod.GET)
    public String point_selectAll(String message,PointVO vo,Model model) {

        log.info("point_selectAll.do()......{}", vo);

        List<PointVO> vos = service.selectList(vo);

        model.addAttribute("vos", vos);

        if (message != null)
            message = "아이디/비밀번호를 확인하세요";
        model.addAttribute("message", message);



        return "point/point_selectAll";



    }

    @RequestMapping(value = "/point_purchase.do", method = RequestMethod.POST)
    @ResponseBody
    public String point_purchase(PointVO vo, UserinfoVO uvo, HttpServletRequest request) {

        log.info("point_purchase.do()......{}", vo);

        String userID = (String) request.getSession().getAttribute("user_id");

        uvo.setUser_id(userID);
        UserinfoVO uvo2 = service.POINT_SELECT_ONE(uvo);

        log.info("현재 보유하고 있는 포인트: "+uvo2.getPoint());

        if(uvo2.getPoint() < vo.getPoint()){
            log.info("부족함");
            return "fail";
        }
        else{
            log.info("부족하지 않음");
            uvo.setPoint(vo.getPoint());
            uvo.setItem_list(vo.getItem());
            service.purchase(uvo);
            return "success";
        }
    }

    @RequestMapping(value = "/kakaopay.do")
    @ResponseBody
    public String kakaopay(){

        try {
            URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
            HttpURLConnection conn = (HttpURLConnection) address.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "KakaoAK 519df8273fbeec940c4ad50145c6db34");
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setDoOutput(true);
            String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id" +
                    "&item_name=초코파이&quantity=1&total_amount=1000&vat_amount=200&tax_free_amount=0" +
                    "&approval_url=http://localhost:8088/point_selectAll.do" +
                    "&fail_url=http://localhost:8088/point_selectAll.do" +
                    "&cancel_url=http://localhost:8088/point_selectAll.do";
            OutputStream os = conn.getOutputStream();
            DataOutputStream dout = new DataOutputStream(os);
            dout.writeBytes(param);
            dout.close();

            int result = conn.getResponseCode();

            InputStream is;
            if(result==200){
                is = conn.getInputStream();

            }else{
                is = conn.getErrorStream();

            }
            InputStreamReader reader = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(reader);
            return br.readLine();


        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }



}
