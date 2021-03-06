JsOsaDAS1.001.00bplist00�Vscript_Econst sublimeTextBinary = '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
const app = Application.currentApplication();
app.includeStandardAdditions = true;

function run(argv) {
	// Parse the interesting components
	const url        = argv[0]["URL"]
    const query      = url.split('?', 2)[1];
    const paramPairs = query.split('&').map(arg => arg.split('=', 2))
    const params     = paramPairs.reduce((acc, [key, value]) => { acc[key] = decodeURIComponent(value); return acc; }, {})
	var file       = params.url.replace(/^file:\/\//, "");

	// read mapping from home dir
	let homeDirURL = $.NSFileManager.defaultManager.homeDirectoryForCurrentUser
	let configFile = ObjC.unwrap(homeDirURL.path) + "/.sublime_url"
	const configFileExists = $.NSFileManager.defaultManager.fileExistsAtPath(configFile);
	if (configFileExists) {
		var data     = $.NSData.dataWithContentsOfFile(configFile);
		var nsStr = $.NSString.alloc.initWithDataEncoding(data, $.NSUTF8StringEncoding);
		var str   = ObjC.unwrap(nsStr).split(' ', 2);
		const from = str[0].trim()
		const to = str[1].trim()
		file = file.replace(from,to)
	}
	
	// Test file existence
    let isDirectory = Ref();
    const fileExists = $.NSFileManager.defaultManager.fileExistsAtPathIsDirectory(file, isDirectory);

    if (fileExists && isDirectory[0] !== 1) {
		// Safely call the binary using Foundation framework
		let task = $.NSTask.alloc.init
		task.launchPath = sublimeTextBinary
		task.arguments = [`${file}:${params.line}:${params.column}`]
		task.launch
    } else {
		app.displayAlert(`File not found: ${file}`)
    }
}
                              [ jscr  ��ޭ