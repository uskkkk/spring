package com.rakki.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rakki.domain.MemberVo;
import com.rakki.domain.PaymentVo;
import com.rakki.service.BuyingService;
import com.rakki.service.MemberService;
import com.rakki.service.MemberServiceImpl;
import com.rakki.service.PaymentService;
import com.rakki.service.SellingService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller @Log4j
@RequestMapping("/common/*")
public class CommonController {
	@Autowired @Setter @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberServiceImpl impl;
	@Autowired
	private PaymentService paymentService;	
	@Autowired
	private BuyingService buyingService;	
	@Autowired
	private SellingService sellingService;	
	
	MemberVo membervo;
	
	
	// 로그인
	@GetMapping("login")
	public String login(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		
		if(error != null) {
			model.addAttribute("error", "Login error check your account");
		}
		if(logout != null) {
			model.addAttribute("logout", "logout");
		}
		return "/common/login";
	}
//	@PostMapping("login")
//	public String login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//		req.setCharacterEncoding("utf-8");
//		String id = req.getParameter("id");
//		String pwd = req.getParameter("password");
//		if(true) {
//			HttpSession session = req.getSession();
//			session.setAttribute("member", memberService.login(id));
//			log.info("로그인 성공");
//		} else {
//			log.info("로그인 실패");
//		}
//		
//		memberService.login(id);
//		
//		return "/rakki/main";
//	}
	
