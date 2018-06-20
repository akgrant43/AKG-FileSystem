tests
manualopenFileDescriptorwritable
	"Write Hello World to stderr and check manually.
	Only works if stderr is connected to something sensible."

	| handle stream |

	handle := File connectToFileDescriptor: 2 writable: true.
	stream := BinaryFileStream handle: handle
					file: (File named: '/akg/stderr')
					forWrite: true.
	stream nextPutAll: 'Hello World'; lf.