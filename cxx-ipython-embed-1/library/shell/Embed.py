### Embed.py
###
### Copyright 2017 Mac Radigan
### All Rights Reserved

from traitlets.config.loader import Config
from IPython.terminal.embed import InteractiveShellEmbed
from IPython import embed
from IPython import get_ipython
from IPython.terminal.prompts import Prompts
from pygments.token import Token

class Embed(object):
  'embedded IPython wrapper'
  def __init__(self):
    'ctor'
    pass
  def interact(self):
    'interact'
    get_ipython
    cfg = Config()
    self.ipshell = InteractiveShellEmbed()
    self.ipshell()
  def interact(self, prompt, banner, welcome_message, exit_message):
    'interact'
    get_ipython
    cfg = Config()
    self.ipshell = InteractiveShellEmbed(config=cfg,
                     banner1 = banner,
                     exit_msg = exit_message)
    class MyPrompt(Prompts):
      def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, prompt)]
    self.ipshell.prompts=MyPrompt(self.ipshell)
    self.ipshell(welcome_message)

### *EOF*
