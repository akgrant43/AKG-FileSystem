*AKGFileSystem
openFileFile: filePointer writable: writableFlag
	"Open the file with the supplied FILE* pointer, and return the file ID obtained"

	<primitive: 'primitiveFileOpenUseFile' module: 'FilePlugin' error: error>
	error = #'bad argument' ifTrue: [ 
		filePointer isBytes ifFalse: 
			[ ^self error: 'filePointer must be bytes' ].
		(writableFlag isKindOf: Boolean) ifFalse: 
			[ ^self error: 'writableFlag must be a boolean' ] ].
	^ self primitiveFailed 
