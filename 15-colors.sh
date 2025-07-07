 #!/bin/bash

 RED='\033[0;31m'
GREEN='\033[0;32m'

NC='\033[0m'


echo -e "${GREEN}This is red text!${NC} And this is normal text."
echo -e "\033[31m This is red text!\033[0m"
echo -e "\033[32m This is green text!\033[0m"
echo -e "\033[33m This is yellow text!\033[0m"

# Output:
# This is red text! (in red color)
# This is green text! (in green color)
# This is yellow text! (in yellow color)
echo -e "\033[37;44m White text on a blue background!\033[0m"

# Output:
# White text on a blue background! (white text on a blue background)
source bash-colors.sh
echo "${green}This is green text!${reset}"

# Output:
# This is green text! (in green color)
