from tornado import web, gen
import subprocess
import os
from SaveFile import saveFile

class ABCTreeHandler(web.RequestHandler):
  @gen.coroutine
  @saveFile
  def post(self):
    p = subprocess.Popen(['abctree', '/file.abc'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    self.write(p.communicate()[0])

