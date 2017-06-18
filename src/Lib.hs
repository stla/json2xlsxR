{-# LANGUAGE ForeignFunctionInterface #-}
module Lib
  where
import JSONtoXLSX (writeXlsx4)
import Foreign
import Foreign.C
import Data.ByteString (packCString)
-- import Data.Text
-- import Data.Text.Encoding
-- import Foreign.C.String
-- import Foreign.Marshal.Alloc

-- decode :: CString -> IO Text
-- decode cstr = do
--   bytestr <- packCString cstr
--   return (decodeUtf8 bytestr)
--
-- encode :: Text -> (CString -> IO a) -> IO a
-- encode text = useAsCString (encodeUtf8 text)

foreign export ccall json2xlsx :: Ptr CString -> Ptr CString -> Ptr CString -> IO ()
json2xlsx :: Ptr CString -> Ptr CString -> Ptr CString -> IO ()
json2xlsx json1 json2 outfile = do
  _json1 <- peek json1
  _json2 <- peek json2
  _outfile <- peek outfile
  -- json <- decode _json1
  -- json1 <- encode json peekCString
  -- json1 <- peekCString _json1
  -- json2 <- peekCString _json2
  json1 <- packCString _json1
  json2 <- packCString _json2
  outfile <- peekCString _outfile
  writeXlsx4 json1 json2 outfile
