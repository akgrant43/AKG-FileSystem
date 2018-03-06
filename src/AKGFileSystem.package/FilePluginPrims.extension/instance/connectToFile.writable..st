*AKGFileSystem
connectToFile: filePointer writable: writableFlag
	"Open the file with the supplied FILE* pointer, and return the file ID obtained"

	<primitive: 'primitiveConnectToFile' module: 'FilePlugin' error: error>
	error = #'bad argument' ifTrue: [ 
		filePointer isBytes ifFalse: 
			[ ^self error: 'openFileFile:writable: filePointer must be bytes' ].
		(writableFlag isKindOf: Boolean) ifFalse: 
			[ ^self error: 'openFileFile:writable: writableFlag must be a boolean' ] ].
	^ self primitiveFailed 
