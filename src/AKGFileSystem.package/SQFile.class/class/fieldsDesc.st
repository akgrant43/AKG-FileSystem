structure
fieldsDesc
	"self rebuildFieldAccessors"

	^#(
  int                    sessionID;
  void                  *file;
  "squeakFileOffsetType -> signed32 -> int32"
  int32                  fileSize;
  char                   writable;
  char                   lastOp;
  char                   lastChar;
  char                   isStdioStream;
	)