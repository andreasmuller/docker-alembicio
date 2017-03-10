import os
from tornado import gen

def saveFile(func):

    @gen.coroutine
    def yieldable(self, *args, **kwargs ):
        with open("/file.abc", "w") as f:
          f.write(self.request.body)
        func(self, *args, **kwargs)
        os.unlink("/file.abc")

    def _decorator(self, *args, **kwargs):
      yield yieldable(self, *args, **kwargs)
    return _decorator