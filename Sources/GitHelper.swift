import File
import HTTPClient
import URI

class GitHelper {

	static func remoteDependant(for organization: String, repo: String) {
		let url = buildURI(for: repo, in: organization)
		print("url: \(url)")
		requestFileContents(at: url)
	}
	
	static func requestFileContents(at url: String) {
		do {
			let client = try Client(host: "robertmasen.pizza", port: 80)
			print("client: \(client)")
			let response = try client.get( url)
			print(response)
//			if let body = response.body {
//				print(body)
//			} else {
//				print("failed: \(response)")
//			}
		} catch {
			print(error)
		}
	}

	static func buildURI(for repo: String, in organization: String) -> String {
		return"https://api.github.com/repos/\(organization)/\(repo)/contents/Package.swift"
	}
}
