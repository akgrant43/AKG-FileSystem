tests
testOpenFileFileWritable
	"Test FilePluginPrims>>openFileFile:writable:
	To get a FILE* pointer this method directly accesses the internals of a normal file stream, which is bad practice!  It also relies on SQFile being up to date, which it may not be!
	If you don't know what you're doing, run away now!"

	| tmpFileName testText origFile origSqFile newSqFile stream size contents handle |

	tmpFileName := FileReference newTempFilePrefix: 'testFilePlugin' suffix: 'testOpenFileFileWritable'.
	testText := 'Test text'.
	tmpFileName writeStreamDo: [ :wstream |
		wstream nextPutAll: testText ].
	origFile := tmpFileName readStream.
	origSqFile := SQFile fromHandle: (origFile wrappedStream wrappedStream instVarNamed: #handle).
	handle := File connectToFile: (origSqFile file getHandle asByteArrayPointer) writable: false.
	newSqFile := SQFile fromHandle: handle.
	self assert: origSqFile file getHandle equals: newSqFile file getHandle.
	stream := BinaryFileStream
		handle: handle
		file: (File named: 'akgFromFile')
		forWrite: false.
	stream position: 0.
	contents := stream upToEnd.
	origFile close.
	size := contents size.
	self assert: size equals: testText size.
	self assert: contents asString equals: testText.
	tmpFileName ensureDelete.