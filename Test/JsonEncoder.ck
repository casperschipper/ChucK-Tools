
// Example usage
class Foo extends Json {
    JsonObject obj;
    json_arr([json_int(42)]) @=> JsonValue j;
    obj.add("array",j);
    <<<obj.encode()>>>;
}
Foo foo;

// Print the encoded JSON string
