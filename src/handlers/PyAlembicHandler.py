from tornado import web, gen
from tornado import escape
from alembic.Abc import IArchive, WrapExistingFlag
import os
from SaveFile import saveFile

class PyAlembicHandler(web.RequestHandler):

  @gen.coroutine
  def recurse(self, obj, hierarchy):
    hierarchy.append(obj.getName())
    for c in obj.children:
      yield self.recurse(c, hierarchy)

  @gen.coroutine
  @saveFile
  def post(self):
    iarch = IArchive('/file.abc')
    top = iarch.getTop()

    hierarchy = []

    yield self.recurse(top, hierarchy)

    self.write(escape.json_encode({"hierarchy": hierarchy})+"\n")

