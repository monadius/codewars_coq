From CW Require Loader.
Require Extraction.

Extraction "out.ml" plus.
CWCompileAndRun "out.mli" "out.ml" Options "-I . -verbose" Driver "
  open Out
  let () = assert (add O (S O) = (S O))
".