tests
manualopenFileDescriptorwritable
	"Write Hello World to stderr and check manually"

	| handle stream |

	handle := FilePluginPrims new openFileDescriptor: 2 writable: true.
	stream := BinaryFileStream handle: handle
					file: (File named: '/akg/stderr')
					forWrite: true.
	stream nextPutAll: 'Hello World'; lf.