package ITzy.admin.aop;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import ITzy.admin.dto.MemberDto;

/*
  			AOP(Aspect Oriented Programming) : 관점지향프로그래밍
  			목적 : 감시  ex) logger, check session
 */
@Aspect
public class AopProc {
	
//	@Around("within(ITzy.admin.controller.*) or within(ITzy.admin.dao.*.*)") -> sessionCheck를 위해 주석
	@Around("within(ITzy.admin.controller.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable{
		
		// session check : membercontroller를 package 이동시켜야 무한루프에서 벗어남
		/*
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		if (request != null) {
			HttpSession session = request.getSession();
			MemberDto login = (MemberDto)session.getAttribute("login");
			if (login ==null) {
				return "redirect:/sessionOut.do";		//logout
			}
		}
		*/
		// logger
		String signatureStr = joinpoint.getSignature().toShortString();
		
		// 실행시
		try {
			Object obj = joinpoint.proceed();											
			System.out.println("AOP log:" + signatureStr + "메소드 실행 " + new Date());
			return obj;
		// 종료시
		} finally {
//			System.out.println("실행후:" + System.currentTimeMillis());
		}
	}
	
}
