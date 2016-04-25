import File
import HTTPClient
import URI
import HTTP

class GitHelper {

	static let header = Headers(dictionaryLiteral: ("freemasen", "f31f3b2c9f88e2d1800227e5509fd5f05d036763" ))
	
	static func remoteDependant(for organization: String, repo: String) {
		let url = buildURI(for: repo, in: organization)
		print("url: \(url)")
		requestFileContents(at: url)
	}
	
	static func requestFileContents(at url: String) {
		do {
			let client = try Client(host: "http://robertmasen.pizza", port: 80)
			
			let response = try client.get(url, headers: header)
			
			print("response: \(response)")
		} catch {
			print(error)
		}
	}

	static func buildURI(for repo: String, in organization: String) -> String {
		return"https://api.github.com/repos/\(organization)/\(repo)/contents/Package.swift"
	}
}
