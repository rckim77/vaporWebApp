import Vapor

final class Routes: RouteCollection {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    func build(_ builder: RouteBuilder) throws {
        /// GET /
        builder.get { req in
            return try self.view.make("welcome")
        }
        
        builder.resource("new", NewController(view))
        
        builder.resource("featured", FeaturedController(view))
        
        builder.resource("allRecipes", AllRecipesController(view))
        
        builder.resource("about", AboutController(view))
        
        /// GET /hello/...
        builder.resource("hello", HelloController(view))
        
        // response to requests to /info domain
        // with a description of the request
        builder.get("info") { req in
            return req.description
        }
        
    }
}
