import Fluent
import Vapor

final class Coffee: Model, Content {
    static let schema = "coffees" // Matches your table name in Postgres

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "description")
    var description: String

    @Field(key: "image_url")
    var imageUrl: String

    @Field(key: "price")
    var price: Double

    @Field(key: "quantity")
    var quantity: Int

    init() {}

    init(id: UUID? = nil, name: String, description: String, imageUrl: String, price: Double, quantity: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.price = price
        self.quantity = quantity
    }
}
