extends Control

func _process(delta: float) -> void:
	if !visible:
		return;
	SettingsChangeSelection();
	SettingsEdit();

@export var MainVolumeBoxes : Array[TextureRect];
@export var SFXVolumeBoxes : Array[TextureRect];
@export var BGMVolumeBoxes : Array[TextureRect];
@export var SettingsSelections: Array[Control];

@export var OnBoxTexture : Texture2D;
@export var OffBoxTexture : Texture2D;
@export var EnabledTexture : Texture2D;
@export var DisabledTexture : Texture2D;

var selectedSettingIndex = 0;
var mainVolume = 10;
var sfxVolume = 10;
var bgmVolume = 10;
var vSync = true;
var fullScreen = false;

func SettingsChangeSelection():
	var changedSelection = false;
	if Input.is_action_just_pressed("move_down"):
		selectedSettingIndex += 1;
		if selectedSettingIndex >= SettingsSelections.size():
			selectedSettingIndex = 0;
		changedSelection = true;
		
	elif Input.is_action_just_pressed("move_up"):
		selectedSettingIndex -= 1;
		if selectedSettingIndex < 0:
			selectedSettingIndex = SettingsSelections.size()-1;
		changedSelection = true;
	
	if changedSelection:
		for i in range(SettingsSelections.size()):
			SettingsSelections[i].visible = i == selectedSettingIndex;

func UpdateVolume(left, right, volumeBoxes, busIndex, volume):
	var changedVolume = false;
	if left && volume > 0:
		volume -= 1;
		changedVolume = true;
	if right && volume < 10:
		volume += 1;
		changedVolume = true;
	if changedVolume:
		for i in range(volumeBoxes.size()):
			volumeBoxes[i].texture = OffBoxTexture if i >= volume else OnBoxTexture;
	print(linear_to_db(float(volume) / 10.0));
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(float(volume) / 10.0));
	return volume;

func SettingsEdit():
	var confirm = Input.is_action_just_pressed("confirm");
	var left = Input.is_action_just_pressed("move_left");
	var right = Input.is_action_just_pressed("move_right");
	var quit = Input.is_action_just_pressed("cancel");
	if left || right || confirm:
		match selectedSettingIndex:
			0:
				mainVolume = UpdateVolume(left, right, MainVolumeBoxes, 0, mainVolume);
			1:
				sfxVolume = UpdateVolume(left, right, SFXVolumeBoxes, 1, sfxVolume);
			2:
				bgmVolume = UpdateVolume(left, right, BGMVolumeBoxes, 2, bgmVolume);
			3:
				if confirm || left || right:
					vSync = !vSync;
					DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if vSync else DisplayServer.VSYNC_DISABLED)
					$Displays/VSync.texture = EnabledTexture if vSync else DisabledTexture;
			4:
				if confirm || left || right:
					fullScreen = !fullScreen;
					DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN if fullScreen else DisplayServer.WINDOW_MODE_WINDOWED)
					$Displays/FullScreen.texture = EnabledTexture if fullScreen else DisabledTexture;
			5:
				if confirm:
					quit = true;
	if quit:
		selectedSettingIndex = 0;
		for i in range(SettingsSelections.size()):
			SettingsSelections[i].visible = i == selectedSettingIndex;
		visible = false;
		await get_tree().process_frame
		get_parent().ReturnToMenu();
