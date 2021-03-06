package com.tiendavirtual.data.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

import com.tiendavirtual.data.models.Producto;
import com.tiendavirtual.data.models.Usuario;
import com.tiendavirtual.data.services.ProductoService;


@Controller
@RequestMapping("/producto")
public class ProductoController {
	
   
    private final ProductoService pservice;
	public ProductoController(ProductoService productoService) {
		this.pservice = productoService;
	}
	
	@RequestMapping("")
	public String indexUsuario(@ModelAttribute("producto") Producto producto,Model model , HttpSession session) {
		if(session.getAttribute("userId") != null) {
			List<Producto> lista_productos = pservice.findAll();
			model.addAttribute("lista_productos", lista_productos);
			return "producto.jsp";
		}else {
			return "redirect:/login";
		}
	}
	


	@RequestMapping(value="/crear", method = RequestMethod.POST)
	public String crearProducto(@Valid @ModelAttribute("producto") Producto producto, Model model, HttpSession session) {
		
		if(session.getAttribute("userId") != null) {
			if(producto.getNombre().isBlank() || producto.getPrecio().isNaN() || producto.getCaracteristica().isBlank() || producto.getStock()== null) {
				model.addAttribute("error", "Todos los campos son requeridos!");
				List<Producto> lista_producto = pservice.findAll();
				model.addAttribute("lista_productos", lista_producto);
				return "producto.jsp";
			}
			Producto produ = pservice.insertarProducto(producto);
			return "redirect:/producto";
			
		}else {
			return "redirect:/login";
		}
		
		
		
		
		
	}
	
	@RequestMapping(value="/actualizar/{id}", method = RequestMethod.GET)
	public String actualizarProducto(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") != null) {
		Producto producto = pservice.buscarProducto(id);
		model.addAttribute("producto", producto);
		return "editar_producto.jsp";
		}
		else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/modificar",method= RequestMethod.PUT)
	public String modificarProducto(@Valid @ModelAttribute("producto") Producto producto, HttpSession session) {
		if(session.getAttribute("userId") != null) {
		System.out.println("el Id a modificar es: "+producto.getId());
		pservice.modificarProducto(producto);
		return "redirect:/producto";
		}
		else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/eliminar/{id}", method = RequestMethod.DELETE)
	public String eliminar(@PathVariable("id") Long id, HttpSession session) {
		if(session.getAttribute("userId") != null) {
		System.out.println("Eliminar id: "+ id);
		pservice.eliminarProducto(id);
		return "redirect:/producto";
		}
		else {
			return "redirect:/login";
		}
	}
	
}