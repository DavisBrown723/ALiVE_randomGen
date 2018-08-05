call compile preprocessFileLineNumbers "SQF++\scanner.sqf";
call compile preprocessFileLineNumbers "SQF++\lexer.sqf";
call compile preprocessFileLineNumbers "SQF++\parser.sqf";
call compile preprocessFileLineNumbers "SQF++\code_generator.sqf";
call compile preprocessFileLineNumbers "SQF++\soop.sqf";

sqfCommands = call {
	private _info = supportInfo "";
	private _scriptClasses = (_info select {_x select [0,1] == "t"}) apply {_x select [2]};
	private _nular = (_info select {_x select [0,1] == "n"}) apply {_x select [2]};
	private _unary = (_info select {_x select [0,1] == "u"}) apply {_x select [2]};
	private _binary = (_info select {_x select [0,1] == "b"}) apply {_x select [2]};

	private _commandsByType = [_nular,_unary,_binary];
	private _commandsByTypeParsed = [];

	{
		private _typeCommands = [];

		{
			_typeCommands pushbackunique (((_x splitstring " ,") select {!(_x in _scriptClasses)}) joinstring "");
		} foreach _x;

		_commandsByTypeParsed pushback _typeCommands;
	} foreach _commandsByType;

	_commandsByTypeParsed
};