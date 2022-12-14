package com.example.demo.controller;

import com.example.demo.domain.Message;
import com.example.demo.domain.User;
import com.example.demo.repository.MessageRepo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller

public class MainController {
	private final MessageRepo messageRepo;

	@Value("${upload.path}")
	private String uploadPath;

	public MainController(MessageRepo messageRepo) {
		this.messageRepo = messageRepo;
	}

	@GetMapping("/")
	public String greeting() {
		return "greeting";
	}

	@GetMapping("/main")
	public String main (@RequestParam(required = false, defaultValue = "") String filter,
						Model model)
	{
		Iterable <Message> messages = messageRepo.findAll();

		if (filter != null && !filter.isEmpty()){
			messages = messageRepo.findByName(filter);
		}else{
			messages = messageRepo.findAll();
		}

		model.addAttribute("messages", messages);
		model.addAttribute("filter", filter);
		return "main";
	}

	@PostMapping("/main")
	public String add(
			@AuthenticationPrincipal User user,
			@RequestParam String name,
			@RequestParam String tag, Map <String, Object> model,
			@RequestParam("file") MultipartFile file)
			throws IOException {
		Message message = new Message(name, tag, user);

		if(!file.isEmpty() && !file.getOriginalFilename().isEmpty()){
			File uploadDir = new File(uploadPath);

			if (!uploadDir.exists()){
				uploadDir.mkdirs();
			}

			String uuidFile = UUID.randomUUID().toString();
			String resultFilename = uuidFile + "." + file.getOriginalFilename();

			file.transferTo(new File(uploadPath + "/" + resultFilename));

			message.setFilename(resultFilename);
		}

		messageRepo.save(message);
		Iterable <Message> messages = messageRepo.findAll();
		model.put("messages", messages);
		model.put("filter", "");
		return "main";
	}

}