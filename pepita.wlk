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
	
//------------
method irA(nuevaPosicion) {
		self.validarMover(nuevaPosicion)
		self.volar(self.position().distance(nuevaPosicion))
		const nuevaX = nuevaPosicion.x().max(0).min(12)
		const nuevaY = nuevaPosicion.y().max(0).min(12)
		position = game.at(nuevaX, nuevaY)
	}

	method cansada(){ return energia <= 0}

	method validarMover(nuevaPosicion){
		if (self.cansada() or self.conSilvestre())
			{self.error("no me puedo mover :(")
			self.lose()}
		else if (fisica.hayMuroEn(nuevaPosicion)){
			self.error("hay un muro, che!")
		}
	}
method conSilvestre() {	return self.position() == silvestre.position()}

	method caer() {
		position = game.at(position.x(), (position.y()-1).max(0))
	}

	method win() {
		game.say(self, "¡GANÉ!")
	}

	method lose() {
		game.say(self, "¡PERDÍ!")
	}
	//---------------
	
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
object fisicaDelMundo {
	method configTeclas(){
		keyboard.left().onPressDo({
			pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({
			pepita.irA(pepita.position().right(1))})
		keyboard.up().onPressDo({
			pepita.irA(pepita.position().up(1))})
		keyboard.down().onPressDo({
			pepita.irA(pepita.position().down(1))})
	}

	method gravedad(){
		game.onTick(800, "caer", {pepita.caer()})
	}

	method materia() {
		game.whenCollideDo(pepita, {cosa => cosa.encontroCon(pepita)}
		)
	}

	method hayMuroEn(lugar) {
		return (lugar == muro.position()) or (lugar == muro2.position())
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
