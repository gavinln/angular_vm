#!/usr/bin/env python	

from __future__ import print_function

''' links the specified javascript project to a subdirectory
except for the node_modules and bower_components directories
'''

import os
import sys

FILE_DIR = os.path.dirname(os.path.realpath(__file__))


def exit_missing_file(files, fileName):
	if not fileName in files:
		sys.exit('{} is missing from the project'.format(fileName))


def get_proj_root(proj_dir):
	[path, dirname] = os.path.split(proj_dir)
	return dirname


def main():
	if len(sys.argv) == 1:
		sys.exit('No project name specified')

	proj_dir = sys.argv[1]

	if not os.path.isdir(proj_dir):
		sys.exit('{} is not a directory'.format(proj_dir))

	files = os.listdir(proj_dir)

	node_mod_file = 'package.json'
	bower_mod_file = 'bower.json'

	exit_missing_file(files, node_mod_file)
	exit_missing_file(files, bower_mod_file)

	proj_root = get_proj_root(proj_dir)
	proj_root = 'ga_proj2'

	linked_root = os.path.join(FILE_DIR, proj_root)

	if os.path.exists(linked_root):
		sys.exit('Linked project {} already exists'.format(linked_root))

	os.makedirs(linked_root)

	for fileName in files:
		if fileName not in ['node_modules', 'bower_components']:
			os.symlink(os.path.join(proj_dir, fileName),
					os.path.join(linked_root, fileName))


if __name__ == "__main__":
	main()

