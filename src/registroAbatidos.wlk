object registroAbatidosCOD {
	//Fechas en formato[CantidadDeAbatidos, fecha]
	const property registro=[]
	
	method startUP(){ 
		self.agregarRegistro(10,20240503)
		self.agregarRegistro(15,20240504)
		self.agregarRegistro(09,20240505)
	}
	
	method agregarRegistro(cantidad, dia){
		registro.add([cantidad, dia])
	}
	
	method cantidadDeDiasRegistrados()=registro.size()
	
	method estaVacioElRegistro()=registro.isEmpty()
	
	method algunDiaAbatido(cantidad)=registro.any({reg=>(reg.get(0)==cantidad)})
	
	method primerValorDeAbatidos()=registro.get(0).get(0)
	
	method maximoValorDeAbatidos()=registro.max({reg=>reg.get(0)})
	
	method totalAbatidos()=registro.sum({reg=>reg.get(0)})
	
	method cantidadDeAbatidosElDia(dia) = registro.findOrDefault({reg=>reg.get(1)==dia}, [0,0]).get(0)
	
	method ultimoValorDeAbatidosConSize() = registro.get(registro.size()-1).first()
	
	method diasConAbatidosSuperioresA(cuanto) = registro.filter({reg=>reg.first()>cuanto})
	
	method valoresDeAbatidosPares() = registro.filter({reg=>reg.first().even()})
	
	method abatidoSumando(cantidad) = registro.map({reg=>[reg.first()+cantidad,reg.get(1)]})
	
	method abatidosEsAcotada(n1, n2) =registro.any({reg=>reg.first().between(n1,n2)})
	
	method algunDiaAbatioMasDe(cantidad) = registro.any({reg=>reg.first()>cantidad})
	
	method cantidadAbatidosMayorALaPrimera() = registro.any({reg=>reg.first()>registro.first().first()})
	
	method previoRegistro(i)=registro.get(i-1)
	
	method esCrack(){
		var flag=true
		(1..registro.size()-1).forEach({i=>
			flag = flag and registro.get(i-1)<=registro.get(i)
		})
		return flag
	}
	
}