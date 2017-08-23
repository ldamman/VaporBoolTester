import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)

		get("/pretty") { req  in
			return JSON(["someFlag": true])
		}

		get("/ugly") { req  in
			return try Response(status: .ok, json: JSON(["someFlag": true]))
		}

		get("/uglier") { req  in
			let response = Response(status: .ok)
			response.json = JSON(["someFlag": true])
			return response
		}
	}
}
