*** Settings ***
Documentation     A test suite for valid login.
...
...               Keywords are imported from the resource file
Resource          keywords.resource
Default Tags      positive
Library  SeleniumLibrary

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    chrome

*** Test Cases **
Login User with Password
Denied Login with Wrong Password
Add to card
Remove iteams from card
Goto Card
Checkout 
Validate lables after click on checkout 



*** Keywords ***
Login User with Password
    Open Browser   ${url}    ${browser}
    Fill Text    id=user-name        standard_user
    Fill Text    id="password"       secret_pass
    Wait Until Element Is Visible    name=login-button
    Click Element   id=login-button
    
    [Teardown]    Close Browser
Denied Login with Wrong Password
    [GoTags]    negative
    Open Browser   ${url}    ${browser}
    Fill Text    id=user-name        standard_userdvj
    Fill Text    id="password"       secret_pass
    Wait Until Element Is Visible    name=login-button
    Click Element    id=login-button
    [Teardown]    Close Browser
    
    title should be        Swag Labs

Add to card
    Wait Until Element Is Visble    name=add-to-cart-sauce-labs-backpack
    click Element     name=add-to-cart-sauce-labs-backpack
 Remove iteams from card
       Wait Until Element Is Visble  //button[@class='btn btn_secondary btn_small btn_inventory']
       click Element   //button[@class='btn btn_secondary btn_small btn_inventory']

 Goto Card 
     Click Link    //a[@class='shopping_cart_link']  
 Checkout

     Element Should Be Visible    id=remove-sauce-labs-bike-light  
     Element Should Be Visible    id=continue-shopping
    
 Validate lables after click on checkout    
     input text    id=first-name    Prrj
     input text    id=last-name    knsmnmn
     input text    name=postalCode    410053
     Wait Until Element Is Visble    //button[@class="btn btn_action btn_medium checkout_button"]
     Click Element    //button[@class="btn btn_action btn_medium checkout_button"]
     Element Should Be Visible    class=cart_item_label
     Wait Until Element Is Visble    name=finish
     Click Element    name=finish
     Page Should Contain    Checkout: Complete!



