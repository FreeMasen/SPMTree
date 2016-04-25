import HTTPClient

class Dependent  {
	var Name: String
	var Dependents: [String]
	var Url: String
	var Version: String

	init(name: String, dependents: [String], url: String, version: String) {
		Name = name
		Dependents = dependents
		Url = url
		Version = version
	}

	var description: String {
		let stackedDependants = Dependents.map { "\($0)\n" }
		return "Name: \(Name)\nlocation: \(Url)\nrelies on\(stackedDependants)\n"
	}
}
