module 0x6b57a3674949834249d415c18ed5fabe7ca797845d66aabc1d280e1e2d6b750d::anony_message {

    use sui::object;
    use sui::tx_context;

    public struct Message has key {
        id: UID,
        sender: address,
        content: vector<u8>,       
    }

    public fun send_message(content: vector<u8>, ctx: &mut TxContext): Message {
        Message {
            id: object::new(ctx),                         
            sender: tx_context::sender(ctx),              
            content,                                      
        }
    }
}
