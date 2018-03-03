*AKGFileSystem
openFileDescriptor: fileDescriptor writable: writableFlag
	"Open the file with fileDescriptor number, and return the file ID obtained"

	<primitive: 'primitiveFileOpenUseFileDescriptor' module: 'FilePlugin' error: error>
	error = #'bad argument' ifTrue: [ 
		fileDescriptor isInteger ifFalse: 
			[ ^self error: 'openFileDescriptor:writable: fileDescriptor must be an integer' ].
		(writableFlag isKindOf: Boolean) ifFalse: 
			[ ^self error: 'openFileDescriptor:writable: writableFlag must be a boolean' ] ].
	OSPlatform current isWindows ifTrue: 
			[ ^self error: 'openFileDescriptor:writable: not supported on Windows' ].
	^ self primitiveFailed 
