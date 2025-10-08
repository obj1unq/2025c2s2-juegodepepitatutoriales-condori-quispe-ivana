import wollok.game.*

object randomizer {
		
	method position() {
		return 	game.at( 
					(0 .. game.width() - 1 ).anyOne(),
					(0..  game.height() - 1).anyOne()
		) //obtener una pocision random 
	}
	
	method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}
	
}
/*
¿WUE HACE?

method position() {
	return 	game.at( 
				(0 .. game.width() - 1 ).anyOne(),
				(0..  game.height() - 1).anyOne()
		) 
}

ESTE METODO  
primero esto (1 .. 5)  →  [1, 2, 3, 4, 5] es un operador de rango (es parte del lenguaje de wollok)
te da una lista de numeros entre 1 y 5 inclusive
se puede combinar con otros metodos de listas como 
 .anyOne() → elige uno al azar

.map(...), .filter(...), etc.

const rango = (1 .. 10) // lista del 1 al 10
rango.anyOne()          // elige un número al azar

o para recorrer 
(1 .. 5).forEach { x => game.say(pepita, x.toString()) }

por ejemplo este codigo ejecuta esto 

(1 .. 5)
Genera una lista de números del 1 al 5:
→ [1, 2, 3, 4, 5]

.forEach { x => ... }
Recorre cada número x de esa lista y ejecuta el bloque { x => ... }.

game.say(pepita, x.toString())
Hace que Pepita diga el número actual convertido a texto.

QUE HECE ESTO? (0..  game.height() - 1).anyOne()

Esta expresión genera un rango de números enteros, 
desde 0 hasta el último índice válido del tablero en el eje X.

¿Por qué se usa -1?

Porque los índices de las celdas del juego van de 0 hasta (ancho - 1).

Ejemplo:

Si el ancho del tablero (game.width()) es 10, las columnas válidas son:

0 1 2 3 4 5 6 7 8 9   
                   ↑ Última columna: 9 = 10 - 1

devuelve un número entero aleatorio dentro del rango directamente
anyOne() Cuando lo llamás sobre un rango, por ejemplo (0..10).anyOne(), 
elige un número al azar dentro de ese rango.
-------------------------------------
y esto? 
method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}

primero con self.position() busca una posicion aleatoria 
luego pregunta  si game.getObjectsIn (que Devuelve una lista (collection) 
de todos los objetos 
que están actualmente en la posición indicada dentro del tablero 
del juego.
Devuelve todos los objetos en la posición dada.) esta vacia. 
si esta vacia retorna esa posicion sino hace un self.emptyPosition() que 
vuelve a llamar a la funcion de forma recursiva y busca hasta que encuentre una
posicion libre 
*/