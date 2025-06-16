/// @function CreateTextBoxes(_argsList)
/// @arg {Array} _argsList Array of Text with their responses

function CreateTextBoxes(_argsList)
{
	for (var _i=0; _i<array_length(_argsList); _i++)
	{
		var _args = _argsList[_i]
		var _text = _args[0];
		var _responses = _args[1];
		CreateTextBox(_text, _responses);
	}
}