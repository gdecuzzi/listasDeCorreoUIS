package uqbar.examples.lista.tipoEnvio

import uqbar.examples.lista.ListaDeCorreo

interface TipoDeEnvio {
	def void enviarCorreo(Mail mail, ListaDeCorreo lista)
}