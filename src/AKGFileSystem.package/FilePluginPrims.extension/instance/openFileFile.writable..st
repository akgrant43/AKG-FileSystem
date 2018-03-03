*AKGFileSystem
openFileFile: filePointer writable: writableFlag
	"Open the file with the supplied FILE* pointer, and return the file ID obtained"

	<primitive: 'primitiveFileOpenUseFile' module: 'FilePlugin' error: error>
	error = #'bad argument' ifTrue: [ 
		filePointer isBytes ifFalse: 
			[ ^self error: 'openFileFile:writable: filePointer must be bytes' ].
		(writableFlag isKindOf: Boolean) ifFalse: 
			[ ^self error: 'openFileFile:writable: writableFlag must be a boolean' ] ].
	OSPlatform current isWindows ifTrue: 
			[ ^self error: 'openFileFile:writable: not supported on Windows' ].
	^ self primitiveFailed 
