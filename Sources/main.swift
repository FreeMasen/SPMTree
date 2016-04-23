
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
				let repo = pkg.replace(".git", with: "")
				let mjr = line[3]
				let mnr = line[5]
				print("org: \(org)")
				print("pkg: \(pkg)")
				GitHelper.remoteDependant(for: org, repo: pkg)
			}
		}
			
		
	} catch {
	print("error: \(error)")
}
}

main()
