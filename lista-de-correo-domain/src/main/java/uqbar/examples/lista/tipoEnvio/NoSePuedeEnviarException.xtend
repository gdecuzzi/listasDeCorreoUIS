package uqbar.examples.lista.tipoEnvio

import java.lang.RuntimeException

class NoSePuedeEnviarException extends RuntimeException {
	new(String message){
		super(message)
	}	
}