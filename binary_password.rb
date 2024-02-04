# frozen_string_literal: true

# A password string, pwd, consists of binary characters (Os and 1s).
# A cyber security expert is trying to determine the minimum number of
# changes required to make the password secure. To do so, it must be
# divided into substrings of non-overlapping, even length substrings.
# Each substring can only contain 1s or Os, not a mix. This helps to
# ensure that the password is strong and less vulnerable to hacking attacks.

# Find the minimum number of characters that must be flipped in the password string,
# i.e. changed from 0 to 1 or 1 to 0 to allow the string to be divided as described.
# Note: A substring is a contiguous sequence of characters in a string.

# Given pwd = '1110011000'

# The two substrings have lengths 8 and 2 respectively. Since both lengths are even,
# the division is valid. So the answer is 3.

# Function Description

# Complete the function getMinFlips in the editor below.
# getMinFlips takes the following arguments: str pwd: the binary string

# Returns
# int: the minimum number of flips to make the division possible

# Constraints
# • 2 ≤ pwd≤ 105
# • The length of pwd is even.
# • pwd contains only 1s and Os.

def get_min_flips(pwd); end

# EXECUTION --------------------------------
pwd = '1110011000'

puts get_min_flips(pwd)
