extends Node

class_name HealthComponent #class name diğer scriptlerden erişilebilir hale getiriyoruz

#kendimiz sinyal oluşturabilmemiz için sağ tarafa ekliyor

signal died #ölmesi için
signal healthChanged #can değişikliği
signal healPlayer #can artması için 

@export var maxHealth :  float = 30
@export var healed : float = 10 # eklenilen can miktarı
var currentHealth 
var isDead: bool = false
#func getHealthPercent():
	#if maxHealth <= 0 :
		#return 0 #hiç can alama
	#return min(currentHealth / maxHealth,1)

func _ready():
	currentHealth = maxHealth
	
func damage(damageAmount : float):
	currentHealth = max(currentHealth - damageAmount, 0)
	# max değerinin üstüne çıkmasını önlüyor hiç hasar almazsa 0 hasar alıyor.
	healthChanged.emit() #sinyalimizi çalıştırmak için emit() parametresini kullanırız
	Callable(checkZombieDeath).call_deferred() # obje yok olduysa eğer onun oluşturdukları sahnede kalıp hata vermemesi için


func heal(healthAmount : float):
	currentHealth = max(currentHealth + healthAmount,0)
	healPlayer.emit()

func checkZombieDeath():
	var enemy = is_in_group("Zombie")
	if currentHealth <= 0:
		died.emit()
		isDead = true
		if owner.is_in_group("Zombie"): #parenti alır ama wolrd de bunu yazarsak worldün en üstündekini alır eğer scene değilsse
			owner.queue_free()
		owner.queue_free()