	@GetMapping("logout")
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.getSession().invalidate();
		resp.sendRedirect("/rakki/main");
	}
	/* 김우성
	 * 2021-10-29
	 * 이용약관 페이지 처리*/
	@GetMapping("tos")
	public void tos(){
		
	}
	
	/* 김우성
	 * 2021-10-26
	 * 회원가입 페이지 처리*/
	@GetMapping("join")
	public void join(){
		
	}
	/* 김우성
	 * 2021-11-02
	 * 회원가입 기능 처리
	 *
	 * */
	@PostMapping("join")
	public String join(@RequestParam Map<String, Object> member) throws Exception {
		log.info("join");
		
		System.out.println(member);
		member.put("password", encoder.encode((CharSequence) member.get("password")));
		memberService.insertMember(member);
		member.put("auth", "ROLE_MEMBER");
		memberService.insertAuth(member);
		
		return "redirect:/rakki/main";
		
	}
	
	
	/* 김우성
	 * 2021-10-26
	 * 마이페이지 페이지 처리*/
	@PreAuthorize("isAuthenticated()")
	@GetMapping("mypage")
	public void myPage() {
		log.info("마이페이지");
		
	}
	
	/* 김우성
	 * 2021-10-28
	 * 구매내역 페이지 처리*/
	@PreAuthorize("isAuthenticated()")
	@GetMapping("buying")
	public void buying(String id, Model model) {
		log.info("구매내역");
		model.addAttribute("count",buyingService.getBuyingCount(id));  //구매건수취득
		model.addAttribute("list",buyingService.getBuyingList(id));    //구매리스트취득
		
	}
	
	/* 김우성
	 * 2021-10-28
	 * 판매내역 페이지 처리*/
	@PreAuthorize("isAuthenticated()")
	@GetMapping("selling")
	public void selling(String id, Model model) {
		log.info("판매내역::" + id);
		//log.info(sellingService.getSellingCount(id));
		//sellingService.getSellingList(id).forEach(log::info);
		model.addAttribute("count",sellingService.getSellingCount(id));  //판매건수취득
		model.addAttribute("list",sellingService.getSellingList(id));    //판매리스트취득
		
	}
	
	/* 김우성
	 * 2021-10-28
	 * 관심상품 페이지 처리*/
	@PreAuthorize("isAuthenticated()")
	@GetMapping("wish")
	public String wish() {
		log.info("관심상품");
		
		return "/common/wish";
	}
	
	
	/* 김우성
	 * 2021-10-28
	 * 프로필 정보 페이지 처리
	 * */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("userModify")
	public void userModify() {
		log.info("프로필 정보");
	}
	/* 김우성
	 * 2021-11-04
	 * 회원 정보 수정 처리*/
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("userModify")
	public String userModify(@RequestParam MemberVo member, HttpSession session) throws Exception {
		
		String rowPassword = member.getPassword();
		String encPassword = encoder.encode(rowPassword);
		memberService.modify(member);
		
		session.invalidate();
		
		log.info(".. 회원 정보 수정.. ");
		return "redirect:/rakki/main";
	}	
	
	@GetMapping("deleteUser")
	public void deleteUser() {
		
	}
	
	/* 김우성
	 * 2021-11-04
	 * 회원 탈퇴 기능 처리*/
	@PostMapping("deleteUser") 
	public String deleteUser(MemberVo vo, HttpSession session, RedirectAttributes rttr) {
		log.info("회원 탈퇴 성공");
		
		
		
		memberService.delete(vo.getId());
		memberService.deleteAuth(vo.getId());
		session.invalidate();
		
		return "redirect:/rakki/main";
		
		
	}
	
	
	
	/* 김우성
	 * 2021-10-30
	 * 주소록 페이지 처리*/
	@PreAuthorize("isAuthenticated()")
	@GetMapping("address")
	public void address() {
		log.info("주소록");
		
	}
	
	/*
	 * @김기락
	 * 2021-11-02
	 * 주소록 등록 페이지 연결
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("addressMod")
	public String addressMod(){
		log.info("addressMod");
		return "/common/addressMod";
	}

	
	/*
	 * @김기락
	 * 2021-11-03
	 * 주소록 등록 페이지 연결
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("addressReg")
	public String addressReg(){
		log.info("addressReg");
		return "/common/addressReg";
	}
	
	
	/* 김우성
	 * 2021-10-30
	 * 결제 정보 페이지 처리*/
	@PreAuthorize("isAuthenticated()")
	@GetMapping("payment")
	public void payment(int mno, Model model) {
		log.info("결제 정보::" +mno);
		model.addAttribute("list",paymentService.getList(mno));
		model.addAttribute("mno",mno);
		
	}
	
	/* 서정목
	 * 2021-10-30
	 * 결제 정보 페이지 처리*/
	@PreAuthorize("isAuthenticated()")
	@PostMapping("payment")
	public String payment(PaymentVo pay, RedirectAttributes rttr) {
		log.info("결제 정보::" + pay.getPayment_no());
		rttr.addFlashAttribute("result",  pay.getPayment_no() + "을 삭제하였습니다.");
		return "redirect:/common/payment?mno=" + pay.getMno();
	}
	
	/* 서정목
	 * 2021-11-03
	 * 결제 정보 : 새카드 추가 */	
	@PreAuthorize("isAuthenticated()")	
	@GetMapping("paymentReg")
	public void paymentReg(Model model) {
		log.info("결제 정보 추가");
		//model.addAttribute("list",paymentService.getList(mno));
		
	}
	
	/* 서정목
	 * 2021-11-03
	 * 결제 정보 : 새카드 추가 */	
	@PreAuthorize("isAuthenticated()")	
	@PostMapping("paymentReg")
	public String paymentReg(PaymentVo pay, RedirectAttributes rttr) {
		log.info("결제 정보 추가 POST pay::" + pay);
		paymentService.add(pay);
		rttr.addFlashAttribute("result", pay.getPayment_no() + "을 등록하였습니다.");
		return "redirect:/common/payment?mno=" + pay.getMno();
	}
	
	/* 서정목
	 * 2021-11-03
	 * 결제 정보 : 카드 삭제 */	
	@PreAuthorize("isAuthenticated()")	
	@GetMapping("paymentRmv")
	public void paymentRmv(int payment_no, Model model) {
		log.info("결제 정보 삭제");
		model.addAttribute("payment",paymentService.get(payment_no));		
	}
	
	/* 서정목
	 * 2021-11-03
	 * 결제 정보 : 카드 삭제 */	
	@PreAuthorize("isAuthenticated()")	
	@PostMapping("paymentRmv")
	public String paymentRmv(PaymentVo pay, RedirectAttributes rttr) {
		log.info("결제 정보 삭제 POST pay::" + pay);
		paymentService.remove(pay.getPayment_no());
		rttr.addFlashAttribute("result", pay.getPayment_no() + "을 삭제하였습니다.");
		return "redirect:/common/payment?mno=" + pay.getMno();
	}	
	
	/* 서정목
	 * 2021-11-03
	 * 결제 정보 : 카드 수정 */	
	@PreAuthorize("isAuthenticated()")	
	@GetMapping("paymentMod")
	public void paymentMod(int payment_no, Model model) {
		log.info("결제 정보 수정");
		model.addAttribute("payment",paymentService.get(payment_no));		
	}
	
	/* 서정목
	 * 2021-11-03
	 * 결제 정보 : 카드 수정 */	
	@PreAuthorize("isAuthenticated()")	
	@PostMapping("paymentMod")
	public String paymentMod(PaymentVo pay, RedirectAttributes rttr) {
		log.info("결제 정보 수정 POST pay::" + pay);
		paymentService.modify(pay);
		rttr.addFlashAttribute("result", pay.getPayment_no() + "을 수정하였습니다.");
		return "redirect:/common/payment?mno=" + pay.getMno();
	}	
	
}
