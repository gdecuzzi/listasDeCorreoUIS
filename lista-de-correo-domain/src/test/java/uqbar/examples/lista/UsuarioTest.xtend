package uqbar.examples.lista

import org.junit.Test
import static org.junit.Assert.*

class UsuarioTest {
	@Test
	def void testUsuarioConMailLoVerifica(){
		var String mailQueTiene = "uno@a.com"
		var Usuario usuario = new Usuario
		
		usuario.agregarMail(mailQueTiene)
		
		assertTrue(usuario.tieneMail(mailQueTiene))
	}
	
	@Test
	def void testUsuarioSinMailNoLoVerifica(){
		var String mailQueNoTiene = "uno@a.com"
		var Usuario usuario = new Usuario
		
		assertFalse(usuario.tieneMail(mailQueNoTiene))
	}
	
	
}