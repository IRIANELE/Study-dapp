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

    public fun update_text(greeting: &mut Greeting, new_text: string::String) {
        greeting.text = new_text;
    }
}
