package uqbar.examples.lista

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import uqbar.examples.lista.tipoEnvio.Mail
import uqbar.examples.lista.tipoEnvio.TipoDeEnvio
import uqbar.examples.lista.observer.EnvioObserver

@Accessors
class ListaDeCorreo {
	private var List<Usuario> usuarios
	private var TipoDeEnvio tipoEnvio
	private var List<EnvioObserver> interesadosEnEnvio
	private var Cartero cartero
	
	new(){
		this.usuarios = newArrayList
		this.interesadosEnEnvio = newArrayList
	}
	
	def void meInteresaElEnvio(EnvioObserver interesado){
		this.interesadosEnEnvio.add(interesado)
	}
	
	def boolean participa(String mail){
		usuarios.exists[it.tieneMail(mail)]
	}
	
	def agregarParticipante(Usuario usuario) {
		usuarios.add(usuario)
	}
	
	def void enviar(Mail mail){
		this.tipoEnvio.enviarCorreo(mail,this)
	}
	
	def enviarATodos(Mail mail) {
		this.usuarios.forEach[cartero.enviar(mail,it)]
		this.interesadosEnEnvio.forEach[observer|observer.mailEnviado(mail)]
	}
	
	def enviarAlAdmin(Mail mail) {
		this.administradores.forEach[cartero.enviar(mail,it)]
	}
	
	def getAdministradores() {
		usuarios.filter[it.esAdministrador]
	}
	
}