package uqbar.examples.lista

import uqbar.examples.lista.tipoEnvio.Mail

interface Cartero {
	
	def void enviar(Mail mail, Usuario usuario)
	
}