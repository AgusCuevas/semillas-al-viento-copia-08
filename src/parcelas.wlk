import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property cuantasHorasDeSolRecibe
	var property plantas = []
	
	method superficie(){
		return ancho * largo
	}
	
	method cantidadMaximaDePlantas(){
		return if (ancho > largo){
			self.superficie() / 5 
		}
		else { self.superficie() / 3 + largo}
	}
	
	method tieneComplicaciones(){
		return plantas.any({ planta => planta.horasDeSolTolera() < cuantasHorasDeSolRecibe})
	}
	
	method estaLlenoDePlantas(){
		return plantas.size() == self.cantidadMaximaDePlantas()
	}
	
	method plantaPuedeEstaEnParcela(planta){
		return  (cuantasHorasDeSolRecibe - planta.horasDeSolTolera()) < 2
	}
	
	method plantarUnaPlanta(planta){
		if (self.estaLlenoDePlantas() or not self.plantaPuedeEstaEnParcela(planta)){
			self.error("No se puede planta")
		}
		else { plantas.add(planta) }
	}
	
	method seAsociaBien(planta)
	
	method cantidadDePlantasAsociadas(){
		return plantas.count({ planta => planta.seAsociaBien(planta)})
	}
}

class ParcelaEcologica inherits Parcela{
	
	override method seAsociaBien(planta){
		return not self.tieneComplicaciones() and planta.parcelaIdeal(self)
	}
}

class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(planta){
		return plantas.size() < 2 and planta.esFuerte()
	}
}
