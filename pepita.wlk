object pepita {
	var energia = 100
	var property position = game.at(0, 6) //game.origin()
	
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}
	//ceomo esto debe cambiar, le hago if
	method image() {
	  return if(silvestre.position() == self.position())  "pepita-gris.png" else "pepita.png"
	}
	

	
}
object nido {
  var property position = game.origin() 
  method image() {
	  return "nido.png"
  }
}
object silvestre {
	var position = game.origin() 
  method image() {
	  return "silvestre.png"
	}
	method position() {
	  return if (pepita.position().x() >= 3) game.at(pepita.position().x(), 0) else game.at(3, 0) 
	}



}
/*
	method verPositionY() {

	  return position.y() // (2@3).y() => 3
	}
	// HAGAMOS + ACCIONES
	method hablar() {
	  return "Holaa! Soy Pepita"
	}
	// ejemplo eutomatico
	method moverSolo() {
	  const x = 0.randomUpTo(game.width())
	  const y = 0.randomUpTo(game.height())

	  position = game.at(x,y)
	}
	// acciones del tutorial 1
	method llegarAlNido() {
	  
	}
	// HAGAMOS + ACCIONES
	method subirUnaVez() {
	  position = position.up(1)
	}
	method moverHaciaNorteXYEsteY(x,y) {
	  position = position.up(x)
	  position = position.right(y)
	  	  //(position.up(x) , position.right(y))
	}
	//si hago esto,¿es ocrrecto usar property?
	method moverSolo() {
	  const x = 0.randomUpTo(game.width())
	  const y = 0.randomUpTo(game.height())

	  position = game.at(x,y)
	}
		method moverA_Y_(x,y) {

	  position = game.at(x,y)
	}
		method moverA_Y_(x,y) {

	  position = game.at(x,y)
	}
*/
