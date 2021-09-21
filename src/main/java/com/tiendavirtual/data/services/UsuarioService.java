package com.tiendavirtual.data.services;

import java.util.List;

import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.tiendavirtual.data.models.Usuario;
import com.tiendavirtual.data.repositories.UsuarioRepository;


@Service
public class UsuarioService {

	private final UsuarioRepository userRepository;

	public UsuarioService(UsuarioRepository usuarioRepository) {
		this.userRepository = usuarioRepository;
	}

	public Usuario save(@Valid Usuario user) {
		// hash password
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		userRepository.save(user);
		return user;
	}


	public boolean validarUser(String email, String password) {

		Usuario user = userRepository.findByEmail(email);
		//siempre validar si es null
		if(user == null) {
			return false;
		}else {
			//comparar los password
			if (BCrypt.checkpw(password, user.getPassword())) {
				System.out.println("Password iguales");
				return true;

			}else {
				System.out.println("Password Distintos");
				return false;
			}

		}
	}


	public Usuario findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	public List<Usuario> findAll() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}


	/*public List<Usuario> findAll() {
	retorna una lista de usuarios
		return urepository.findAll();
	}

	public void eliminarUsuario(Long id) {
		urepository.deleteById(id);
	}

	public Usuario buscarUsuario(Long id) {
		Optional<Usuario> oUsuario= urepository.findById(id);
		if(oUsuario.isPresent()) {
			return oUsuario.get();
		}
		return null;
	}

	public void modificarUsuario(@Valid Usuario empleado) {
		urepository.save(empleado);
	} */

}