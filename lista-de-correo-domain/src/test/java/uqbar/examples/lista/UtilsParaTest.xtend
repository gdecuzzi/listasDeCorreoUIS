package uqbar.examples.lista

class UtilsParaTest {
	def static Usuario crearParticipante(String mail){
		var usuario = new Usuario
		usuario.agregarMail(mail)
		usuario
	}
}