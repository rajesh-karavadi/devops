package dev.beacon.devops;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HelloController {
	@GetMapping("/hello")
	public String sayHello() {
		return " 26th-July Hello from production-ready app!";
	}

	@GetMapping("/health")
	public String healthCheck() {
		return ">> OK";
	}
}

