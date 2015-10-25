module Test.Main where

import Prelude
import Node.Path
import Test.Assert

main = do
  assert $ normalize "/foo/bar//baz/asdf/quux/.." == normalize "/foo/bar/baz/asdf"
  assert $ concat ["/foo", "bar"] == normalize "/foo/bar"
  assert $ relative "/data/orandea/test/aaa" "/data/orandea/impl/bbb" == normalize "../../impl/bbb"
  assert $ dirname "/foo/bar/baz/asdf/quux" == normalize "/foo/bar/baz/asdf"
  assert $ basename "/foo/bar/baz/asdf/quux.html" == "quux.html"
  assert $ basenameWithoutExt "/foo/bar/baz/asdf/quux.html" ".html" == "quux"
  assert $ basenameWithoutExt "/foo/bar/baz/asdf/quux.txt" ".html" == "quux.txt"
  assert $ extname "index.html" == ".html"
  assert $ extname "index.coffee.md" == ".md"
  assert $ extname "index." == "."
  assert $ extname "index" == ""
  assert $ sep == normalize "/"
  assert $ delimiter == ";" || delimiter == ":"
  path1 <- resolve []
  path2 <- resolve ["."]
  assert $ path1 == path2
