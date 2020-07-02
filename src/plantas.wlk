import parcelas.*

class Plantas {
	var property anioDeObtencion
	var property altura
	
	method horasDeSolTolera(){
		return horaDeSolGenerico.cantidad()
	}
	
	method esFuerte(){
		return self.horasDeSolTolera() > 9
	}
	
	method daNuevasSemillas(){
		return self.esFuerte()
	}
	
	method espacioQueOcupa()
	
	method parcelaIdeal(parcela)
}

class Menta inherits Plantas{
	
	override method horasDeSolTolera(horas){
		return horas
	}
	
	override method daNuevasSemillas(){
		return super() or 
		self.espacioQueOcupa() > 1
	}
	
	override method espacioQueOcupa(){
		return altura * 3
	}
	
	override method parcelaIdeal(parcela){
		return parcela.superficie() > 6
	}
}

class Soja inherits Plantas{
	
	override method horasDeSolTolera(){
		if (altura < 0.3){
			return  6
		}
		if (altura.between(0.3, 0.8)){
			return  7
		}
		else { 
			return  12
		}
	}
	
	override method daNuevasSemillas(){
		return super() or 
		anioDeObtencion > 2007 and 
		altura.between(0.75, 0.9)
	}
	
	override method espacioQueOcupa(){
		return altura / 2
	}
	
	override method parcelaIdeal(parcela){
		return parcela.cuantasHorasDeSolRecibe() == self.horasDeSolTolera()
	}
}

class Quinoa inherits Plantas{
	var property espacio
	
	override method espacioQueOcupa(){
		return espacio
	}
	
	override method horasDeSolTolera(){
		return if (espacio < 0.3){
			return 10
		}
		else { return horaDeSolGenerico.cantidad()}
	}

	override method daNuevasSemillas(){
		return super() or 
		anioDeObtencion.between(2001, 2008)
	}
	
	override method parcelaIdeal(parcela){
		return parcela.plantas().any({ g => g.altura() > 1.5})
	}
}

class Sojatransgenica inherits Soja{
	override method daNuevasSemillas(){
		return false
	}
	
	override method parcelaIdeal(parcela){
		return parcela.cantidadMaximaDePlantas() == 1
	}
}

class Hierbabuena inherits Menta{
	override method espacioQueOcupa(){
		return super() * 2
	}
}

object horaDeSolGenerico{
	var property cantidad = 7
}