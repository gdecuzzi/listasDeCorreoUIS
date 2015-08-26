package uqbar.examples.lista.tipoEnvio

import uqbar.examples.lista.ListaDeCorreo

class Moderada implements TipoDeEnvio{
	
	override enviarCorreo(Mail mail, ListaDeCorreo lista) {
		if(mail.estaAprobado){
			lista.enviarATodos(mail)
		}else{
			lista.enviarAlAdmin(crearMailDePendienteDeRevision(mail))
		}
	}
	
	
	
	
	
	def Mail crearMailDePendienteDeRevision(Mail mail) {
		mail
	}
	
}