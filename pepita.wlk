import wollok.game.*
import comidas.*
object pepita {
	var property energia = 500 // sino lo pongo nopuedo ver energia
	var property position = game.at(0, 6) //game.origin()
	var estado = pepitaLibre //como no supe utilizarlo bien debo preguntar
	
	const comidasAAparecer = []
	const comidasActivas = [] 
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida) //saca una vez que se come
	}

	method volar(kms) {
		energia = energia - (kms * 9 )
	}
	method estaCansada(){ return energia <= 0}


	method actualizarEstado() {
	if (self.estaConSilvestre() || self.estaCansada()) {
		estado = pepitaPierde
		self.lose()
	} else if (self.estaEnElNido()) {
		estado = pepitaGana
		self.win()
	} else {
		estado = pepitaLibre
	}
	}
	method image() {
  /*return if (self.estaConSilvestre() || self.estaCansada()) 
           "pepita-gris.png"
         else if (self.estaEnElNido()) 
           "pepita-grande.png"
         else 
           "pepita.png"*/
		   return "pepita" + estado.nombreDeEstado() + ".png"
	} 
	method estaConSilvestre() {	return silvestre.position() == self.position()}
	method estaEnElNido(){
		return self.position() == nido.position()
	}
//------------

method irA(nuevaPosicion) {
		
		const nuevaX = nuevaPosicion.x().max(0).min(game.width() - 1)
		const nuevaY = nuevaPosicion.y().max(0).min(game.height() - 1)

		
		
		//self.validarSiEstaDentroDelTablero(nuevaPosicion)
        self.validarSiSePuedeMover(nuevaPosicion)

		
		self.volar(self.position().distance(nuevaPosicion))
		/*
		Aca le decimos a pepita que vuele a la nueva posisicion y eso se traduce como cantidad de kms que vuela
		esa cantida la averiguamos usando la funcion primitiva distance que calcula la distancia
		entre 2 posiciones del tablero 
		*/
		
		position = game.at(nuevaX, nuevaY)
		if(self.estaCansada()){
			game.say(self, "Me quedé sin energía...")
			game.stop() //detiene el juego
		} //ver donde lo meto
		self.actualizarEstado()
	}

	

	method validarSiSePuedeMover(nuevaPosicion){
		
	if (self.estaCansada() || self.estaConSilvestre()) {
		self.error("No me puedo mover!")
	} else if (configurarElMundo.hayMuroEn(nuevaPosicion)) {
		//game.say(self, "¡Hay un muro!")
		self.error("¡Hay un muro!")
	} else if (self.estaCansada()) {
		self.error("Me quedé sin energía...")
	}

/*		if (self.estaCansada() || self.estaConSilvestre()){
		self.error("No me puedo mover!")
		self.lose()
	    }else if (configurarElMundo.hayMuroEn(nuevaPosicion)){
			self.error("Encontramos un Muro")
		}  
*/


	}
	/*
	method validarSiEstaDentroDelTablero(nuevaPosicion){
		return nuevaPosicion.x() >=0 || nuevaPosicion.x() < game.width()
		       || nuevaPosicion.y() >=0 || nuevaPosicion.y() < game.height()
	}
	*/
	
	method caerPorGravedad() {
		position = game.at(position.x(), (position.y()-1).max(0))
	} 
//	aca la posicion x queda igual y a la Y le restamos 1
// con el max en y aseguramos que la coordenada y nunca sea menor a 0 
// EJEMPLO => SI position es 0 (esta en el piso) => 0-1 = -1 pero con el max se veria 
// -1.max(0) y eso devuelve 0
	method win() {
		game.removeTickEvent("GRAVEDAD")
		game.say(self, "WIN!!!")
		game.schedule(2000, {game.stop()})
		console.println(energia)
		//game.onTick(2 * 1000, "GANAR", {game.stop()})
	}

	method lose() {
		//console.log("Llamando a lose()")
		game.removeTickEvent("GRAVEDAD")
		game.say(self, "Game over")
		game.schedule(2000, {game.stop()})
		console.println(energia)
	}
	//---------------
	
}
object pepitaGana {
	method nombreDeEstado() { return "-grande" }  // pepita-normal.png
}

object pepitaPierde {
	method nombreDeEstado() { return "-gris" }    // pepita-gris.png
}
object pepitaLibre {
  method nombreDeEstado() { return "" }
}


object nido {
  var property position = game.origin() 
  method image() {
	  return "nido.png"
  }
  method teEncontro(objeto) {
	  return self.position() == objeto.position()
	}
}
object silvestre {
	//var position = game.origin() 
  method image() {
	  return "silvestre.png"
	}
	method position() {
	  return if (pepita.position().x() >= 3) game.at(pepita.position().x(), 0) else game.at(3, 0) 
	}
	method teEncontro(objeto) {
	  return self.position() == objeto.position()

	}
// otra form a return game.at(pepita.position().x().max()3, 0)


}

object configurarElMundo { // si bien esta modelado como objeto, esto se puede poner directamente en el program
	method configTeclas(){
		keyboard.left().onPressDo({
			pepita.irA(pepita.position().left(1))}) //aca le pedimos a pepita su posicion y luego le sumaos 1
//left(1) estos crean nuevas posiciones que son consultas no acciones
		keyboard.right().onPressDo({
			pepita.irA(pepita.position().right(1))})

		keyboard.up().onPressDo({
			pepita.irA(pepita.position().up(1))})

		keyboard.down().onPressDo({
			pepita.irA(pepita.position().down(1))})
	
        
	}
//onPressDo() cuando se presiona hace **lo que se ejecuta en el bloque**
/*
 Las posiciones son objetos inmutables, por lo que no se les puede cambiar sus coordenadas. Para ubicar objetos en posiciones diferentes se deben obtener nuevos objetos posición
 Las posiciones entienden los mensajes right(c) left(c) up(c) down(c) que devuelven nuevas posiciones con un desplazamiento de c casilleros en la dirección correspondiente.
*/

	method gravedad(){
		game.onTick(800, "GRAVEDAD", {pepita.caerPorGravedad()})
		//onTick  = cada 800 mili segundos QUIERP ejecutar un bloque de codigo
	}
	method hayMuroEn(lugar) {
		return (lugar == muro.position())
	}
	method configuraCollisiones() {
	  game.onCollideDo(pepita, {algo => algo.teEncontro(pepita)})
	}
}
object muro {
  var property position = game.at(7, 3)
  method image() {
	return "muro.png"
  } 
  method teEncontro(objeto) {
	//game.removeTickEvent("GRAVEDAD")
	return self.position() == objeto.position()
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

	--------------------cosas 
	else if (fisica.hayMuroEn(nuevaPosicion)){
			self.error("hay un muro, che!")
		}
*/
/*

	method iniciarEstados() {
		game.onTick(300, "estadoPepita", { pepita.actualizarEstado() })
	}
}
*/
// cosas en pepita ---
/*
	method image() {
	return "pepita" + estado.nombreDeEstado() + ".png"
	}
*/
	/*
	//ceomo esto debe cambiar, le hago if
	method image() {
	  return if(silvestre.position() == self.position())  "pepita-gris.png" else"pepita.png"
	}*/
	/*method image() {
	  return "pepita-" + estado.nombreDeEstado() + ".png"
	} recordar ver la compu 98
		method image() {
	  return if(self.estaConSilvestre()) "pepita-gris.png" else if (self.estaEnElNido()) "pepita.png" else "pepita.png"
	}

	*/	
	
