from tornado import web, ioloop, gen
import alembic

import os
print(os.getcwd())

from handlers.ABCEchoHandler import ABCEchoHandler
from handlers.ABCTreeHandler import ABCTreeHandler
from handlers.PyAlembicHandler import PyAlembicHandler

def run():
  app = web.Application([
    ("/abcecho", ABCEchoHandler),
    ("/abctree", ABCTreeHandler),
    ("/pyalembic", PyAlembicHandler)
    ], debug=True)

  app.listen(9090)
  ioloop.IOLoop.current().start()

if __name__ == '__main__':
  run()