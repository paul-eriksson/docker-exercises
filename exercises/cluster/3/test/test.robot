*** Settings ***
Library    RequestsLibrary
Library    String

Suite Setup    Connect to server


*** Test Cases ***
Hello returns Hi Man
    ${response}=    Get Request    hellosession    /hello
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.content}    Hi man!

Count returns I have x platinum hits
    ${response}=    Get Request    hellosession    /count
    Should Be Equal As Strings    ${response.status_code}    200
    ${text}=    Decode Bytes To String    ${response.content}    UTF-8
    Should Match Regexp    ${text}    I have \\d+ platinum hits!

Count increases the count
    ${response_1}=    Get Request    hellosession    /count
    Should Be Equal As Strings    ${response_1.status_code}    200
    ${text_1}=    Decode Bytes To String    ${response_1.content}    UTF-8
    ${count_1}=    Get Regexp Matches    ${text_1}    \\d+
    Length Should Be    ${count_1}    1

    ${response_2}=    Get Request    hellosession    /count
    Should Be Equal As Strings    ${response_2.status_code}    200
    ${text_2}=    Decode Bytes To String    ${response_2.content}    UTF-8
    ${count_2}=    Get Regexp Matches    ${text_1}    \\d+
    Length Should Be    ${count_2}    1

    Should Be Equal As Integers    ${count_1[0]}    ${count_2[0]}


*** Keywords ***
Connect to server
    Sleep    2
    Create Session    hellosession    http://web:5000
