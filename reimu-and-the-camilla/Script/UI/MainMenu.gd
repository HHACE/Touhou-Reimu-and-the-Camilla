extends Node

@export var GalleryButton : Control;
@export var MenuSelections: Array[Control];

var unlockedGallery = true;
var currentMenu = 0;
var mainMenuIndex = 0;
const galleryIndex = 2;

var active = true;

func _ready() -> void:
	if !unlockedGallery:
		GalleryButton.self_modulate = 0x665754;

func _process(_delta: float) -> void:
	if !active:
		return;
	
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
		print("MenuSelections: ", MenuSelections.size());
		
	elif Input.is_action_just_pressed("move_up"):
		mainMenuIndex -= 1;
		if !unlockedGallery && mainMenuIndex == galleryIndex: #Skip gallery
			mainMenuIndex -= 1;
		if mainMenuIndex < 0:
			mainMenuIndex = MenuSelections.size()-1;
		changedSelection = true;
	
	if changedSelection:
		print("Changed selection: ", mainMenuIndex);
		for i in range(MenuSelections.size()):
			MenuSelections[i].visible = i == mainMenuIndex;

func MainMenuSelect():
	if !Input.is_action_just_pressed("confirm"):
		return
		
	match mainMenuIndex:
		0:
			get_tree().change_scene_to_file("res://Scene/game_prototype.tscn");
		1:
			active = false;
			$Main.hide();
			await get_tree().process_frame
			$Options.show();
		2:
			active = false;
			$Main.hide();
			await get_tree().process_frame
			$Gallery.show();
		3:
			active = false;
			$Main.hide();
			await get_tree().process_frame
			$Credits.show();
		4:
			get_tree().quit();

func ReturnToMenu():
	$Main.visible = true;
	active = true;
	
