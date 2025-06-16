/// @description Drop fragments & items

if (entityFragmentCount > 0)
{
	var _fragmentArray = array_create(entityFragmentCount, entityFragment);
	DropObjects(x,y,_fragmentArray);
}

if (entityDropList[0] != -1)
{
	DropObjects(x,y,entityDropList);
}