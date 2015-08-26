package uqbar.examples.lista.observer

import uqbar.examples.lista.tipoEnvio.Mail
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ConPalabraComprometedora implements EnvioObserver{
	
	private List<Mail> comprometedores
	new(){
		comprometedores = newArrayList
	}
	
	def List<String> getPalabrasDeInteres(){
		#["bomba", "nos estan escuchando", "fafafa","terrorismo"]
	}
	
	override mailEnviado(Mail mail) {
		if (palabrasDeInteres.exists[mail.body.contains(it)]){
			comprometedores.add(mail)
		}
	}
}