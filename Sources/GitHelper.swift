import File

class GitHelper {

	static func getRemotePackage(at location: String) {
		let file = try File(path: location)
		print(file)	
	}

}
