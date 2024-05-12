extends Node2D
class_name World
var enemies = 0
#var enemiesInWave= [5,10,15,20]
var WaitTimeInWave = [5,5,5,5]
static var zombiesKilled = 0 
#var zombie = Zombie.new()
static var wave = 0
static var enemySpawnerActive = false
var drop = Drop.new()
var time :float = 0.0
var minutes : int = 0
var seconds: int = 0
var msec : int = 0
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
	print("buy time a giriş yaptık")
	enemySpawnerActive = false
	print("10sn sonra wave prepare timeri başlıyacak")
	await get_tree().create_timer(10).timeout #30 saniye cinsinden
	timer.wait_time = WaitTimeInWave[wave]
	timer.start()
	print(wave, " hazırlık timerı başladı")

func _physics_process(delta):
	EndCurrentWave()
	endWave()
	zombiesKilled = drop.zombies_Killed
	print(EndCurrentWave())

func EndCurrentWave():
	if enemySpawner.createdEnemyAmount == zombiesKilled and zombiesKilled > 5:
		return true
	else: 
		return false

func _process(delta):
	time+=delta
	msec = fmod(time,1)*100 
	seconds = fmod(time, 60)
	minutes = fmod(time,3600) / 60
	
	$CanvasLayer/Panel/minutes.text ="%02d:" %minutes
	$CanvasLayer/Panel/seconds.text ="%02d." %seconds
	$CanvasLayer/Panel/msec.text ="%03d" %msec
	$CanvasLayer/Panel/wave.text = "wave: " + str(wave)
	
func stop():
	set_process(false)
