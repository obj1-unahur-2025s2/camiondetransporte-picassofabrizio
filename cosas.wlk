object knightRider {
    const peso = 500
    const nivelDePeligrosidad = 10

    method peso() = peso
    method nivelDePeligrosidad() = nivelDePeligrosidad
}

object bumblebee {
    const peso = 800
    var nivelDePeligrosidad = 0
    var estaTransformado = false

    method peso() = peso
    method nivelDePeligrosidad() = nivelDePeligrosidad

    method seVuelveRobot() {
      estaTransformado = true
    }

    method seVuelveAuto() {
      estaTransformado = false
    }

    method nivelDePeligrosidadActualizado() {
      if (estaTransformado){
        nivelDePeligrosidad = 30
      }
      else {
        nivelDePeligrosidad = 15
      } 
    }
}

object paqueteDeLadrillos {
    var peso = 0
    var cantidad = 0
    const nivelDePeligrosidad = 2

    method peso() = peso
    method nivelDePeligrosidad() = nivelDePeligrosidad
    method cantidad() = cantidad

    method nuevaCantidad(nuevaCantidad) {
      cantidad = nuevaCantidad
    }

    method actualizarPeso() {
      peso = 2 * cantidad
    }
}

object arenaAGranel {
    var peso = 0
    const nivelDePeligrosidad = 1

    method peso() = peso
    method nivelDePeligrosidad() = nivelDePeligrosidad

    method nuevoPeso(nuevoPeso) {
      peso = nuevoPeso
    }
}

object bateriaAntiaerea {
    var peso = 0
    var estaConMisiles = true
    var nivelDePeligrosidad = 0

    method peso() = peso
    method nivelDePeligrosidad() = nivelDePeligrosidad
    method estaConMisiles() = estaConMisiles

    method actualizarPesoYPeligrosidadDeLaBateria() {
      if (estaConMisiles){
        peso = 300
        nivelDePeligrosidad = 100
      }
      else {
        peso = 200
        nivelDePeligrosidad = 0
      }
    }

    method dejaMisiles() {
      estaConMisiles = false
    }

    method vuelveConLosMisiles() {
      estaConMisiles = true
    }
}

object contenedorPortuario {
    const cosasDentro = []
    var peso = 100
    var nivelDePeligrosidad = 0

    method cosasDentro() = cosasDentro
    method peso() = peso
    method nivelDePeligrosidad() = nivelDePeligrosidad

    method agregarLaCosa_AlContenedor(unaCosa) {
      cosasDentro.add(unaCosa)
    }

    method pesoTotalDentroDelContenedor() {
      return cosasDentro.sum({c=> c.peso()})
    }

    method actualizarPeso() {
      peso += self.pesoTotalDentroDelContenedor()
    }

    method actualizarNivelDePeligrosidad() {
    if(cosasDentro.size() >= 1){
        nivelDePeligrosidad = self.cosaConMayorNivelDePeligrosidadEnElContenedor().map(nivelDePeligrosidad)
    }
    else {
        nivelDePeligrosidad = 0
    }
    }

    method cosaConMayorNivelDePeligrosidadEnElContenedor() {
      return cosasDentro.max({c=> c.nivelDePeligrosidad()})
    }

}

object residuosRadioactivos {
    var peso = 0
    const nivelDePeligrosidad = 200

    method peso() = peso
    method nivelDePeligrosidad() = nivelDePeligrosidad

    method nuevoPeso(nuevoPeso) {
      peso = nuevoPeso
    }
}

object embalajeDeSeguridad {
    const cosaDentro = []
    var peso = 0
    var nivelDePeligrosidad = 0

    method peso() = peso
    method nivelDePeligrosidad() = nivelDePeligrosidad
    method cosaDentro() = cosaDentro

    method añadir_adentro(unaCosa) {
      cosaDentro.add(unaCosa)
    }

    method actualizarPeso() {
        peso = self.pesoDeLaCosaDentro().peso()
    }

    method pesoDeLaCosaDentro() {
      return cosaDentro.map({c=> c.peso()})
    }

    method actualizarNivelDePeligrosidad() {
      nivelDePeligrosidad = self.nivelDePeligrosidadDeLaCosaDentro().nivelDePeligrosidad() / 2
    }

    method nivelDePeligrosidadDeLaCosaDentro() {
      return cosaDentro.map({c=> c.nivelDePeligrosidad()})
    }
}