extends ProgressBar

var max_agarre = 100
var current_agarre = 0

func _ready():
	self.max_value = max_agarre
	self.value = current_agarre

func update_agarre(new_agarre):
	current_agarre = new_agarre
	self.value = current_agarre
	print(self.value)
	
func _on_boton_resta_pressed():
	if(self.current_agarre > 0):
		var nuevo_agarre = current_agarre - 1
		update_agarre(nuevo_agarre)
	
		print("Restando")
	else:
		print("No se puede restar")

func _on_boton_suma_pressed():
	if(current_agarre < max_agarre):
		var nuevo_agarre = current_agarre + 1
		update_agarre(nuevo_agarre)
		print("Sumando")
	else:
		print("No se puede sumar")

