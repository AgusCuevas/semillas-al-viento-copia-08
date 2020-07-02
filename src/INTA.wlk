object inta {
	var property parcelas = []
	
	method promedioDePlantas(){
		return parcelas.sum({parcela => parcela.cantidadDePlantasPorParcela(parcela)}) / self.cantidadDeParcelas()
	}
	
	method cantidadDePlantasPorParcela(parcela){
		return parcela.plantas().size()
	}
	
	method cantidadDeParcelas(){
		return parcelas.size()
	}
	
	method parcelaMasAutosustentable(){
		return parcelas.filter({parcela => parcela. cantidadDePlantasPorParcela(parcela) > 4}).max({parcela.cantidadDePlantasAsociadas()})
	}
}
