import parcelas.*
import plantas.*

object inta {
	var property parcelas = []
	
	method promedioDePlantas(){
		return parcelas.sum({parcela => self.cantidadDePlantasPorParcela(parcela)}) / self.cantidadDeParcelas()
	}
	
	method cantidadDePlantasPorParcela(parcela){
		return parcela.plantas().size()
	}
	
	method cantidadDeParcelas(){
		return parcelas.size()
	}
	
	method parcelasConMasDe4Plantas(){
		return parcelas.filter({parcela => self.cantidadDePlantasPorParcela(parcela) > 4})
	}
	
	method parcelaMasSustentable(){
		if (self. parcelasConMasDe4Plantas().isEmpty){
			self.error("No hay parcelas con mas de 4 plantas")
		}
		else {return self.parcelasConMasDe4Plantas().max({ parcela => parcela.cantidadDePlantasAsociadas()}) }
	}
}
