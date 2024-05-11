extends Node2D
class_name World
static var wave = 0
var enemies = 0
var enemiesInWave= [5,10,15,20]
var WaitTimeInWave = [5,5,3,1]
var zombiesKilled=0 
var zombie = Zombie.new()
static var ifegirdik = false
#var healthComponent = HealthComponent.new()
var drop = Drop.new()

#var eSpawner = enemySpawner.new()
#@onready var healthComponent : HealthComponent = $HealthComponent
@onready var timer = $WavePrepareTime
@onready var enemySpawner = $EnemySpawner

func _ready():
	timer.wait_time = WaitTimeInWave[wave]
	timer.start()


func _on_wave_prepare_time_timeout():
	#spawn enemies here
	if enemySpawner.createdEnemyAmount == zombiesKilled:
		ifegirdik = true #öldürülen enemi sayısına eşit olduğunda
		timer.stop()
		wave += 1
		enemySpawner.createdEnemyAmount = 0
		BuyTime()

func BuyTime():
	print("buy time basladı 10sn sonra wave prepare timeri başlıyacak")
	await get_tree().create_timer(10).timeout #30 saniye cinsinden
	timer.wait_time = WaitTimeInWave[wave]
	print(wave, "timerı başladı")
	timer.start()

func _physics_process(delta):
	zombiesKilled = drop.zombies_Killed
	#print(enemySpawner.createdEnemyAmount)
	#print(zombiesKilled)
	#print(ifegirdik)
	#print(timer)
	print(wave)
