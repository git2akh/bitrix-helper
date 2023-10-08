from config.constants import constants

conf = constants.load_defaults()

print(conf['VIRTUALBOX']['VM']['FORMATS']['UUID'].format(vm_id=1))

constants.save_json(conf)