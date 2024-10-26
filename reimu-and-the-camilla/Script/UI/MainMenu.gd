extends Node

@export var GalleryButton : Control;
@export var MenuSelections: Array[Control];
@export var Menus : Array[Control];

var unlockedGallery = false;
var currentMenu = 0;
var mainMenuIndex = 0;
const galleryIndex = 2;

func _ready() -> void:
	if !unlockedGallery:
		GalleryButton.self_modulate = 0x665754;

func _process(_delta: float) -> void:
	match currentMenu:
		0:
			MainMenuLogic();
		1:
			SettingsLogic();
	
	if currentMenu > 0 && !(currentMenu == 2 && galleryScreenIndex > 0):
		MainMenuReturn();

func OpenSubMenu(menuIndex):
	Menus[0].visible = false;
	Menus[menuIndex].visible = true;
	currentMenu = menuIndex;
	
func CloseSubMenu():
	Menus[currentMenu].visible = false;
	Menus[0].visible = true;
	currentMenu = 0;
	
func MainMenuReturn():
	if Input.is_action_just_pressed("cancel"):
		CloseSubMenu();

#Main Menu:

func MainMenuLogic():
	MainMenuChangeSelection();
	MainMenuSelect();

func MainMenuChangeSelection():
	var changedSelection = false;
	if Input.is_action_just_pressed("move_down"):
		mainMenuIndex += 1;
		if !unlockedGallery && mainMenuIndex == galleryIndex: #Skip gallery
			mainMenuIndex += 1;
		if mainMenuIndex >= MenuSelections.size():
			mainMenuIndex = 0;
		changedSelection = true;
		
	elif Input.is_action_just_pressed("move_up"):
		mainMenuIndex -= 1;
		if !unlockedGallery && mainMenuIndex == galleryIndex: #Skip gallery
			mainMenuIndex -= 1;
		if mainMenuIndex < 0:
			mainMenuIndex = MenuSelections.size()-1;
		changedSelection = true;
	
	if changedSelection:
		for i in range(MenuSelections.size()):
			MenuSelections[i].visible = i == mainMenuIndex;

func MainMenuSelect():
	if !Input.is_action_just_pressed("confirm"):
		return
		
	match mainMenuIndex:
		0:
			get_tree().change_scene_to_file("res://Scene/game_prototype.tscn");
		4:
			get_tree().quit();
		_:
			OpenSubMenu(mainMenuIndex);

#Settings:

@export var MainVolumeBoxes : Array[TextureRect];
@export var SFXVolumeBoxes : Array[TextureRect];
@export var BGMVolumeBoxes : Array[TextureRect];
@export var SettingsSelections: Array[Control];
@export var VSyncDisplay : TextureRect; 
@export var FullScreenDisplay : TextureRect; 

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

func SettingsLogic():
	SettingsChangeSelection();
	SettingsEdit();
	
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
					VSyncDisplay.texture = EnabledTexture if vSync else DisabledTexture;
			4:
				if confirm || left || right:
					fullScreen = !fullScreen;
					DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN if fullScreen else DisplayServer.WINDOW_MODE_WINDOWED)
					FullScreenDisplay.texture = EnabledTexture if fullScreen else DisabledTexture;
			5:
				if confirm:
					CloseSubMenu();

#Gallery:
@export var GallerySubMenus : Array[Control];
var galleryOptionIndex = 0;
var galleryScreenIndex = 0;

func GalleryLogic():
	if galleryOptionIndex == 1:
		ArtGallery();
	elif galleryOptionIndex == 2:
		MusicGallery();
	else:
		GalleryChangeSelection();
	
func GalleryChangeSelection():
	var changedSelection = false;
	if Input.is_action_just_pressed("move_down"):
		galleryOptionIndex += 1;
		if galleryOptionIndex >= 3:
			galleryOptionIndex = 0;
		changedSelection = true;
		
	elif Input.is_action_just_pressed("move_up"):
		galleryOptionIndex -= 1;
		if galleryOptionIndex < 0:
			galleryOptionIndex = 3;
		changedSelection = true;
	if Input.is_action_just_pressed("confirm"):
		if galleryOptionIndex == 2:
			CloseSubMenu();
		else:
			GallerySubMenus[0].visible = false;
			galleryScreenIndex = galleryOptionIndex+1;
			GallerySubMenus[galleryScreenIndex].visible = true;

var artIndex = 0;
func ArtGallery():
	var changedSelection = false;
	if Input.is_action_just_pressed("move_down"):
		artIndex += 1;
		if artIndex >= 3:
			artIndex = 0;
		changedSelection = true;
		
	elif Input.is_action_just_pressed("move_up"):
		artIndex -= 1;
		if artIndex < 0:
			artIndex = 3;
		changedSelection = true;
	
var musicIndex = 0;
func MusicGallery():
	var changedSelection = false;
	if Input.is_action_just_pressed("move_down"):
		musicIndex += 1;
		if musicIndex >= 3:
			musicIndex = 0;
		changedSelection = true;
		
	elif Input.is_action_just_pressed("move_up"):
		musicIndex -= 1;
		if musicIndex < 0:
			musicIndex = 3;
		changedSelection = true;
