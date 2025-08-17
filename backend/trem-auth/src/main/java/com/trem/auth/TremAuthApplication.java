package com.trem.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class TremAuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(TremAuthApplication.class, args);
	}
}

@RestController
class HttpController {
	@GetMapping("/public")
	String publicRoute() {
		return "<h1>Public route, feel free to look around! 🔓 </h1>";
	}

	@GetMapping("/private")
	String privateRoute(@AuthenticationPrincipal OidcUser principal) {
		return String.format("""
				<h1>Private route, only authorized personal! 🔐  </h1>
				""");
	}

	@GetMapping("/jwt")
	String jwt(@AuthenticationPrincipal Jwt jwt) {
		return String.format("""
				Principal: %s\n
				Email attribute: %s\n
				JWT: %s\n
				""", jwt.getClaims(), jwt.getClaim("email"), jwt.getTokenValue());
	}
}