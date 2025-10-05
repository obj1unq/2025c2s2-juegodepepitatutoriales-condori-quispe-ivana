import wollok.game.*
import pepita.*
class Manzana {
  var property position = game.origin()
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

	method teEncontro(cosa) {
		cosa.comer(self)
	}
}

class Alpiste {
	var property position = game.origin()
	var property peso = 0 
    method energiaQueOtorga() {
		return peso
	} 

	method image() {return "alpiste.png"}

	method teEncontro(cosa) {
		cosa.comer(self)
	}
}
