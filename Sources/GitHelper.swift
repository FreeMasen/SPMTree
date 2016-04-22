import File

class GitHelper {

	static func getRemotePackage(at location: String) {
		do {
			let file = try File(path: location)
			print(file)
		} catch {
			print(error)
		}	
	}

}
