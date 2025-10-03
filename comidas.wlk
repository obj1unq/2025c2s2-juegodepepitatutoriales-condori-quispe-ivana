import wollok.game.*
import pepita.*

/*
class Manzana {
  const base = 5
	var madurez = 1
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

	method image() {return "manzana.png"}

	method position() {return game.at(2,8)}

	method teEncontro(cosa) {
		cosa.comer(self)
	}
}

class Alpiste {
  method energiaQueOtorga() {
		return 20
	} 

	method image() {return "alpiste.png"}

	method position() {return game.at(4,3)}

	method teEncontro(cosa) {
		cosa.comer(self)
	}
}
*/
object manzana {
	const base= 5
	var madurez = 1
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

	method image() {return "manzana.png"}

	method position() {return game.at(2,8)}

	method teEncontro(cosa) {
		cosa.comer(self)
	}

}

object alpiste {

	method energiaQueOtorga() {
		return 20
	} 

	method image() {return "alpiste.png"}

	method position() {return game.at(4,3)}

	method teEncontro(cosa) {
		cosa.comer(self)
	}


}

