#ifndef VECTOR_SQF
#define VECTOR_SQF

VEC_fnc_neg = {
	private ["_vec1","_vec","_i"];
	_vec1 = _this;
	_vec = [];
	for "_i" from 0 to ((count _vec1)-1) do {
		_vec set [_i, -(_vec1 select _i)];
	};
	_vec
};

VEC_fnc_len = {
	private ["_vec","_len","_i","_val"];
	_vec = _this;
	_len = 0;
	for "_i" from 0 to ((count _vec)-1) do {
		_val = _vec select _i;
		_len = _len + (_val * _val);
	};
	_len = sqrt _len;
	_len
};

VEC_fnc_unit = {
	private ["_vec1","_len","_vec","_i"];
	_vec1 = _this;
	_len = _vec1 call VEC_fnc_len;
	_vec = [];
	for "_i" from 0 to ((count _vec1)-1) do {
		_vec set [_i, (_vec1 select _i) / _len];
	};
	_vec
};

VEC_fnc_add = {
	private ["_vec1","_vec2","_vec"];
	_vec1 = _this select 0;
	_vec2 = _this select 1;
	_vec = [];
	for "_i" from 0 to ((count _vec1)-1) do {
		_vec set [_i, (_vec1 select _i) + (_vec2 select _i)];
	};
	_vec
};

VEC_fnc_sub = {
	private ["_vec1","_vec2","_vec"];
	_vec1 = _this select 0;
	_vec2 = _this select 1;
	_vec = [];
	for "_i" from 0 to ((count _vec1)-1) do {
		_vec set [_i, (_vec1 select _i) - (_vec2 select _i)];
	};
	_vec
};

VEC_fnc_mul = {
	private ["_vec1","_vec","_fac","_i"];
	_vec1 = _this select 0;
	_fac = _this select 1;
	_vec = [];
	for "_i" from 0 to ((count _vec1)-1) do {
		_vec set [_i, (_vec1 select _i) * _fac];
	};
	_vec
};

#endif
