private [ "_camera", "_camDistance" ];
titleText [format ["Bem vindo de volta, %1", name player], "PLAIN DOWN"];
_camDistance = 15;
waitUntil {!isNil ("PVDZE_plr_LoginRecord")};
playsound "enasceu";
showCinemaBorder true;
camUseNVG false;
_camera = "camera" camCreate [(position player select 0)-2, position player select 1,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit 8;
sleep 0.1;
hint "Chernobyl";
waitUntil {camCommitted _camera};
_camera cameraEffect ["terminate","back"];
camDestroy _camera;