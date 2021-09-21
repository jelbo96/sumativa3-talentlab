package com.tiendavirtual.data.controllers;



import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tiendavirtual.data.models.Usuario;
import com.tiendavirtual.data.services.UsuarioService;



@Controller
@RequestMapping("/")
public class IndexController {

	private final UsuarioService uservice;
	public IndexController(UsuarioService usuarioService) {
		this.uservice = usuarioService;
	}

	@RequestMapping("")
	public String indexUsuario( HttpSession session) {
		if(session.getAttribute("userId") != null) {
			return "index.jsp";
		}
		else {
			return "redirect:/login";
		}
	}

	@RequestMapping("/login")
	public String loginUsuario() {
		return "login.jsp";
	}


	//Registro
	@RequestMapping("/registrar")
	public String registrarUsuario(@ModelAttribute("usuario") Usuario usuario,Model model) {
		return "registrar.jsp";
	}

	@RequestMapping(value="/guardar", method = RequestMethod.POST)
	public String crearUsuario(@Valid @ModelAttribute("usuario") Usuario usuario, Model model) {
		if(usuario.getNombre().isBlank() || usuario.getEmail().isBlank()) {
			model.addAttribute("error", "Todos los campos son requeridos!");
			return "registrar.jsp";
		}
		System.out.println("crear "+ usuario.getNombre() + " " + " " + usuario.getEmail());
		Usuario user = uservice.save(usuario);
		return "redirect:/venta";
	}

	//Ingresar
	@RequestMapping("/ingresar")
	public String ingresar(@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpSession session
			) {
		boolean exiteUsuario = uservice.validarUser(email, password);
		if(exiteUsuario) {
			Usuario user = uservice.findByEmail(email);
			//guardando un elemento en session
			session.setAttribute("userId", user.getId());
			return "redirect:/venta";
		}

		return "redirect:/login";
	}


	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		if(session.getAttribute("userId")!=null) {
			session.invalidate();//matamos todas las variables de session
		}
		return "redirect:/login";
	}


}