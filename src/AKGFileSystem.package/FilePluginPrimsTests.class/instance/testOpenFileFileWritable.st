tests
testOpenFileFileWritable
	"Test FilePluginPrims>>openFileFile:writable:
	To get a FILE* pointer this method directly accesses the internals of a normal file stream, which is bad practice!  It also relies on SQFile being up to date, which it may not be!
	If you don't know what you're doing, run away now!"

	| tmpFileName testText origFile sqFile stream size contents |

	tmpFileName := FileReference newTempFilePrefix: 'testFilePlugin' suffix: 'testOpenFileFileWritable'.
	testText := 'Test text'.
	tmpFileName writeStreamDo: [ :wstream |
		wstream nextPutAll: testText ].
	origFile := tmpFileName readStream.
	sqFile := SQFile fromHandle: (origFile instVarNamed: #fileID).
	stream := BinaryFileStream
		handle: sqFile getHandle
		file: (File named: 'akgFromFile')
		forWrite: false.
	size := stream size.
	contents := stream next: size.
	origFile close.
	stream close.
	self assert: size equals: testText size.
	self assert: contents asString equals: testText.
	tmpFileName ensureDelete.