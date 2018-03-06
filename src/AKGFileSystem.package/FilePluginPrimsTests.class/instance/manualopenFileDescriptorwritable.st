tests
manualopenFileDescriptorwritable
	"Write Hello World to stderr and check manually.
	Only works on POSIX platforms."

	| handle stream |

	handle := FilePluginPrims new connectToFileDescriptor: 2 writable: true.
	stream := BinaryFileStream handle: handle
					file: (File named: '/akg/stderr')
					forWrite: true.
	stream nextPutAll: 'Hello World'; lf.