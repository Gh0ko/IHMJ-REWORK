extends Button

func setLabel(newText : String) :
	$VBoxContainer/AppName.text = newText
	
func setIcon(newTexture : Texture2D) :
	$VBoxContainer/AppLogo.texture = newTexture
