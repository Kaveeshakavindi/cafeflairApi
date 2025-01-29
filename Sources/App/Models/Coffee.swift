import Fluent
import Vapor

final class Coffee: Model, Content {
    static let schema = "coffees"

    @ID(custom: .id)
    var id: Int?

    @Field(key: "name")
    var name: String

    @Field(key: "description")
    var description: String

    @Field(key: "image_url")
    var imageUrl: String

    @Field(key: "price")
    var price: Decimal

    @Field(key: "quantity")
    var quantity: Int

    init() {} //create a new , empty coffee. this creates a new instance of the model

    //create a new coffee with all properties set
    init(id: Int? = nil, name: String, description: String, imageUrl: String, price: Decimal, quantity: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.price = price
        self.quantity = quantity
    }
}
