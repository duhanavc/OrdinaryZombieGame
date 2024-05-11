extends Node2D
class_name World
var enemies = 0
var enemiesInWave= [5,10,15,20]
var WaitTimeInWave = [5,5,3,1]
static var zombiesKilled = 0 
var zombie = Zombie.new()
static var wave = 0
static var ifegirdik = false
static var enemySpawnerActive = false
#var healthComponent = HealthComponent.new()
var drop = Drop.new()
#var eSpawner = enemySpawner.new()
#@onready var healthComponent : HealthComponent = $HealthComponent
@onready var timer = $WavePrepareTime
@onready var enemySpawner = $EnemySpawner

func _ready():
	timer.wait_time = WaitTimeInWave[wave]
	timer.start()
	enemySpawnerActive == false


func _on_wave_prepare_time_timeout():
	enemySpawnerActive = true
	
func endWave():
	if EndCurrentWave():
		enemySpawnerActive = false
		timer.stop()
		wave += 1
		print("wave arttı yeni wave :  ")
		print(wave)
		drop.zombies_Killed = 0
		enemySpawner.createdEnemyAmount = 0
		BuyTime()

func BuyTime():
	enemySpawnerActive = false
	print("buy time basladı") 
	print("10sn sonra wave prepare timeri başlıyacak")
	await get_tree().create_timer(10).timeout #30 saniye cinsinden
	timer.wait_time = WaitTimeInWave[wave]
	timer.start()
	print(wave, " hazırlık timerı başladı")

func _physics_process(delta):

	EndCurrentWave()
	endWave()
	
	zombiesKilled = drop.zombies_Killed
	
	#print("yaratılan Zombi Sayısı:  ", enemySpawner.createdEnemyAmount)
	#print("öldürülen zombi sayısı:  ",zombiesKilled)
	print(EndCurrentWave())
	
	#print(timer)

func EndCurrentWave():
	if enemySpawner.createdEnemyAmount == zombiesKilled and zombiesKilled > 5:
		return true
	else: 
		return false
