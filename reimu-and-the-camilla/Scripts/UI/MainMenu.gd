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
	
	if currentMenu > 0:
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
var mainVolume = 1;
var sfxVolume = 1;
var bgmVolume = 1;
var vSync = false;
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

func UpdateVolume(left, right, volumeBoxes, volume):
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
	print(volume);
	return volume;

func SettingsEdit():
	var confirm = Input.is_action_just_pressed("confirm");
	var left = Input.is_action_just_pressed("move_left");
	var right = Input.is_action_just_pressed("move_right");
	if left || right || confirm:
		match selectedSettingIndex:
			0:
				mainVolume = UpdateVolume(left, right, MainVolumeBoxes, mainVolume);
			1:
				sfxVolume = UpdateVolume(left, right, SFXVolumeBoxes, sfxVolume);
			2:
				bgmVolume = UpdateVolume(left, right, BGMVolumeBoxes, bgmVolume);
			3:
				if confirm || left || right:
					vSync = !vSync;
					VSyncDisplay.texture = EnabledTexture if vSync else DisabledTexture;
			4:
				if confirm || left || right:
					fullScreen = !fullScreen;
					FullScreenDisplay.texture = EnabledTexture if fullScreen else DisabledTexture;
			5:
				if confirm:
					CloseSubMenu();
