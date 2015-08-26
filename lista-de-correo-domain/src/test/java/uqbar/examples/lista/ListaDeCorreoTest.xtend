package uqbar.examples.lista

import org.junit.Test

import static org.junit.Assert.*

class ListaDeCorreoTest {
	
	@Test
	def testUnaListaConEseMailDeUsuarioLoReconoce(){
		var lista = new ListaDeCorreo
		var mail = "a@b.com"
		lista.agregarParticipante(UtilsParaTest.crearParticipante(mail))
		
		assertTrue(lista.participa(mail))
	}
	
	@Test
	def testUnaListaSinEseMailDeUsuarioLoReconoce(){
		var lista = new ListaDeCorreo
		var mail = "a@b.com"
		lista.agregarParticipante(UtilsParaTest.crearParticipante(mail))
		
		assertFalse(lista.participa(mail + ".otro"))
	}
	
}
