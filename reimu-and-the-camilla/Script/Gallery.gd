extends Control

var galleryMenuIndex = 0;
var selectionIndex = 0;

var player;
func _ready() -> void:
	player = get_parent().get_node("BGMPlayer");


func _process(delta: float) -> void:
	if !visible:
		return;
	match galleryMenuIndex:
		0:
			GallerySelection();
		1:
			ArtGallery();
		2:
			MusicGallery();

func GallerySelection():
	var changed = false;
	if Input.is_action_just_pressed("move_down"):
		selectionIndex += 1;
		if selectionIndex > 2:
			selectionIndex = 0;
		changed = true;
	if Input.is_action_just_pressed("move_up"):
		selectionIndex -= 1;
		if selectionIndex < 0:
			selectionIndex = 2;
		changed = true;
	var confirm = Input.is_action_just_pressed("confirm");
	if changed:
		var offset = selectionIndex if selectionIndex < 2 else selectionIndex + 1;
		$GalleryTypeSelection/Selection.position = Vector2(328, 235 + offset * 76);
	if Input.is_action_just_pressed("cancel") || (confirm && selectionIndex == 2):
		selectionIndex = 0;
		$GalleryTypeSelection/Selection.position = Vector2(328, 235);
		visible = false;
		await get_tree().process_frame
		get_parent().ReturnToMenu();
	elif confirm:
		$GalleryTypeSelection.visible = false;
		galleryMenuIndex = selectionIndex+1;
		if selectionIndex == 0:
			$Art.visible = true;
		else:
			$Music.visible = true;

@export var ArtTextures : Array[Texture2D];
var artIndex = 0;

func ArtGallery():
	var changed = false
	if Input.is_action_just_pressed("move_down"):
		artIndex += 1;
		if artIndex > ArtTextures.size():
			artIndex = 0;
		changed = true;

	if Input.is_action_just_pressed("move_up"):
		artIndex -= 1
		if artIndex < 0:
			artIndex = ArtTextures.size();
		changed = true;
	
	if Input.is_action_just_pressed("cancel") || (Input.is_action_just_pressed("confirm") && artIndex == ArtTextures.size()):
		artIndex = 0;
		$Art/ArtDisplay.texture = ArtTextures[0];
		galleryMenuIndex = 0;
		$GalleryTypeSelection.visible = true;
		$Art.visible = false;
		$Art/Selection.position = Vector2(328, 255);
	elif changed && artIndex < ArtTextures.size():
		$Art/ArtDisplay.texture = ArtTextures[artIndex];
		
	if changed:
		var offset = artIndex if artIndex < ArtTextures.size() else artIndex + 1;
		$Art/Selection.position = Vector2(328, 255 + offset * 76);

@export var Songs : Array[AudioStream];
var songIndex = 0;

func MusicGallery():
	var changed = false
	if Input.is_action_just_pressed("move_down"):
		songIndex += 1;
		if songIndex > Songs.size():
			songIndex = 0;
		changed = true;

	if Input.is_action_just_pressed("move_up"):
		songIndex -= 1
		if songIndex < 0:
			songIndex = Songs.size();
		changed = true;
	
	if Input.is_action_just_pressed("cancel") || (Input.is_action_just_pressed("confirm") && songIndex == Songs.size()):
		songIndex = 0;
		player.stream = Songs[0];
		player.play();
		galleryMenuIndex = 0;
		$GalleryTypeSelection.visible = true;
		$Music.visible = false;
		$Music/Selection.position = Vector2(328, 255);
	elif changed && songIndex < Songs.size():
		player.stream = Songs[songIndex];
		player.play();
		
	if changed:
		var offset = songIndex if songIndex < Songs.size() else songIndex + 1;
		$Music/Selection.position = Vector2(328, 255 + offset * 76);
