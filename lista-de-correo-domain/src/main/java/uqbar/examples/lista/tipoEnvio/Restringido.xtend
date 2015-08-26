package uqbar.examples.lista.tipoEnvio

import uqbar.examples.lista.tipoEnvio.TipoDeEnvio
import uqbar.examples.lista.ListaDeCorreo

class Restringido implements TipoDeEnvio {
	
	override enviarCorreo(Mail mail, ListaDeCorreo lista) {
		if(lista.participa(mail.from))
			lista.enviarATodos(mail)
		else
			throw new NoSePuedeEnviarException("El mail «mail» no participa en la Lista de correo")
	}
	
}