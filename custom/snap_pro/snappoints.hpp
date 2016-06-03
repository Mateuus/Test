class SnapBuilding {
	class Barrier {
		snapTo[] = {
			"Land_HBarrier5_DZ",
			"Land_HBarrier3_DZ",
			"Land_HBarrier1_DZ",
			"Sandbag1_DZ",
			"BagFenceRound_DZ",
			"Fort_RazorWire"
		};
		radius = 5;
	};
	class Land_HBarrier5Preview: Barrier{
		points[] = {
		{0,0,0,"Pivo"},
		{0,-0.75,0.1,"Atras"},
		{0,0.75,0.1,"Frente"},
		{-2.85,0,0.1,"Esquerda"},
		{2.85,0,0.1,"Direita"},
		{0,0,0.9,"Cima"}
		};
	};
	class Land_HBarrier5_DZ: Land_HBarrier5Preview {
		points[] = {
		{0,0,0,"Pivo"},
		{0,-0.75,0,"Atras"},
		{0,0.75,0,"Frente"},
		{-2.85,0,0,"Esquerda"},
		{2.85,0,0,"Direita"},
		{0,0,0.9,"Cima"}
		};
	}; 
	
	class Land_HBarrier3ePreview: Barrier { 
		points[] = {
		{0,0,0,"Pivo"},
		{0,-0.75,0,"Atras"},
		{0,0.75,0,"Frente"},
		{-1.7,0,0,"Esquerda"},
		{1.7,0,0,"Direita"},
		{0,0,0.9,"Cima"}
		};
	};
	class Land_HBarrier3_DZ: Land_HBarrier3ePreview{};

	class Land_HBarrier1Preview: Barrier {
		points[] = {
		{0,0,0,"Pivo"},
		{0,-0.75,0,"Atras"},
		{0,0.75,0,"Frente"},
		{-0.6,0,0,"Esquerda"},
		{0.6,0,0,"Direita"},
		{0,0,0.9,"Cima"}
		};
	};
	class Land_HBarrier1_DZ: Land_HBarrier1Preview{};
		
	class Fort_RazorWirePreview: Barrier {
		points[] = {
		{0,0,0,"Pivo"},
		{0,-0.95,-0.3,"Atras"},
		{0,0.95,-0.3,"Frente"},
		{-4.1,0,-0.3,"Esquerda"},
		{4.1,0,-0.3,"Direita"},
		{0,0,1,"Cima"}
		};
	};
	class Fort_RazorWire: Fort_RazorWirePreview {};
	
	class Sandbag1_DZ: Barrier {
		points[] = {
		{0,0,0,"Pivo"},
		{-1.5,0,0,"Esquerda"},
		{1.5,0,0,"Direita"},
		{0,0,0.4,"Cima"}
		};
	};
	
	class BagFenceRound_DZ: Barrier {
		points[] = {
		{0,0,0,"Pivo"},
		{-1.295,0.38,0,"Esquerda"},
		{1.295,0.38,0,"Direita"},
		{0,0,0.4,"Cima"}
		};
	};
	
	class FloorsWallsStairs {
		snapTo[] = {
			"WoodFloorQuarter_DZ",
			"WoodFloorHalf_DZ",
			"WoodFloor_DZ",
			"WoodStairs_DZ",
			"WoodStairsSans_DZ",
			"WoodSmallWallDoor_DZ",
			"WoodSmallWall_DZ",
			"WoodSmallWallWin_DZ",
			"Land_DZE_WoodDoor",
			"Land_DZE_WoodDoorLocked",
			"WoodLargeWall_DZ",
			"Land_DZE_LargeWoodDoor",
			"WoodLargeWallWin_DZ",
			"WoodLargeWallDoor_DZ",
			"Land_DZE_GarageWoodDoor",
			"Land_DZE_GarageWoodDoorLocked",
			"Land_DZE_LargeWoodDoorLocked",
			"WoodSmallWallThird_DZ",
			"CinderWall_DZ",
			"CinderWallDoorway_DZ",
			"CinderWallDoorLocked_DZ",
			"CinderWallDoor_DZ",
			"CinderWallSmallDoorway_DZ",
			"CinderWallDoorSmallLocked_DZ",
			"CinderWallHalf_DZ",
			"CinderWallDoorSmall_DZ",
			"MetalFloor_DZ"
		};
		radius = 7;
	};
	
	class WoodFloorQuarter_Preview_DZ: FloorsWallsStairs { 
		points[] = {
		{0,0,0,"Pivo"},
		{0,-1.23,0,"Atras"},
		{0,1.23,0,"Frente"},
		{-1.24,0,0,"Esquerda"},
		{1.24,0,0,"Direita"}
		};
	};
	
	class WoodFloorQuarter_DZ: FloorsWallsStairs { 
		points[] = {
		{0,0,0,"Pivo"},
		{0,-1.23,0.137726,"Atras"},
		{0,1.23,0.137726,"Frente"},
		{-1.24,0,0.137726,"Esquerda"},
		{1.24,0,0.137726,"Direita"}
		};
	};
	
	class WoodFloorHalf_Preview_DZ: FloorsWallsStairs { 
		points[] = {
		{0,0,0,"Pivo"},
		{0,-2.34,0,"Atras"},
		{0,2.34,0,"Frente"},
		{-1.25,0,0,"Esquerda"},
		{1.25,0,0,"Direita"}
		};
	};
	class WoodFloorHalf_DZ: FloorsWallsStairs{
		points[] = {
		{0,0,0,"Pivo"},
		{0,-2.34,0.1407,"Atras"},
		{0,2.34,0.1407,"Frente"},
		{-1.25,0,0.1407,"Esquerda"},
		{1.25,0,0.1407,"Direita"}
		};
	};
	
	class WoodFloor_Preview_DZ: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivo"},
		{0,-2.33,0.130,"Atras"},
		{0,2.33,0.130,"Frente"},
		{-2.495,0,0.130,"Esquerda"},
		{2.495,0,0.130,"Direita"}
		};
		radius = 10;
	};
	class WoodFloor_DZ: WoodFloor_Preview_DZ{};
	
	class Stairs_DZE: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivo"},
		{1.56055,-0.78,1.5,"Atras"},
		{1.56055,0.78,1.5,"Frente"},
		{1.73926,0.05,2.9,"Cima"},
		{-1.73926,0.05,0,"Bottom"}
		};
	};
	class WoodStairs_DZ: Stairs_DZE {};
	class WoodStairs_Preview_DZ: Stairs_DZE {};
	class WoodStairsSans_Preview_DZ: Stairs_DZE {};
	class WoodStairsSans_DZ: Stairs_DZE {};

	class WoodSmall_DZE: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivo"},
		{-2.285, 0, 1.5,"Esquerda"},
		{2.285, 0, 1.5,"Direita"},
		{0, 0, 3,"Cima"}
		};
	};
	class WoodSmallWallDoor_Preview_DZ: WoodSmall_DZE {};
	class WoodSmallWall_Preview_DZ: WoodSmall_DZE {};
	class WoodSmallWallWin_Preview_DZ: WoodSmall_DZE {};
	class WoodSmallWallDoor_DZ: WoodSmall_DZE {};
	class WoodSmallWall_DZ: WoodSmall_DZE {};
	class WoodSmallWallWin_DZ: WoodSmall_DZE {};
	class Land_DZE_WoodDoor: WoodSmall_DZE {};
	class Land_DZE_WoodDoorLocked: WoodSmall_DZE {};
	class WoodDoor_Preview_DZ: WoodSmall_DZE{};
	
	class WoodLarge_DZE: FloorsWallsStairs { 
		points[] = {
		{0,0,0,"Pivo"},
		{-2.45, 0, 1.5,"Esquerda"},
		{2.45, 0, 1.5,"Direita"},
		{0, 0, 3,"Cima"}
		};
	};
	class WoodLargeWall_Preview_DZ: WoodLarge_DZE {};
	class WoodLargeWallWin_Preview_DZ: WoodLarge_DZE {};
	class WoodLargeWallDoor_Preview_DZ: WoodLarge_DZE {};
	class WoodSmallWallThird_Preview_DZ: WoodLarge_DZE {
		points[] = {
		{0,0,0,"Pivo"},
		{-2.445, 0, 1.5,"Esquerda"},
		{2.445, 0, 1.5,"Direita"},
		{0, 0, 1.17,"Cima"}
		};
	};
	class WoodSmallWallThird_DZ: WoodSmallWallThird_Preview_DZ{};
	class WoodLargeWall_DZ: WoodLarge_DZE {};
	class Land_DZE_LargeWoodDoor: WoodLarge_DZE {};
	class WoodLargeWallWin_DZ: WoodLarge_DZE {};
	class WoodLargeWallDoor_DZ: WoodLarge_DZE {};
	class Land_DZE_GarageWoodDoor: WoodLarge_DZE {};
	class GarageWoodDoor_Preview_DZ: WoodLarge_DZE {};
	class Land_DZE_GarageWoodDoorLocked: WoodLarge_DZE {};
	class Land_DZE_LargeWoodDoorLocked: WoodLarge_DZE {};
	class LargeWoodDoor_Preview_DZ: WoodLarge_DZE {};
	
	class Cinder_DZE: FloorsWallsStairs { 
		points[] = {
		{0,0,0,"Pivo"},
		{-2.752, 0, 1.5,"Esquerda"},
		{2.752, 0, 1.5,"Direita"},
		{0, 0, 3.37042,"Cima"}
		};
		radius = 10;
	};
	class CinderWall_Preview_DZ: Cinder_DZE {};
	class CinderWallDoorway_Preview_DZ: Cinder_DZE {};
	class CinderWallSmallDoorway_Preview_DZ: Cinder_DZE {}; 
	class CinderWallHalf_Preview_DZ: Cinder_DZE {
		points[] = {
		{0,0,0,"Pivo"},
		{-2.752, 0, 1.5,"Esquerda"},
		{2.752, 0, 1.5,"Direita"},
		{0, 0, 1.5,"Cima"}
		};
	};
	class CinderWall_DZ: Cinder_DZE {};
	class CinderWallDoorway_DZ: Cinder_DZE {};
	class CinderWallDoorLocked_DZ: Cinder_DZE {};
	class CinderWallDoor_DZ: Cinder_DZE {};
	class CinderWallSmallDoorway_DZ: Cinder_DZE {};
	class CinderWallDoorSmallLocked_DZ: Cinder_DZE {};
	class CinderWallHalf_DZ: Cinder_DZE {
		points[] = {
		{0,0,0,"Pivo"},
		{-2.752, 0, 1.5,"Esquerda"},
		{2.752, 0, 1.5,"Direita"},
		{0, 0, 1.5,"Cima"}
		};
	};
	class CinderWallDoorSmall_DZ: Cinder_DZE {};
	
	class MetalFloor_Preview_DZ: FloorsWallsStairs { 
		points[] = {
		{0,0,0.011,"Pivo"},
		{0, -2.64, 0.009,"Atras"},
		{0, 2.64, 0.009,"Frente"},
		{-2.64, 0, 0.009,"Esquerda"},
		{2.64, 0, 0.009,"Direita"}
		};
		radius = 12;
	};
	class MetalFloor_DZ: FloorsWallsStairs{
		points[] = {
		{0,0,0,"Pivo"},
		{0, -2.64, 0.15,"Atras"},
		{0, 2.64, 0.15,"Frente"},
		{-2.64, 0, 0.15,"Esquerda"},
		{2.64, 0, 0.15,"Direita"}
		};
		radius = 12;
	};
	
	
	class WoodCrate_DZ {
		snapTo[] = {
			"WoodCrate_DZ"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivo"},
		{0,-0.47,0,"Atras"},
		{0,0.47,0,"Frente"},
		{-0.47,0,0,"Esquerda"},
		{0.47,0,0,"Direita"},
		{0,0,0.47,"Cima"}
		};
	};
		
	class MetalPanel_DZ {
		snapTo[] = {
			"MetalPanel_DZ"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivo"},
		{-1.5,0,0,"Esquerda"},
		{1.5,0,0,"Direita"}
		};
	};
	
		class MetalGate_DZ {
		snapTo[] = {
			"MetalGate_DZ"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivo"},
		{-4.1,0,0,"Esquerda"}
		};
	};
	
	class StickFence_DZ {
		snapTo[] = {
			"StickFence_DZ"
		};
		radius = 10;
		points[] = {
		{0,0,0,"Pivo"},
		{-2.95,0,0.3,"Esquerda"},
		{2.95,0,0.3,"Direita"}
		};
	};
	
	class Fence_corrugated_DZ {
		snapTo[] = {
			"Fence_corrugated_DZ"
		};
		radius = 10;
		points[] = {
		{0,0,0,"Pivo"},
		{-1.95,0,0.88,"Esquerda"},
		{1.95,0,0.88,"Direita"}
		};
	};
	
	class WoodRamp_Preview_DZ {
		snapTo[] = {
			"WoodRamp_DZ"
		};
		radius = 7;
		points[] = {
		{0,0,0,"Pivo"},
		{0.65,-1.7,1.2,"Atras"},
		{0.65,1.5,1.2,"Frente"},
		{3.34,-0.115,2.82,"Cima"}
		};
	};
	class WoodRamp_DZ: WoodRamp_Preview_DZ{};
	
	class WoodLadder_Preview_DZ {
		snapTo[] = {
			"WoodLadder_DZ"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivo"},
		{-0.4,0,1.725,"Esquerda"},
		{0.4,0,1.725,"Direita"}
		};
	};
	class WoodLadder_DZ: WoodLadder_Preview_DZ{};
	
	class VaultStorageLocked {
		snapTo[] = {
			"VaultStorageLocked",
			"VaultStorage"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivo"},
		{0,0.284,0.615,"Atras"},
		{0,0,1.23,"Cima"},
		{-0.362,0,0.615,"Esquerda"},
		{0.362,0,0.615,"Direita"}
		};
		
	};
	class VaultStorage: VaultStorageLocked {};
};
