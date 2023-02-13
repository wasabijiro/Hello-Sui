module hello_sui::wasabi {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    const MODULE_ADMIN: address = @hello_sui;

    struct Wasabi has key {
        id: UID,
        value: u64,
    }

    entry fun create_wasabi(ctx: &mut TxContext) {
        let wasabi = Wasabi {
            id: object::new(ctx),
            value: 0
        };
        transfer::transfer(wasabi, tx_context::sender(ctx))
    }

    entry fun push_wasabi(wasabi: &mut Wasabi, value: u64) {
        wasabi.value = value;
    }

}