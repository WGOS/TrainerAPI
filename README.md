# TrainerAPI
Trainer API made to speed up the creation of trainers based FlashEx.
API stroed at ./scripts/

Use FlashEx_Client.exe > Script > Show IDE to write code.
FlashEx uses NullC for scripting language: https://github.com/wheretib/nullc

API usage:
import "TrainerAPI.nc";

Add new link to TrainerAPI class:
TrainerAPI ref trainer = new TrainerAPI("MyPerfectHax", "1.0.0", 1, "WGOS", "https://github.com/WGOS/");
if you wand to use licence to launch trainer, write:
Licence ref exampleLic = new Licence("name", "password");
TrainerAPI ref trainer = new TrainerAPI(exampleLic, "MyPerfectHax", "1.0.0", 1, "WGOS", "https://github.com/WGOS/");

To create functions, use:
new Function(trainer, "SpeedHax", "Signature to find", "Signature to replace");

You could add licence to functions too.

