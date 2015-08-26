package uqbar.examples.lista.observer

import uqbar.examples.lista.tipoEnvio.Mail

interface EnvioObserver {
	
	def void mailEnviado(Mail mail)
	
}