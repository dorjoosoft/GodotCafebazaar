<p># GodotCafebazaar Godot CafeBazaar plugin implemented based on <span style="font-size:16px"><strong>Godot 3.2.2+</strong></span> android plugin standards.<br />
This plugin uses Cafebazaar <a href="https://github.com/cafebazaar/Poolakey">Poolakey sdk</a>.</p>

<p><strong><span style="font-size:18px">prerequisite</span>:</strong></p>

<p>Install&nbsp;<a href="https://docs.godotengine.org/en/stable/getting_started/workflow/export/android_custom_build.html">Custom builds for Android</a> using official godot engine documention.</p>

<p><span style="font-size:18px"><strong>Installation:</strong></span></p>

<p>Download latest release from <a href="https://github.com/dorjoosoft/GodotCafebazaar/releases">release page</a>&nbsp;and extract content&nbsp;to<strong> [your_project_path]/android/plugins </strong>folder.</p>

<p>Enable plugin on export dialog.</p>
<img src="https://github.com/dorjoosoft/GodotCafebazaar/blob/main/docs/tempsnip.png" alt="Enable plugin"/>

<p>From "Project>Project settings" dialog do steps 1 and 2 as you see in below image: </p>
<img src="https://github.com/dorjoosoft/GodotCafebazaar/blob/main/docs/key.png" alt="Enable plugin"/>

<p>In <strong>[your_project_path]/android/build/config.gradle </strong>file change kotlin version to <strong>kotlinVersion : &#39;1.4.0&#39; .</strong></p>

<p><strong>Note:</strong> You have to activate your&nbsp;VPN before build after this settings by now!</p>

<p><strong>Note: </strong>This plugin just works on your build on device.</p>

<p><strong><span style="font-size:18px">Connect to plugin in Godot:</span></strong><br />
Download&nbsp;<a href="https://github.com/dorjoosoft/GodotCafebazaar/blob/main/common/cafebazaar.gd">cafebazaar.gd</a>&nbsp;&nbsp;file and add it to your games common folder and add it to your Autoload.</p>
<img src="https://github.com/dorjoosoft/GodotCafebazaar/blob/main/docs/autoload.png" alt="Enable plugin"/>

<p><span style="font-size:18px"><strong>Send a Purchase request:</strong></span></p>


<p>Read comments for more information!</p>

<pre>
<code class="language-python">func sendPurchaseRequest(p1 , p2, p3):
	# Send a purchase request
	var productId = p1    #for example: "powerUp1" 
	var requestCode = p2  #for example: 1234
	var payload = p3		  #for example: "kl97AS#@fasdfg"
	Cafebazaar.Plugin.purchase(productId, requestCode, payload); 
	#productId -&gt; This is the product id that you have defined inside of the developers panel.
	#requestCode -&gt; This is just a random integer but, it's a good practice to make this a constant property.
	#payload -&gt; This can be an empty string or anything else that you wish, but it's a good practice to actually pass in some data to help you to verify the purchase.</code></pre>

<p>&nbsp;</p>


<p><span style="font-size:18px"><strong>Handle Purchase result:</strong></span></p>

<p>Add this codes to handle purchase result&nbsp;</p>

<pre>
<code class="language-python">func _ready():
	# Handle purchase result [currently handle success result] 
	Cafebazaar.Plugin.connect("purchase_succeed", self, "purchase_succeed")</code></pre>

<pre>
<code class="language-python">func purchase_succeed(resultCode):
	var pResult = JSON.parse(resultCode)
	# result["productId"] contains your product id registered in CafeBazaar panel.
	print(pResult.result["productId"])</code></pre>

<p>&nbsp;</p>
<p>&nbsp;</p>
<h2><strong>Consume purchase:</strong></h2>
<p><strong>Note:</strong> on purchase success event the consume method is called automatically in plugin purchase flow by now and you can send user to buy that item again. I'll make this method separated on next plugin update.</p>
