*** *** Settings ***
Library SeleniumLibrary

*** *** Variables ***
${LOGIN URL}    http://www.poczta.onet.pl/
${BROWSER}    Chrome
@{list} = Niepoprawny email lub hasło.  Wprowadź dane ponownie.


*** Test Cases ***
Valid Login
Open main page
Rodo
Input Username
Input Password
Login button
Assert Onet email
[Teardown]  Close Browser

Invalid Login
Open main page
Input invalid login
Input invalid password
Login button
Assert invalid Onet email
[Teardown]  Close Browser

Valid email and invalid password
Open main page
Rodo
Input email
Click Next
Input invalid password
Login button
Assert invalid password
[Teardown] Close Browser

*** Keywords ***

Open main page
Open browser ${LOGIN URL} ${BROWSER}
Title Should Be Poczta Onet - Darmowa Poczta bez Opłat
Rodo
wait until element is visible
class=cmp-intro_acceptAll
Click Element class=cmp-intro_acceptAll
Input email
Input Text id=email validemail@onet.eu
Click Next
Click Element xpath=//*[contains(text(),'Dalej')]
Input password
wait until element is visible id=password
Input Text id=password validpassword
Login button
click element xpath=//*[contains(text(),'Zaloguj')]
Assert Onet Mail
wait until element is visible
xpath=//*[contains(text(),'Napisz wiadomość')]
page should contain element xpath=//*[contains(text(),'Napisz wiadomość')]
Input invalid email
Input Text id=email blednylogin@onet.pl
Input invalid password
wait until element is visible id=password
Input Text id=password blednehaslo1
Assert invalid email
wait until element is visible
xpath=//*[contains(text(),'Konto nie istnieje')]
page should contain element
xpath=//*[contains(text(),'Konto nie istnieje')]
Assert invalid password
wait until element is visible
xpath=//*[contains(text(),'Nieprawidłowe hasło')]
page should contain element
xpath=//*[contains(text(),'Nieprawidłowe hasło')]