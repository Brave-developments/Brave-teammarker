**TeamMarker Script**

#Usage

The TeamMarker script is designed to enhance team coordination by allowing players to place 3D markers on any surface within the map. Players who are connected to the same radio channel will be able to see each other's markers. The size and color of the markers can be customized in the config.lua file to suit your preferences.

**How to Install**

Add the resource to your server’s resources folder.

Ensure that brave-teammarker is included in your server.cfg:

plaintext

Copy code
``ensure brave-teammarker``
Simply watch the installation video for further guidance.

**Dependencies**

This script is standalone and should support any framework.
The radio check logic is implemented using pma-voice, so ensure that you are using pma-voice in your server.
Configuration
You can adjust the size and color of the markers via the config.lua file.
Example marker settings:
lua
Copy code
``Config.MarkerSize = { x = 1.0, y = 1.0, z = 10.0 } -- Marker size
Config.MarkerColor = { r = 255, g = 0, b = 0, a = 150 } -- Marker color (RGBA)``

**Future Plans**

Dynamic Markers: Allow players to place different types of markers based on the situation.

User-Defined Marker Customization: Enable each player to customize their markers independently.

Incorporate feedback and suggestions from the community for future improvements.
