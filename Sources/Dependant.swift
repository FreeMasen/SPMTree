import HTTPClient

class Dependant  {
	var Name: String
	var Dependants: [String]
	var Url: String
	var Version: String

	init(name: String, dependants: [String], url: String, version: String) {
		Name = name
		Dependants = dependants
		Url = url
		Version = version
	}

	var description: String {
		let stackedDependants = Dependants.map { "\($0)\n" }
		return "Name: \(Name)\nlocation: \(Url)\n\relies on(stackedDependants)\n"
	}
}
