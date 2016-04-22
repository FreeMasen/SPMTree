
import File

func main() {

	let charSet = CharacterSet(characters: ["\t",","])
	
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
				GitHelper.getRemoteFile(line[1])
				let splitAddr = line[1].split("/")
				let org = splitAddr[2]
				let pkg = splitAddr[3]
				let mjr = line[3]
				let mnr = line[5]
				var itter = 0
				print("org: \(org)\npkg: \(pkg)\n\(mjr)\n\(mnr)")
			}
		}
			
		
	} catch {
	print("error: \(error)")
}
}

main()
