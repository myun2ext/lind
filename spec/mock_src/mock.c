int x_plus_y(int x, int y)
{
	return x + y;
}
const char* get_string()
{
	return "String";
}
void get_string_buffer(char* s)
{
	strcpy(s, "String");
}
int check_string(const char* s)
{
	return strcmp(s, "String");
}
