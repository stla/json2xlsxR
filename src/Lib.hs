{-# LANGUAGE ForeignFunctionInterface #-}
module Lib
  where
import WriteXLSX (writeXlsx3)
import Foreign
import Foreign.C

foreign export ccall json2xlsx :: Ptr CString -> Ptr CString -> Ptr CString -> IO ()
json2xlsx :: Ptr CString -> Ptr CString -> Ptr CString -> IO ()
json2xlsx json1 json2 outfile = do
  _json1 <- peek json1
  _json2 <- peek json2
  _outfile <- peek outfile
  json1 <- peekCString _json1
  json2 <- peekCString _json2
  outfile <- peekCString _outfile
  writeXlsx3 json1 json2 outfile
