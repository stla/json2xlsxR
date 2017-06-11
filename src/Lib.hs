{-# LANGUAGE ForeignFunctionInterface #-}
module Lib
  where
import WriteXLSX
import Foreign
import Foreign.C

foreign export ccall json2xlsx :: Ptr CString -> Ptr CString -> IO ()
json2xlsx :: Ptr CString -> Ptr CString -> IO ()
json2xlsx json outfile = do
  _json <- peek json
  _outfile <- peek outfile
  json <- peekCString _json
  outfile <- peekCString _outfile
  writeXlsx json outfile
