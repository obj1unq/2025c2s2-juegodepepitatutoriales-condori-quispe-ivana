import pepita.*

object mapa {
      const dibujo =   [[],
[_,_,_,m,_],
[],
[],
[],
[],
[],
[],
[],
[] ]



    /*para los mapas 
  [[_, _, m,_,n,] esto son objetos
  []
  []
  []
  []
  []
  []
  []
  []
  [] ]
  
  esto si es wollok, una m atriz, lista de lista

  para ajustar el ancho de y alto del tablero 

  como se dibuja se me como invertido, al final en la constante usamos  .reverse() que eso lo invierte 

  para que pepita este al frente de todo podemos hacer 2 cosas

  1) 
  al metodo p se le quita el addVisual y despues del recorrido poner el addvisual 

  el mas facil

  luego si queremos poner varios objetos en una posicion, lo feliz es crear un objeto y modelarlo como se hizo con el nido y demas
  
  */
  method construir() {
    (0 .. game.width() - 1).forEach({x => })
  }
}
object _ {
  
}
object m {
  method dibujar() {
    game.addVisual(new muro()) //modificar
  }
}
object n {
    method dibujar() {
        nido.position()
        game.addVisual(nido)
    }

}