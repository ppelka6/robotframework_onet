# README
Wou need to add webdriver into path folder. You must have installed Python, Robotframework and SeleniumLibrary.

# Install
    pip install robotframework

# Upgrade to the latest version
    pip install --upgrade robotframework

# Uninstall
    pip uninstall robotframework

# Install SeleniumLibrary
    pip install robotframework-selenium2library

# RUN
In cmd we should use:

    robot Onet.robot

Run on the different browser:

Use variable BROWSER for example Chrome, Firefox, Edge, ie

Make sure that driver is in the path

    robot -v BROWSER:Chrome Onet.robot 

(the above case applies to this file (Onet.robot))
