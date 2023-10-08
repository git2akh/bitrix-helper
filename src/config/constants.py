from yaml import safe_load
from json import dump
from .constants_proto import Constants
from os import getcwd
from os.path import abspath

class constants(Constants):
    def __init__(self):
        pass

    @staticmethod
    def load_defaults():
        print(abspath(getcwd()))
        with open(".defaults/.constants.yml","r") as defaults_file:
            self : constants = safe_load(defaults_file.read())
            return self

    @staticmethod
    def save_json(self):
        # Write YAML object to JSON format
        with open('constants.json', 'w') as f:
            dump(self, f, sort_keys=False)
