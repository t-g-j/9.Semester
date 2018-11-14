#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 
# Usage: Time a password attempt
#        Takes one argument (password)
#
# Author: Leon Bonde Larsen <leon@bondelarsen.dk>
 
import subprocess
from timeit import timeit
import sys

# import alpahbet
from string import ascii_lowercase
from string import ascii_uppercase

# Settings
attempts_to_average = 50

for c_l in ascii_lowercase:
	print(c_l)
	# parse input arguments
	password = sys.argv[1]+c_l

	# Open process and connect to stdin and stdout
	process = subprocess.Popen(['./get_key'], stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.STDOUT)

	# Init array for keeping execution time per attempt
	exec_times = [0.0]*attempts_to_average

	# Call get_key using subprocess and time it using timeit. Save the result in array
	for i in range(attempts_to_average):
		exec_times[i] = timeit(stmt = "subprocess.Popen(['./get_key'], stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.STDOUT).communicate(input='" + password + "\\n')", setup = "import subprocess", number = 1)

	# Calculate and print average time
	print sum(exec_times) / len(exec_times)

print("Trying uppercase")

for c_l in ascii_uppercase:
	print(c_l)
	# parse input arguments
	password = sys.argv[1]+c_l

	# Open process and connect to stdin and stdout
	process = subprocess.Popen(['./get_key'], stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.STDOUT)

	# Init array for keeping execution time per attempt
	exec_times = [0.0]*attempts_to_average

	# Call get_key using subprocess and time it using timeit. Save the result in array
	for i in range(attempts_to_average):
		exec_times[i] = timeit(stmt = "subprocess.Popen(['./get_key'], stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.STDOUT).communicate(input='" + password + "\\n')", setup = "import subprocess", number = 1)

	# Calculate and print average time
	print sum(exec_times) / len(exec_times)
print("Trying numbers")
for c_l in range(32,64):
	print(chr(c_l))
	# parse input arguments
	password = sys.argv[1]+chr(c_l)

	# Open process and connect to stdin and stdout
	process = subprocess.Popen(['./get_key'], stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.STDOUT)

	# Init array for keeping execution time per attempt
	exec_times = [0.0]*attempts_to_average

	# Call get_key using subprocess and time it using timeit. Save the result in array
	for i in range(attempts_to_average):
		exec_times[i] = timeit(stmt = "subprocess.Popen(['./get_key'], stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.STDOUT).communicate(input='" + password + "\\n')", setup = "import subprocess", number = 1)

	# Calculate and print average time
	print sum(exec_times) / len(exec_times)

