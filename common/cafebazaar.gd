extends Node

var Plugin
var plugin_name = "GodotCafeBazaarBilling"

func _ready():
	if Engine.has_singleton(plugin_name):
		Plugin = Engine.get_singleton(plugin_name)
		Plugin.setPluginParams()
	else:
		print("Could not load plugin: ", plugin_name)
