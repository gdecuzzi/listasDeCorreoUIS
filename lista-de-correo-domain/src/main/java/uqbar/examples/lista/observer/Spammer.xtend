package uqbar.examples.lista.observer

import java.util.Map
import uqbar.examples.lista.tipoEnvio.Mail
import java.util.HashMap
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Spammer implements EnvioObserver{
	private Map<String, Integer> ranking
	
	new(){
		ranking = new HashMap
	}
	
	override mailEnviado(Mail mail) {
		var rank = ranking.get(mail.from)
		if(rank == null){
			ranking.put(mail.from, 1)
		}else{
			rank = rank + 1
		}
	}
	
	
}