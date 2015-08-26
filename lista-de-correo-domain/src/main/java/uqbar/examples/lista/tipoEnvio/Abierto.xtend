package uqbar.examples.lista.tipoEnvio

import uqbar.examples.lista.ListaDeCorreo

class Abierto implements TipoDeEnvio {
	override enviarCorreo(Mail mail, ListaDeCorreo lista) {
		lista.enviarATodos(mail)
	}
	
}