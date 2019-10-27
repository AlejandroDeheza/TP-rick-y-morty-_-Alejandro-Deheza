class Rick {

	const familiares = #{ morty, summer, beth, jerry }
	var demencia = 40 // valor arbitrario
	var acompaniante = null

	method elegirAcompaniante() {
		acompaniante = familiares.anyOne()
	}

	method alterarDemencia(_variacionDemencia) {
		demencia += _variacionDemencia
	}

	method convertirseEnPepinillo() {
		demencia /= 2
	}

	method alcanzaDemenciaLimite() {
		return acompaniante.variacionDemeciaDeRick() + demencia > 100
	}

	method salirDeAventura() {
		if (acompaniante == null) {
			self.elegirAcompaniante()
		}
		if (!self.alcanzaDemenciaLimite() && acompaniante.puedeIrDeAventura()) {
			acompaniante.alterar()
			self.alterarDemencia(acompaniante.variacionDemeciaDeRick())
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
	var variacionDemeciaDeRick = 50

	method variacionDemeciaDeRick() = variacionDemeciaDeRick

	method alterar() {
		saludMental -= 30
	}

	method puedeIrDeAventura() = true

}

class Summer {

	var afectoPorRick = 70 // valor arbitrario
	var variacionDemeciaDeRick = -20

	method variacionDemeciaDeRick() = variacionDemeciaDeRick

	method alterar() {
		afectoPorRick += 10
	}

	method puedeIrDeAventura() = fecha.hoy().internalDayOfWeek() == 3

}

class Beth {

	var afectoPorRick = 80 // valor arbitrario
	var variacionDemeciaDeRick = -20

	method variacionDemeciaDeRick() = variacionDemeciaDeRick

	method alterar() {
		afectoPorRick += 10
	}

	method puedeIrDeAventura() = true

}

class Jerry {

	var variacionDemeciaDeRick = 0

	method variacionDemeciaDeRick() = variacionDemeciaDeRick

	method puedeIrDeAventura() = false

}

//////////////objetos para probar por consola//////////

object rick inherits Rick {

}

object morty inherits Morty {

}

object summer inherits Summer {

}

object beth inherits Beth {

}

object jerry inherits Jerry {

}

