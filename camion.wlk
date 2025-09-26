object camion {
    const codigoDelCamion = 1
    var pesoDelcamion = 1000
    const cosasCargadasEnElCamion = []

    method cosasCargadasEnElCamion() = cosasCargadasEnElCamion
    method codigoDelCamion() = codigoDelCamion
    method pesoDelcamion() = pesoDelcamion

    method cargar_AlCamion(unaCosa) {
      pesoDelcamion += unaCosa.peso()
      cosasCargadasEnElCamion.add(unaCosa)
    }

    method descargar_DelCamion(unaCosa) {
      pesoDelcamion -= unaCosa.peso()
      cosasCargadasEnElCamion.remove(unaCosa)
    }

    method pesoDe_SonPares(unaCosa) {
      return self.pesoDeLoQueEsteCargado().even()
    }

    method pesoDeLoQueEsteCargado() {
      return cosasCargadasEnElCamion.map({c=> c.peso()})
    }

    method el_pesa_(unaCosa, peso) {
      return unaCosa.peso() == peso
    }

    method hayCosaConUnNivelDePeligroDe_(nivelDePeligrosidad) {
      return self.nivelDePeligroDeLoQueEsteCargado() == nivelDePeligrosidad
    }

    method nivelDePeligroDeLoQueEsteCargado() {
      return cosasCargadasEnElCamion.map({c=> c.nivelDePeligro()})
    }

    method tieneNivelDePeligrosidadSuperiorA_(nivelDePeligrosidad) {
      return self.nivelDePeligroDeLoQueEsteCargado() > nivelDePeligrosidad
    }

    method laLista_TieneCosasQueSuperanElNivelDePeligrosidadDe_(unalista, unaCosa){
        return unalista.filter({l=> l.nivelDePeligrosidad() >= unaCosa.nivelDePeligrosidad()})
    }

    method elPesoDelCamionEstaExcedido() {
      return pesoDelcamion >= 2500
    }

    method elCamionConNivelDePeligrosidad_PuedeCircularEnRuta(nivelDePeligrosidad) {
      return not self.elPesoDelCamionEstaExcedido() && self.nivelDePeligroDeLoQueEsteCargado() > nivelDePeligrosidad
    }












}