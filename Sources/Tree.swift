import HTTPClient

struct Tree {
	var Dependents: [Dependent]
	
	func description() -> [String:[Dependent]] {
		return ["tree": Dependents]
		
	}
}
