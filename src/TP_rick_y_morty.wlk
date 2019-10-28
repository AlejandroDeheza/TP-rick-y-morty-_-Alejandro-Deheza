class PepinilloException inherits Exception { }

class Rick {

	const familiares = #{ morty, summer, beth, jerry }
	var demencia = 40 // valor arbitrario
	var acompaniante = null
	var esPepinillo = false

	method elegirAcompaniante() {
		acompaniante = familiares.anyOne()
	}

	method alterarDemencia(_variacionDemencia) {
		demencia += _variacionDemencia
	}

	method convertirseEnPepinillo() {
		if (!esPepinillo){
			demencia /= 2
			esPepinillo = true			
		}else{
			throw new PepinilloException( message = "Rick ya es un Pepinillo")
		}
	}

	method alcanzaDemenciaLimite() {
		return acompaniante.variacionDemeciaDeRick() + demencia > 100
	}

	method salirDeAventura() {
		if (acompaniante == null) {
			self.elegirAcompaniante()
		}
		if (!self.alcanzaDemenciaLimite() && acompaniante.puedeIrDeAventura()) {
			acompaniante.acompaniarEnAventura()
		} else {
			self.convertirseEnPepinillo()
		}
	}

}

object fecha {

	var property hoy = new Date()

} //esto es para que se pueda modificar y probar con otra fecha

class Morty {

	var saludMental = 60 // valor arbitrario
	const property variacionDemeciaDeRick = 50

	method acompaniarEnAventura() {
		saludMental -= 30
		rick.alterarDemencia(variacionDemeciaDeRick)
	}

	method puedeIrDeAventura() = true

}

class MujerDeFamilia {
	
	var afectoPorRick = 80 // valor arbitrario
	const property variacionDemeciaDeRick = -20

	method acompaniarEnAventura() {
		afectoPorRick += 10
		rick.alterarDemencia(variacionDemeciaDeRick)
	}

	method puedeIrDeAventura() = true
}

class Summer inherits MujerDeFamilia{

	override method puedeIrDeAventura() = fecha.hoy().internalDayOfWeek() == 3

}

class Jerry {

	const property variacionDemeciaDeRick = 0

	method puedeIrDeAventura() = false

}

//////////////objetos para probar por consola//////////

object rick inherits Rick {

}

object morty inherits Morty {

}

object summer inherits Summer {

}

object beth inherits MujerDeFamilia {

}

object jerry inherits Jerry {

}

