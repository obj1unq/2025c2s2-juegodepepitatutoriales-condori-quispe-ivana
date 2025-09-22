
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
	method image() {
	  return "pepita.png"
	}
	// HAGAMOS + ACCIONES
	method hablar() {
	  return "Holaa! Soy Pepita"
	}
	method moverSolo() {
	  const x = 0.randomUpTo(game.width())
	  const y = 0.randomUpTo(game.height())

	  position = game.at(x,y)
	}

}
object silvestre {
	var position = game.origin() 
  method image() {
	  return "silvestre.png"
	}
	method position() {
	  return position
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

}
