manual tests
manualopenFileDescriptorwritable
	"Write Hello World to stderr and check manually.
	Only works if stderr is connected to something sensible."
	<script>

	^self new manualopenFileDescriptorwritable