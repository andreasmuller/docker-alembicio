from tornado import web, gen
import subprocess
from SaveFile import saveFile

class ABCEchoHandler(web.RequestHandler):
  @gen.coroutine
  @saveFile
  def post(self):
    p = subprocess.Popen(['abcecho', '/file.abc'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    self.write(p.communicate()[0])

