package uqbar.examples.lista.tipoEnvio

interface Mail {
	
	def String getFrom()
	
	def boolean isEstaAprobado()
	
	def void setEstaAprobado(boolean b)
	
	def String body()
	
}