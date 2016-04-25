import File

func main() {

	let charSet = CharacterSet(characters: ["\t",",",")","\""])
	
	do {
		let wkdir = try File.workingDirectory()
		
		let file = try File(path: "\(wkdir)/Package.swift")
		let contents = try file.read()
		let contentsString = contents.description
		if contentsString.contains(".Package") {
			let lines = contentsString.splitBy("\n")
			let relevantlines = lines.filter { $0.contains(".Package") }
			let splitLinesArray = relevantlines.map { $0.trim(charSet).split(" ") }
			for line in splitLinesArray {
					
				let splitAddr = line[1].split("/")
				let org = splitAddr[2].trim(charSet)
				var pkg = splitAddr[3].trim(charSet)
				print(pkg)
				pkg.replace(".git", with: "")
				print(pkg)
				let mjr = line[3]
				let mnr = line[5]
				let dependent = Dependent(name: pkg, dependents: [String](), url: line[1], version: "\(mjr).\(mnr)")
				print(dependent.description)
				//				GitHelper.remoteDependant(for: org, repo: pkg)
			}
		}
			
		
	} catch {
	print("error: \(error)")
}
}

main()
