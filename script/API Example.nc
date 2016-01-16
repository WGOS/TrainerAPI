// this is an exaple for Trainer API
import "TrainerAPI.nc";

TrainerAPI ref trainer = new TrainerAPI("MyPerfectHax", "1.0.0", 1, "WGOS", "https://github.com/WGOS/");

trainer.CreateMainDialog(200, 200, 310, 250, nullptr, true, true);

new Function(trainer, "SpeedHax", "Signature to find", "Signature to replace");
new Function(trainer, "Power +9000", "Signature to find", "Signature to replace");

trainer.ShowMainDialog();