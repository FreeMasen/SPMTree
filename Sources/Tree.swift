import HTTPClient

struct Tree {
	var Dependants: [Dependant]
	
	func description() -> [String:[Dependant]] {
		return ["tree": Dependants]
	}
}
