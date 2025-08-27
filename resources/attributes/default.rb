### Yara Severity ###
default['redborder']['manager']['yara'] = {}
default['redborder']['manager']['yara']['severity'] = {}
default['redborder']['manager']['yara']['severity']['scores'] = {}
default['redborder']['manager']['yara']['severity']['scores']['high'] = 0.6
default['redborder']['manager']['yara']['severity']['scores']['medium'] = 0.3
default['redborder']['manager']['yara']['severity']['scores']['low'] = 0.1

default['redborder']['manager']['yara']['severity']['high'] = {}
default['redborder']['manager']['yara']['severity']['high']['high_lower_threshold'] = 10
default['redborder']['manager']['yara']['severity']['high']['low_upper_threshold'] = 5
default['redborder']['manager']['yara']['severity']['high']['high_score'] = 100
default['redborder']['manager']['yara']['severity']['high']['medium_score'] = 60
default['redborder']['manager']['yara']['severity']['high']['low_score'] = 30

default['redborder']['manager']['yara']['severity']['medium'] = {}
default['redborder']['manager']['yara']['severity']['medium']['high_lower_threshold'] = 10
default['redborder']['manager']['yara']['severity']['medium']['low_upper_threshold'] = 5
default['redborder']['manager']['yara']['severity']['medium']['high_score'] = 100
default['redborder']['manager']['yara']['severity']['medium']['medium_score'] = 60
default['redborder']['manager']['yara']['severity']['medium']['low_score'] = 30

default['redborder']['manager']['yara']['severity']['low'] = {}
default['redborder']['manager']['yara']['severity']['low']['high_lower_threshold'] = 10
default['redborder']['manager']['yara']['severity']['low']['low_upper_threshold'] = 5
default['redborder']['manager']['yara']['severity']['low']['high_score'] = 100
default['redborder']['manager']['yara']['severity']['low']['medium_score'] = 60
default['redborder']['manager']['yara']['severity']['low']['low_score'] = 30
