package uqbar.examples.lista

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	private var List<String> mails
	private var boolean esAdministrador
	
	new(){
		mails = newArrayList
		esAdministrador = false
	}
	
	def boolean tieneMail(String mail){
		mails.contains(mail)
	}
	
	def agregarMail(String mail) {
		mails.add(mail)
	}
	
}