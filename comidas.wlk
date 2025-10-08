import wollok.game.*
import pepita.*
class Manzana {
  const property position = game.origin() // ya que por cada instancia es como empezar uno nuevo, y se supone que no cambia mas
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
	const property position //se pude inicializar pero es mas funcionable dejarlo en ese estado
	const property peso // valor default solo si tiene sentido; 
    method energiaQueOtorga() {
		return peso
	} 

	method image() {return "alpiste.png"}

	method teEncontro(cosa) {
		cosa.comer(self)
	}
}
//las instancias no se borran, simplemente se van, osea si esta en una coleccion lo saco y lo mismo con los visual y demas