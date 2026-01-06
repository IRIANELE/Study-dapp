module hello_world::greeting {
    use std::string;

    public struct Greeting has key {
        id: UID,
        text: string::String,
    }

    public fun new(ctx: &mut TxContext) {
        let new_greeting = Greeting {
            id: object::new(ctx),
            text: b"Hello world!".to_string()
        };
        transfer::share_object(new_greeting);
    }
//0x3f895a8649d48ff8f245732dd6a55cafd4db4e328b95c4dbe2c1c4d0a8583299

    public fun update_text(greeting: &mut Greeting, new_text: string::String) {
        greeting.text = new_text;
    }
}