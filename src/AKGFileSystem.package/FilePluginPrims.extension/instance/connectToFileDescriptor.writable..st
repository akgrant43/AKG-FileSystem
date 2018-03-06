*AKGFileSystem
connectToFileDescriptor: fileDescriptor writable: writableFlag
	"Connect to the file with fileDescriptor number, and return the file ID obtained.
	writeableFlag indicates whether to allow write operations and must be compatible with the way the file was opened."

	<primitive: 'primitiveConnectToFileDescriptor' module: 'FilePlugin' error: error>
	error = #'bad argument' ifTrue: [ 
		fileDescriptor isInteger ifFalse: 
			[ ^self error: 'openFileDescriptor:writable: fileDescriptor must be an integer' ].
		(writableFlag isKindOf: Boolean) ifFalse: 
			[ ^self error: 'openFileDescriptor:writable: writableFlag must be a boolean' ] ].
	OSPlatform current isWindows ifTrue: 
			[ ^self error: 'openFileDescriptor:writable: not supported on Windows' ].
	^ self primitiveFailed 
