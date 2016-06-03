_don_debug_new_pos = getPosAtl player;
if (isNil "don_debug_last_pos") then {don_debug_last_pos = _don_debug_new_pos;};
_don_debug_new_pos_txt = "X = " + str(floor((getPosAtl player) select 0)) + "  Y = " + str(floor((getPosAtl player) select 1)) + "  Z = " + str(floor((getPosAtl player) select 2));
cutText [format[_don_debug_new_pos_txt + "  DELTA = " + str(floor(_don_debug_new_pos distance don_debug_last_pos))], "PLAIN DOWN"];
don_debug_last_pos = _don_debug_new_pos;