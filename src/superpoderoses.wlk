
class Personaje{
	const property nombre
	var property estrategia
	var property espiritu
	var property niveEstrategia 
	var property poderes = new Set ()
	
	method subeNivel(complejidad){  niveEstrategia = (niveEstrategia +complejidad) }
	method estrategia()=estrategia
	method espiritu() =espiritu 
	method agregar_poderes(_poder){ poderes.add(_poder)}
	
	method capasidad_de_batalla() {return poderes.sum{poder =>poder.capasidad_de_batalla(self)}}
	
	method poderes() {return poderes}
	
	method mejor_poder() { return (poderes.max{poder => poder.capasidad_de_batalla(self)})}
	
	method otorgaInmunidad(){return  poderes.any({poder => poder.otorgaInmunidad()})}
}

class PoderVelocidad {
	const property rapidez
	method agilidad (_personaje){return (_personaje.estrategia() * rapidez)}
	method fuerza (_personaje){ return(_personaje.espiritu() *  rapidez)}
	method habilidad_especial (_personaje){return (_personaje.espiritu() + _personaje.estrategia())}
	
	method capasidad_de_batalla(_personaje) {return (( self.agilidad(_personaje)+ self.fuerza(_personaje) )* self.habilidad_especial(_personaje)) }
	
	method otorgaInmunidad() {return false}
}

class	PoderVuelo {
	const property alturaMax
	const property energiaDespegue

	method agilidad(_personaje){return( (_personaje.estrategia()*alturaMax).div(energiaDespegue))}
	method fuerza(_personaje){return(_personaje.espiritu() + alturaMax- energiaDespegue )}
	method habilidad_especial (_personaje) {return (_personaje.espiritu() + _personaje.estrategia()) }
	method capasidad_de_batalla(_personaje) {return (( self.agilidad(_personaje)+ self.fuerza(_personaje) )* self.habilidad_especial(_personaje)) }
	
	method otorgaInmunidad() {return alturaMax>=200}
}

class PoderAmplificado {
	
	const property amplificador
	var property Poderbase
	//var property personaje
	//method personaje(poder) =personaje
	method poderBase()=Poderbase
	method agilidad(_personaje){return( Poderbase.agilidad(_personaje) )}
	method fuerza(_personaje){return(Poderbase.fuerza(_personaje))}
	method habilidad_especial (_personaje) {return (Poderbase.habilidad_especial(_personaje)* amplificador) }
	method capasidad_de_batalla(_personaje) {return (( self.agilidad(_personaje)+ self.fuerza(_personaje) )* self.habilidad_especial(_personaje)) }
	method otorgaInmunidad() {return true }



}

//const juan = new Personaje(nombre ="juan",estrategia =1, espiritu =1)










