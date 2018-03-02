*AKGFileSystem
openFileDescriptor: fileDescriptor writable: writableFlag
	"Open the file with fileDescriptor number, and return the file ID obtained"

	<primitive: 'primitiveFileOpenUseFileDescriptor' module: 'FilePlugin' error: error>
	error = #'bad argument' ifTrue: [ 
		fileDescriptor isInteger ifFalse: 
			[ ^self error: 'fileDescriptor must be an integer' ].
		(writableFlag isKindOf: Boolean) ifFalse: 
			[ ^self error: 'writableFlag must be a boolean' ] ].
	^ self primitiveFailed 
