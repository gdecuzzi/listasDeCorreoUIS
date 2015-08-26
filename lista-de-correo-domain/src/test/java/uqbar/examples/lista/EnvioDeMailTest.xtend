package uqbar.examples.lista

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Test
import org.mockito.Mockito
import uqbar.examples.lista.tipoEnvio.Abierto
import uqbar.examples.lista.tipoEnvio.Mail
import uqbar.examples.lista.tipoEnvio.Moderada
import uqbar.examples.lista.tipoEnvio.NoSePuedeEnviarException
import uqbar.examples.lista.tipoEnvio.Restringido
import uqbar.examples.lista.tipoEnvio.TipoDeEnvio

import static org.junit.Assert.*
import org.junit.Before

class EnvioDeMailTest {
	Cartero carteroMock
	
	@Before
	def void setUp(){
		carteroMock = Mockito.mock(Cartero) 
	}
	
	@Test
	def testUnaListaAbiertaEnviaElMensaje(){
		var ListaDeCorreo lista = crearListaConfigurada(new Abierto)
		val Mail mail = crearMail
		
		lista.enviar(mail)
		
		lista.usuarios.forEach[Mockito.verify(carteroMock).enviar(mail, it)]
	}
	
	@Test
	def testUnaListaRestringidaNoEnviaElMensajeSiNoParticipa(){
		val mailQueNoEsta = "noEstoyEnLaLista@no.com"

		var ListaDeCorreo lista = crearListaConfigurada(new Restringido)
		assertFalse(lista.participa(mailQueNoEsta))
		val Mail mail = crearMailConSender(mailQueNoEsta)
		
		try{
			lista.enviar(mail)
			fail("El mail no estaba en la lista se espera exccepcion!")
		}catch(NoSePuedeEnviarException e){
			Mockito.verifyZeroInteractions(carteroMock)
		}
	}
	
	@Test
	def testUnaListaRestringidaEnviaElMensajeSiParticipa(){
		var ListaDeCorreo lista = crearListaConfigurada(new Restringido)
		val mailQueEsta = lista.usuarios.first.mails.first
		assertTrue(lista.participa(mailQueEsta))
		val Mail mail = crearMailConSender(mailQueEsta)
		
		lista.enviar(mail)
		
		lista.usuarios.forEach[Mockito.verify(carteroMock).enviar(mail, it)]
	}
	
	@Test
	def testUnaListaModeradaDejaElMailPendienteDeRevision(){
		var ListaDeCorreo lista = crearListaConfigurada(new Moderada)
		val Mail mail = crearMail
		
		lista.enviar(mail)
		
		assertFalse(mail.estaAprobado)
		Mockito.verifyZeroInteractions(carteroMock)
	}
	
	@Test
	def testUnMailAprobadoSeEnvia(){
		var ListaDeCorreo lista = crearListaConfigurada(new Moderada)
		val Mail mail = crearMail
		mail.estaAprobado = true
		
		lista.enviar(mail)
		
		lista.usuarios.forEach[Mockito.verify(carteroMock).enviar(mail, it)]
	}
	
	def ListaDeCorreo crearListaConfigurada(TipoDeEnvio envio) {
		var lista = new ListaDeCorreo
		lista.tipoEnvio = envio
		lista.cartero = carteroMock
		lista.agregarParticipante(UtilsParaTest.crearParticipante("a@a.com"))
		lista
	}
	
	def crearMail() {
		new MailSimple
	}
	
	def crearMailConSender(String from) {
		new MailSimple(from)
	}
	
	def <T> T first(List<T> usuarios){
		usuarios.get(0)
	}	
	
}

class MailSimple implements Mail{
	@Accessors
	var String from
	
	@Accessors
	var boolean estaAprobado
	
	new(){
	}
	
	new(String from){
		this.from = from
	}
	
	override body() {
		""
	}
	
}
