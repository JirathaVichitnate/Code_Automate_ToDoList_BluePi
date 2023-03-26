*** Settings ***
Library           Selenium2Library
Library           DateTime
#Library           BuiltIn
#Library           RequestsLibrary
#Library           String
#Library           Collections
#Library           OperatingSystem
#Library           json
#Library           DateTime
#Library           DatabaseLibrary
#Library           OperatingSystem
#
#Library           Selenium2Library
#Library           DatabaseLibrary
#Library           cx_Oracle
#
#Library           ExcelLibrary
    If /ElSE If /ELSE in Robot Framework

Resource         ../../Resources/Keywords/Common_repository.robot
Resource         ../../Resources/Keywords/Common_variables.robot
Resource         ../Keywords/Common_Keywords.robot



*** Keywords ***
Open URL To Do List
    Open Browser    ${URL}    ${Browser}       options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window








Open URL
    Open Browser    ${URL}    ${Browser}    options=add_argument("--ignore-certificate-errors")     #${URL}     ${Browser}

    Maximize Browser Window
Open URL Kubota
    Open Browser    ${Kubata_URL}    ${Browser}    options=add_argument("--ignore-certificate-errors")     #${URL}     ${Browser}
    Maximize Browser Window
Then login with Admin User
    Wait Until Page Contains Element    ${LoginUser}   ${Thirty_Second}
    wait until keyword succeeds     2 m       2 s   input text      ${LoginUser}        ${username}
    wait until keyword succeeds     2 m       2 s   input text      ${LoginPass}        ${password}
    wait until keyword succeeds     2 m       2 s   click element   ${LoginButt}
    Wait Until Page Contains Element    ${pay}   ${Thirty_Second}

Then login with Admin User Kubota
    Wait Until Page Contains Element    ${Page_Before_Login}    ${Thirty_Second}
    Wait Until Page Contains Element     ${OKButton}                ${Thirty_Second}
    wait until keyword succeeds     2 m       2 s   click element           ${OKButton}
    Wait Until Page Contains Element    ${LoginUserKubota}   ${Thirty_Second}
    wait until keyword succeeds     2 m       2 s   input text      ${LoginUserKubota}        ${username}
    wait until keyword succeeds     2 m       2 s   input text      ${LoginPasswordKubota}        ${password}
    Wait Until Element Is Enabled    ${SignInButonKubota}     ${Thirty_Second}
    wait until keyword succeeds     2 m       2 s   click element   ${SignInButonKubota}
    Wait Until Page Contains Element    ${BusinessPortal}   ${Thirty_Second}

Connect Database on STG
     #Connect To Database Using Custom Params    cx_Oracle    user='chanawun', password='m7$fz#0i', dsn='(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(COMMUNITY=tcp)(PROTOCOL=TCP)(HOST = 10.252.164.21)(PORT = 1523)))(CONNECT_DATA=(SERVICE_NAME=sbniwftst)(SERVER=DEDICATED)))'
     Connect To Database Using Custom Params   psycopg2   database='sbniwfsit', user='joseph_jg00824787', password='JaYlEe@123', host='psql-enterpriseapp-az-asse-dev-001.postgres.database.azure.com', port=5432

Query Database on STG Status
   [Arguments]     ${rbm_status}
   ${rbm_query}     set variable           SELECT cs_version_status FROM sbniwf.pcs_cost_sheet_version  #WHERE cs_version_status = '${rbm_status}'
#   ${rbm_query}     set variable     ${cs_version_status}= '${rbm_status}'
#   SELECT cs_version_status FROM sbniwf.pcs_cost_sheet_version WHERE cs_version_status = '${rbm_status}'
   log       String SQL : ${rbm_query}
   @{Result0fQuery}       Query          ${rbm_query}
   should contain  ${Result0fQuery}[0]  ${rbm_status}

Query Database on STG Op ID
   [Arguments]     ${rbm_status}
   ${rbm_query}     set variable           SELECT opportunity_id FROM pcs_cost_sheet_version WHERE opportunity_id = '${rbm_status}'
#   ${rbm_query}     set variable     ${cs_version_status}= '${rbm_status}'
#   SELECT cs_version_status FROM sbniwf.pcs_cost_sheet_version WHERE cs_version_status = '${rbm_status}'
   log       String SQL : ${rbm_query}
   @{Result0fQuery}       Query          ${rbm_query}
   should contain  ${Result0fQuery}[0]  ${rbm_status}

Query Database on STG Ver No.
   [Arguments]     ${rbm_status}
   ${rbm_query}     set variable           SELECT cost_sheet_version_no FROM sbniwf.pcs_cost_sheet_version WHERE cost_sheet_version_no = '${rbm_status}'
#   ${rbm_query}     set variable     ${cs_version_status}= '${rbm_status}'
#   SELECT cs_version_status FROM sbniwf.pcs_cost_sheet_version WHERE cs_version_status = '${rbm_status}'
   log       String SQL : ${rbm_query}
   @{Result0fQuery}       Query          ${rbm_query}
   should contain  ${Result0fQuery}[0]  ${rbm_status}

Query Database on STG Ver Ord Typ
   [Arguments]     ${rbm_status}
   ${rbm_query}     set variable           SELECT order_type FROM sbniwf.pcs_cost_sheet_version WHERE order_type = '${rbm_status}'
#   ${rbm_query}     set variable     ${cs_version_status}= '${rbm_status}'
#   SELECT cs_version_status FROM sbniwf.pcs_cost_sheet_version WHERE cs_version_status = '${rbm_status}'
   log       String SQL : ${rbm_query}
   @{Result0fQuery}       Query          ${rbm_query}
   should contain  ${Result0fQuery}[0]  ${rbm_status}

Query Database on STG Lease Line Type
   [Arguments]     ${rbm_status}
   ${rbm_query}     set variable           SELECT lease_line_flg FROM sbniwf.pcs_cost_sheet_version WHERE lease_line_flg = '${rbm_status}'
#   ${rbm_query}     set variable     ${cs_version_status}= '${rbm_status}'
#   SELECT cs_version_status FROM sbniwf.pcs_cost_sheet_version WHERE cs_version_status = '${rbm_status}'
   log       String SQL : ${rbm_query}
   @{Result0fQuery}       Query          ${rbm_query}
   should contain  ${Result0fQuery}[0]  ${rbm_status}

Query Database on STG ID
   [Arguments]     ${rbm_status}
   ${rbm_query}     set variable     ${cs_version_ID}= '${rbm_status}'
#   SELECT cs_version_status FROM sbniwf.pcs_cost_sheet_version WHERE cs_version_status = '${rbm_status}'
   log       String SQL : ${rbm_query}
   @{Result0fQuery}       Query          ${rbm_query}
   should contain  ${Result0fQuery}[0]  ${rbm_status}



Then Check For Approved List Table Count
    [Arguments]    ${Expcount}

    click element       ${Approved_ListTabLoc}
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${SearchTextLoc}
    ${SelectedText}     get selected list value     ${CostSheetDropDownLoc}
    RUN KEYWORD IF      ${SelectedText} != ${Expcount}     select from list by value     ${CostSheetDropDownLoc}    ${Expcount}
    sleep   2 s
    ${count}    get element count    ${ApprovedListSheetTableCountLoc}
    should be equal as strings    ${count}    ${Expcount}
    close all browsers
Open Pricing Url
    ${browser}  set variable  Edge
    IF    '${browser}'=='Firefox'
        Open Browser    ${Stage_URL}    ff    options=binary='C:/Users/jg00824787/AppData/Local/Mozilla Firefox/firefox.exe'
        ...    ff_profile_dir=set_preference("browser.download.folderList", 2);set_preference("browser.download.dir", r"${downloadpath}");set_preference("browser.helperApps.neverAsk.saveToDisk", "application/zip")
    END
    IF    '${browser}'=='ff'
        Open Browser    ${Stage_URL}    ff    options=binary='C:/Users/jg00824787/AppData/Local/Mozilla Firefox/firefox.exe'
        ...    ff_profile_dir=set_preference("browser.download.folderList", 2);set_preference("browser.download.dir", r"${downloadpath}");set_preference("browser.helperApps.neverAsk.saveToDisk", "application/zip")
    END
    IF    '${browser}'=='Chrome'
        ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        ${disabled}    Create List    Chrome PDF Viewer
        ${prefs} =    create dictionary    download.prompt_for_download=${FALSE}    download.directory_upgrade=${TRUE}    download.default_directory=${OUTPUT_DIR}    safebrowsing.enabled=${TRUE}
        call method    ${CHROME_OPTIONS}    add_experimental_option    prefs    ${prefs}
        Call Method    ${chromeOptions}    add_argument    --ignore-certificate-errors
        create webdriver    Chrome    chrome_options=${CHROME_OPTIONS}
        IF    '${Execution_Env}'=='Stage'
            Go To    ${Stage_URL}
        ELSE
            Go To    ${Dev_URL}
        END
    END
    IF  '${browser}'=='Edge'
        ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
        ${prefs} =    Create Dictionary    download.default_directory=${OUTPUT_DIR} 
        Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
        Call Method    ${chromeOptions}    add_argument    --ignore-certificate-errors
        Open Browser    ${Pricing_web_url}     Edge  options=${chromeOptions}
    END
    Maximize Browser Window
    Accept Cert If Any
    # [Arguments]         ${browser}=Edge       ${avoid-https}=True
    # ${device}=          open browser     ${Pricing_web_url}          ${browser}     options=add_argument("--ignore-certificate-errors")
    # Maximize Browser Window
    # Sleep   10 s
Open Pricing CSL Url
    ${browser}  set variable  Edge
    IF    '${browser}'=='Firefox'
        Open Browser    ${Stage_URL}    ff    options=binary='C:/Users/jg00824787/AppData/Local/Mozilla Firefox/firefox.exe'
        ...    ff_profile_dir=set_preference("browser.download.folderList", 2);set_preference("browser.download.dir", r"${downloadpath}");set_preference("browser.helperApps.neverAsk.saveToDisk", "application/zip")
    END
    IF    '${browser}'=='ff'
        Open Browser    ${Stage_URL}    ff    options=binary='C:/Users/jg00824787/AppData/Local/Mozilla Firefox/firefox.exe'
        ...    ff_profile_dir=set_preference("browser.download.folderList", 2);set_preference("browser.download.dir", r"${downloadpath}");set_preference("browser.helperApps.neverAsk.saveToDisk", "application/zip")
    END
    IF    '${browser}'=='Chrome'
        ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        ${disabled}    Create List    Chrome PDF Viewer
        ${prefs} =    create dictionary    download.prompt_for_download=${FALSE}    download.directory_upgrade=${TRUE}    download.default_directory=${OUTPUT_DIR}    safebrowsing.enabled=${TRUE}
        call method    ${CHROME_OPTIONS}    add_experimental_option    prefs    ${prefs}
        Call Method    ${chromeOptions}    add_argument    --ignore-certificate-errors
        create webdriver    Chrome    chrome_options=${CHROME_OPTIONS}
        IF    '${Execution_Env}'=='Stage'
            Go To    ${Stage_URL}
        ELSE
            Go To    ${Dev_URL}
        END
        # Open Browser    ${Stage_URL}    Chrome    options=add_argument("--ignore-certificate-errors")
    END
    IF  '${browser}'=='Edge'
        ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
        ${prefs} =    Create Dictionary    download.default_directory=${OUTPUT_DIR} 
        Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
        Call Method    ${chromeOptions}    add_argument    --ignore-certificate-errors
        Open Browser    ${Pricing_CSL_Web_Url}     Edge  options=${chromeOptions}
    END
    Maximize Browser Window
    Accept Cert If Any
    # Execute javascript       document.body.style.zoom="80%"
Open Pricing CSL Url with excel routing
        ${browser}  set variable  Edge
    IF    '${browser}'=='Firefox'
        Open Browser    ${Stage_URL}    ff    options=binary='C:/Users/jg00824787/AppData/Local/Mozilla Firefox/firefox.exe'
        ...    ff_profile_dir=set_preference("browser.download.folderList", 2);set_preference("browser.download.dir", r"${downloadpath}");set_preference("browser.helperApps.neverAsk.saveToDisk", "application/zip")
    END
    IF    '${browser}'=='ff'
        Open Browser    ${Stage_URL}    ff    options=binary='C:/Users/jg00824787/AppData/Local/Mozilla Firefox/firefox.exe'
        ...    ff_profile_dir=set_preference("browser.download.folderList", 2);set_preference("browser.download.dir", r"${downloadpath}");set_preference("browser.helperApps.neverAsk.saveToDisk", "application/zip")
    END
    IF    '${browser}'=='Chrome'
        ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        ${disabled}    Create List    Chrome PDF Viewer
        ${prefs} =    create dictionary    download.prompt_for_download=${FALSE}    download.directory_upgrade=${TRUE}    download.default_directory=${OUTPUT_DIR}    safebrowsing.enabled=${TRUE}
        call method    ${CHROME_OPTIONS}    add_experimental_option    prefs    ${prefs}
        Call Method    ${chromeOptions}    add_argument    --ignore-certificate-errors
        create webdriver    Chrome    chrome_options=${CHROME_OPTIONS}
        IF    '${Execution_Env}'=='Stage'
            Go To    ${Stage_URL}
        ELSE
            Go To    ${Dev_URL}
        END
        # Open Browser    ${Stage_URL}    Chrome    options=add_argument("--ignore-certificate-errors")
    END
    IF  '${browser}'=='Edge'
        ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
        ${prefs} =    Create Dictionary    download.default_directory=${OUTPUT_DIR}
        Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
        Call Method    ${chromeOptions}    add_argument    --ignore-certificate-errors
        Open Browser    ${Pricing_CSL_Web_Url}     Edge  options=${chromeOptions}
    END
    Maximize Browser Window
    Accept Cert If Any
#        ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#
#        ${disabled}    Create List    Chrome PDF Viewer
#
#        ${prefs} =    create dictionary    download.prompt_for_download=${FALSE}    download.directory_upgrade=${TRUE}    download.default_directory=${OUTPUT_DIR}    safebrowsing.enabled=${TRUE}
#
#        call method    ${CHROME_OPTIONS}    add_experimental_option    prefs    ${prefs}
#
#        Call Method    ${chromeOptions}    add_argument    --ignore-certificate-errors
#
#        create webdriver    Chrome    chrome_options=${CHROME_OPTIONS}
#
#        Go To    ${Pricing_CSL_Web_Url}
#
#        Maximize Browser Window
Then login with TCUser
    input text      ${LoginUser}       kosolr49
    input text      ${LoginPass}       kosolr49
    click element   ${LoginButt}
#    sleep   15 s
    wait until keyword succeeds     2 m       2 s      element should be visible    ${Approved_ListTabLoc}
    Execute javascript       document.body.style.zoom="75%"
#    wait until element is visible   ${Approved_ListTabLoc}
#    sleep   2 s
Then login with BC Sale role 2
    input text      ${LoginUser}        CSL_BC2
    input text      ${LoginPass}        CSL_BC2
    click element   ${LoginButt}
    wait until keyword succeeds     2 m       2 s      element should be visible    ${SMT_Request_Menu_Tab}

Then login with Sale role 2
    input text      (//*[@class="form-control ng-untouched ng-pristine ng-invalid"])[1]       CSL_BC2
    input text      //*[@class="form-control ng-untouched ng-pristine ng-invalid"]        CSL_BC2
    click element   //*[@class="btn btn-block btn-success"]

    wait until keyword succeeds     2 m       2 s      element should be visible    ${SMT_Request_Menu_Tab}

Then login with TC Support 4 role
    wait until keyword succeeds     1 m       1 s      input text      ${LoginUser}        CSL_TCS4
    wait until keyword succeeds     1 m       1 s      input text      ${LoginPass}        CSL_TCS4
    wait until keyword succeeds     1 m       1 s      click element   ${LoginButt}

    wait until keyword succeeds     1 m       1 s      element should be visible    ${SMT_Request_Menu_Tab}
#    Execute javascript       document.body.style.zoom="75%"
#    driver.execute_script('document.body.style.MozTransform = "scale(1.0)";')
#    driver.execute_script('document.body.style.MozTransformOrigin = "0 0";')
#    Set Window Size  	2400	1600


#Provided precondition
#    Setup system under test

############### Log in Page #####################
Then login with CSL_BC2
    input text      ${LoginUser}       CSL_BC2
    input text      ${LoginPass}       CSL_BC2
    click element   ${LoginButt}
#    sleep   15 s
     wait until keyword succeeds     2 m       2 s           element should be visible    ${WaitingApproveMenu}
#    wait until keyword succeeds     2 m       2 s      element should be visible    ${Approved_ListTabLoc}
#    wait until element is visible   ${Approved_ListTabLoc}
#    sleep   2 s
Then login with CSL_H1
    input text      ${LoginUser}       CSL_H1
    input text      ${LoginPass}        CSL_H1
    click element   ${LoginButt}
Then login with MD
    input text      ${LoginUser}        CSL_MD1
    input text      ${LoginPass}        CSL_MD1
    click element   ${LoginButt}
    wait until keyword succeeds     2 m      1 s      element should be visible    ${WaitingApproveMenu}

Then login with CSL_PC2
    input text      ${LoginUser}        CSL_PC2
    input text      ${LoginPass}        CSL_PC2
    click element   ${LoginButt}
#    sleep   15 s
     wait until keyword succeeds     2 m       2 s           element should be visible    ${WaitingApproveMenu}
#    wait until keyword succeeds     2 m       2 s      element should be visible    ${Approved_ListTabLoc}
#    wait until element is visible   ${Approved_ListTabLoc}
#    sleep   2 s

Then login with PCMUser 1
    input text      ${LoginUser}        CSL_PCM1
    input text      ${LoginPass}        CSL_PCM1
    click element   ${LoginButt}
     wait until keyword succeeds     2 m       1 s           element should be visible    ${WaitingApproveMenu}
Then login with MD role 1
    input text      ${LoginUser}       CSL_MD1
    input text      ${LoginPass}        CSL_MD1
    click element   ${LoginButt}
    wait until keyword succeeds     2 m       2 s           element should be visible    ${WaitingApproveMenu}

Then login with CSL_PC3
    input text      ${LoginUser}        CSL_PC3
    input text      ${LoginPass}        CSL_PC3
    click element   ${LoginButt}
     wait until keyword succeeds     2 m       1 s           element should be visible    ${WaitingApproveMenu}



Then login with Manager
    input text      ${LoginUser}       CSL_M1
    input text      ${LoginPass}        CSL_M1
    click element   ${LoginButt}
    wait until keyword succeeds     2 m       2 s           element should be visible    ${WaitingApproveMenu}

Validate Display count dropdown functions

    ${count_label}  get text  ${BCSubmittedList_Showing_Number}
    @{list}  Split String    ${count_label}  ${SPACE}
    ${total_count}  Set Variable  ${list}[5]
    Wait Until Element Is Visible    ${BCSubmittedList_Pagination_DropDown}  ${Medium_Wait_Time}
    IF  ${total_count}>=10
        Select From List By Value    ${BCSubmittedList_Pagination_DropDown}  10
        FOR  ${i}  IN RANGE  30
            ${rows_count}  Get Element Count    ${BCSubmittedList_Data_Rows}
            Exit For Loop If    ${rows_count}==10
            sleep  2s
        END
    ELSE
        Select From List By Value    ${BCSubmittedList_Pagination_DropDown}  10
        FOR  ${i}  IN RANGE  30

            ${rows_count}  Get Element Count    ${BCSubmittedList_Data_Rows}

            Exit For Loop If    ${rows_count}==${total_count}

            sleep  2s

        END

    END

    IF  ${total_count}>=25

        Select From List By Value    ${BCSubmittedList_Pagination_DropDown}  25

        FOR  ${i}  IN RANGE  30

            ${rows_count}  Get Element Count    ${BCSubmittedList_Data_Rows}

            Exit For Loop If    ${rows_count}==25

            sleep  2s

        END

    ELSE

        Select From List By Value    ${BCSubmittedList_Pagination_DropDown}  25

        FOR  ${i}  IN RANGE  30

            ${rows_count}  Get Element Count    ${BCSubmittedList_Data_Rows}

            Exit For Loop If    ${rows_count}==${total_count}

            sleep  2s

        END

    END

    IF  ${total_count}>=50

        Select From List By Value    ${BCSubmittedList_Pagination_DropDown}  50

        FOR  ${i}  IN RANGE  30

            ${rows_count}  Get Element Count    ${BCSubmittedList_Data_Rows}

            Exit For Loop If    ${rows_count}==50

            sleep  2s

        END

    ELSE

        Select From List By Value    ${BCSubmittedList_Pagination_DropDown}  50

        FOR  ${i}  IN RANGE  30

            ${rows_count}  Get Element Count    ${BCSubmittedList_Data_Rows}

            Exit For Loop If    ${rows_count}==${total_count}

            sleep  2s

        END

    END

    IF  ${total_count}>=100

        Select From List By Value    ${Pagination_DropDown}  100

        FOR  ${i}  IN RANGE  30

            ${rows_count}  Get Element Count    ${BCSubmittedList_Data_Rows}

            Exit For Loop If    ${rows_count}==100

            sleep  2s

        END

    ELSE

        Select From List By Value    ${BCSubmittedList_Pagination_DropDown}  100

        FOR  ${i}  IN RANGE  30

            ${rows_count}  Get Element Count    ${BCSubmittedList_Data_Rows}

            Exit For Loop If    ${rows_count}==${total_count}

            sleep  2s

        END

    END

    Select From List By Value    ${BCSubmittedList_Pagination_DropDown}  10
Validate Count Number List
    ${count_label}  get text  ${Showing_Count_Number}
    @{list}  Split String    ${count_label}  ${SPACE}
    ${cur_start}  Set Variable  ${list}[1]
    ${cur_end}  Set Variable  ${list}[5]
    ${count_label_Menu}  get text  //li[@class="treeview active"]
    @{list1}  Split String    ${count_label_Menu}  ${SPACE}
    ${cur_start1}  Set Variable  ${list}[3]
    Should Be Equal As Numbers  ${cur_end}   ${cur_start1}
Validate Drop Down List Entries
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${SearchTextLoc}
#    click element           ${EntriesDropDownLoc}
    @{text}    get list items     ${EntriesDropDownLoc}
    should be equal as strings    ${text}[0]    10
    should be equal as strings    ${text}[1]    25
    should be equal as strings    ${text}[2]    50
    should be equal as strings    ${text}[3]    100
Validate Pagination Next Button

    ${count_label}  get text  ${BCSubmittedList_Showing_Number}

    @{list}  Split String    ${count_label}  ${SPACE}

    ${cur_start}  Set Variable  ${list}[1]

    ${cur_end}  Set Variable  ${list}[3]

    ${selected_page_count}  Get Selected List Label    ${BCSubmittedList_Pagination_DropDown}

    Wait Until Element Is Visible    ${BCSubmittedList_Pagnation_Next_Button}

    Click Element    ${BCSubmittedList_Pagnation_Next_Button}

    sleep  1s

    ${count_label}  get text  ${BCSubmittedList_Showing_Number}

    @{list}  Split String    ${count_label}  ${SPACE}

    ${actual_new_start}  Set Variable  ${list}[1]

    ${actual_new_end}  Set Variable  ${list}[3]

    ${expected_new_start}  Evaluate    ${cur_start}+${selected_page_count}

    ${expected_new_end}  Evaluate    ${cur_end}+${selected_page_count}

    Should Be Equal As Numbers    ${expected_new_start}    ${actual_new_start}

    Should Be Equal As Numbers    ${expected_new_end}    ${actual_new_end}

    ${cur_start}  Set Variable  ${actual_new_start}

    ${cur_end}  Set Variable  ${actual_new_end}

    Wait Until Element Is Visible    ${BCSubmittedList_Pagnation_Next_Button}

    Click Element    ${BCSubmittedList_Pagnation_Next_Button}

    sleep  1s

    ${count_label}  get text  ${BCSubmittedList_Showing_Number}

    @{list}  Split String    ${count_label}  ${SPACE}

    ${actual_new_start}  Set Variable  ${list}[1]

    ${actual_new_end}  Set Variable  ${list}[3]

    ${expected_new_start}  Evaluate    ${cur_start}+${selected_page_count}

    ${expected_new_end}  Evaluate    ${cur_end}+${selected_page_count}

    Should Be Equal As Numbers    ${expected_new_start}    ${actual_new_start}

    Should Be Equal As Numbers    ${expected_new_end}    ${actual_new_end}

Validate Pagination Previous Button

    ${count_label}  get text  ${BCSubmittedList_Showing_Number}

    @{list}  Split String    ${count_label}  ${SPACE}

    ${cur_start}  Set Variable  ${list}[1]

    ${cur_end}  Set Variable  ${list}[3]

    ${selected_page_count}  Get Selected List Label    ${BCSubmittedList_Pagination_DropDown}

    Wait Until Element Is Visible    ${BCSubmittedList_Pagination_Previous_Button}

    Click Element    ${BCSubmittedList_Pagination_Previous_Button}

    sleep  1s

    ${count_label}  get text  ${BCSubmittedList_Showing_Number}

    @{list}  Split String    ${count_label}  ${SPACE}

    ${actual_new_start}  Set Variable  ${list}[1]

    ${actual_new_end}  Set Variable  ${list}[3]

    ${expected_new_start}  Evaluate    ${cur_start}-${selected_page_count}

    ${expected_new_end}  Evaluate    ${cur_end}-${selected_page_count}

    Should Be Equal As Numbers    ${expected_new_start}    ${actual_new_start}

    Should Be Equal As Numbers    ${expected_new_end}    ${actual_new_end}

    ${cur_start}  Set Variable  ${actual_new_start}

    ${cur_end}  Set Variable  ${actual_new_end}

    Wait Until Element Is Visible    ${BCSubmittedList_Pagination_Previous_Button}

    Click Element    ${BCSubmittedList_Pagination_Previous_Button}

    sleep  1s

    ${count_label}  get text  ${BCSubmittedList_Showing_Number}

    @{list}  Split String    ${count_label}  ${SPACE}

    ${actual_new_start}  Set Variable  ${list}[1]

    ${actual_new_end}  Set Variable  ${list}[3]

    ${expected_new_start}  Evaluate    ${cur_start}-${selected_page_count}

    ${expected_new_end}  Evaluate    ${cur_end}-${selected_page_count}

    Should Be Equal As Numbers    ${expected_new_start}    ${actual_new_start}

    Should Be Equal As Numbers    ${expected_new_end}    ${actual_new_end}

Random English Name
    [Arguments]     ${element_locator}      #${text}
    ${RANUSER}  Generate Random String  10  [LETTERS]
    Input Text   ${element_locator}    ${RANUSER}
Validate App Solution List Data Displays
    Wait Until Element Is Visible    //div[@class="dataTables_scroll"]    ${Medium_Wait_Time}
    Wait Until Element Is Visible     (//table)[1]               ${Medium_Wait_Time}
Validate Action Button
    Wait Until Element Is Visible  ${CheckBox}    ${Medium_Wait_Time}
    wait until keyword succeeds    1 m     1 s       click element  ${CheckBox}
    wait until keyword succeeds    1 m     1 s       Element Should Be Visible   ${Actionbutt}
Validate Data Display Function
    Wait Until Element Is Visible     ${Data_Display_Function}     ${Medium_Wait_Time}
    Wait Until Element Is Visible     (//table)[1]               ${Medium_Wait_Time}
Validate Data table
    Wait Until Element Is Visible     ${Data_Table}     ${Medium_Wait_Time}


############ Waiting Approve Pages ############
Waiting Approve Menu
    Wait Until Page Contains Element    ${WaitingApproveMenu}     30 s
    Wait Until Element Is Visible    ${WaitingApproveMenu}
    click element                    ${WaitingApproveMenu}
    Wait for Page loading
    wait until keyword succeeds      30 s     1 s     wait until element is visible   ${SearchTextLoc}
    Wait for Page loading
App Solution List Menu
    Wait Until Element Is Visible   ${App_Solution_List_Menu_Tab}
    wait until keyword succeeds     1 m     2 s     click element           ${App_Solution_List_Menu_Tab}
    Wait for Page loading
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${SearchTextLoc}

Approved Menu
    Wait Until Element Is Visible   ${ApprovedMenu}
    click element           ${ApprovedMenu}
    Wait for Page loading
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${SearchTextLoc}

Search Tab Bar
    Wait Until Element Is Visible     //*[contains(text(),'SEARCH')]   20 s
    wait until keyword succeeds     20 s     2 s      Click Element      //*[contains(text(),'SEARCH')]
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${SearchTextLoc}
Cost Sheet Menu
    wait until keyword succeeds     1 m     2 s     click element           ${CostSheetMenuTab}
    Wait for Page loading
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${SearchTextLoc}
    Wait for Page loading
Pricing List Menu
    Wait Until Element Is Visible   ${Pricing_List_Menu_Tab}
    wait until keyword succeeds     1 m     2 s     click element           ${Pricing_List_Menu_Tab}
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${SearchTextLoc}
    Wait for Page loading
App Costsheet List Menu
    Wait Until Element Is Visible   ${App_Costsheet_List_Menu}
    wait until keyword succeeds     1 m     2 s     click element           ${App_Costsheet_List_Menu}
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${SearchTextLoc}
    Wait for Page loading
Open Cost Sheet Menu
    Wait Until Element Is Visible    //a[@class="sidebar-toggle"]
    wait until keyword succeeds     30 s     1 s     click element           //a[@class="sidebar-toggle"]
    Wait Until Element Is Visible     ${CostSheetMenuTab}
    wait until keyword succeeds     30 s     1 s     click element           ${CostSheetMenuTab}
    wait until keyword succeeds     30 s     1 s     wait until element is visible   ${SearchTextLoc}

Verify Criteria
   element should be visible     ${Criteria}
Verify Data Table Columns App Solution List Menu
    Wait Until Page Contains Element  ${CheckBox}                                  ${Medium_Wait_Time}
    Wait Until Page Contains Element  //*[contains(text(),'Cost Sheet Status')]    ${Medium_Wait_Time}
    Wait Until Page Contains Element  //*[contains(text(),'Opportunity No.')]      ${Medium_Wait_Time}
    Wait Until Page Contains Element  //*[contains(text(),'Cost Sheet No.')]       ${Medium_Wait_Time}
    Wait Until Page Contains Element  //*[contains(text(),'Order type')]           ${Medium_Wait_Time}
    Wait Until Page Contains Element  //*[contains(text(),'Lease Line type')]      ${Medium_Wait_Time}
    Wait Until Page Contains Element  //*[contains(text(),'OLA')]                  ${Medium_Wait_Time}
#    Scroll Element Into View       //*[contains(text(),'Cost Sheet Type')]
    Wait Until Page Contains Element  //*[contains(text(),'Cost Sheet Type')]      ${Medium_Wait_Time}
#    Scroll Element Into View       //*[contains(text(),'Sale Owner')]
    Wait Until Page Contains Element  //*[contains(text(),'Customer Name')]        ${Medium_Wait_Time}
    Wait Until Page Contains Element  //*[contains(text(),'Customer Name Eng')]    ${Medium_Wait_Time}
    Wait Until Page Contains Element  //*[contains(text(),'Project Name')]         ${Medium_Wait_Time}
    Wait Until Page Contains Element  //*[contains(text(),'Sale Owner')]
Verrify Search Criteria
   element should be visible     ${Search_Cost_Sheet_No_Panel}        #//*[contains(text(),'Cost Sheet No.')]
   element should be visible     ${Search_Opportunity_No_Panel}         #//*[contains(text(),'Opportunity No.')]
   element should be visible     ${Search_BC_Submitted_Date_Panel}  #//*[contains(text(),'BC Submitted Date')]
   element should be visible     ${Search_Sale_Owner_Panel}        #//*[contains(text(),'Sale Owner')]
   element should be visible     ${Search_Create_By_Panel}          #//*[contains(text(),'Create By')]
   element should be visible     ${Search_Create_Date_From_Panel}
   element should be visible     ${Search_Create_Date_To_Panel}     #//*[contains(text(),'Create Date To')]
   element should be visible     ${Search_CA_No_Panel}              #//*[contains(text(),'CA No.')]
   element should be visible     ${Search_Customer_Name_Panel}      #//*[contains(text(),'Customer Name')]
   element should be visible     ${Search_Customer_Name_Eng_Panel}     #//*[contains(text(),'Customer Name Eng')]
Action send to improve

    wait until keyword succeeds     1 m     2 s     wait until element is visible    ${Actionbutt}
    click element       ${Actionbutt}
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${Submitbutt}
    Click Element     ${Submitbutt}
    wait until keyword succeeds     1 m     2 s     wait until element is visible   //*[contains(text(),'รอการอนุมัติ Costsheet ')]
    element should be visible   //button [@class="btn btn-success" and @type="submit"]      5s
    click element       //button [@class="btn btn-default" and @data-dismiss="modal"]

Action send to reject

    wait until keyword succeeds     1 m     2 s     wait until element is visible    ${Actionbutt}
    click element       ${Actionbutt}
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${Submitbutt}
    Click Element     ${Submitbutt}
    wait until keyword succeeds     1 m     2 s     wait until element is visible   //*[contains(text(),'รอการอนุมัติ Costsheet ')]
    element should be visible   //button [@class="btn btn-success" and @type="submit"]      5s
    click element       //button [@class="btn btn-default" and @data-dismiss="modal"]

Action send to improve HOD

    wait until keyword succeeds     1 m     2 s     wait until element is visible    ${Actionbutt}
    Mouse Over      ${Actionbutt}
    click element       ${Actionbutt}
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${Submitbutt}
    Click Element     ${Submitbutt}
    wait until keyword succeeds     1 m     2 s     wait until element is visible   //*[contains(text(),'รอการอนุมัติ Costsheet ')]
     wait until keyword succeeds     1 m     2 s     wait until element is visible   //button [@class="btn btn-success" and @type="submit"]
    element should be visible   //button [@class="btn btn-success" and @type="submit"]      5s
    click element       //button [@class="btn btn-default" and @data-dismiss="modal"]

Default Is Blank
    [Arguments]     ${element_locator}      ${text}

Random Calendar Date
#    [Arguments]     ${element_locator}      #${text}
    ${randD}    Generate Random String  1  [NUMBERS]    # Generate Random String  1   [NUMBERS])
    Log     ${randD}
    click element        ${RandCalendarDate}
    #${RandCalendarDate}      //*[@class="daycell currmonth tablesingleday" and @aria-label="Select day${randD}"]

Get Table Row
    ${total_row}=   Get Element Count   //tr[@role="row" and @class="odd" or @class="even"]

Query Database on CSL COST SHEET
    [Arguments]     ${query}
    ${query}    set variable    select cs.* FROM sbniwf.pcs_csl_cost_sheet_version cs where cs.COST_SHEET_VERSION_NO = '${Dataforqry}'
    log     ${query}
    ${Result0fQuery}    Query       ${query}    True
    log many     ${Result0fQuery}
    log     ${Result0fQuery}[0] , ${CSStatus}
    should contain      ${Result0fQuery}[0]        ${CSStatus}
    log many  ${Result0fQuery}[0]      ${Dataforqry}


Query Database on CSL COST SHEET VERSION NO
    [Arguments]     ${query}
    ${query}    set variable    select * FROM sbniwf.pcs_csl_cost_sheet_version csv where csv.cost_sheet_version_no = '${Dataforqry}'
    log     String SQL : ${query}
    @{Result0fQuery}    Query       ${query}
    should contain      ${Result0fQuery}[0]      ${Dataforqry}   ${CSStatus}
    log many  ${Result0fQuery}[0]      ${Dataforqry}  ${CSStatus}
    log many     @{Result0fQuery}
    [Return]    @{Result0fQuery}


Query Database On pcs_csl_cost_sheet_version
#    [Arguments]     ${query}
#    ${query1}    set variable    ${pcs_csl_cost_sheet_Query}
    log  ${Dataforqry}
    ${query}  Replace String    ${pcs_csl_cost_sheet_version_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${Actual_Result}      ${Result0fQuery}[0]
#    log     ${Result0fQuery}[0] , ${CSStatus}

Query Database On pcs_csl_cost_sheet
#    [Arguments]     ${query}
#    ${query1}    set variable    ${pcs_csl_cost_sheet_Query}
    log   ${Dataforqry}
    ${Dataforqry}  Split String    ${Dataforqry}   -
    log    ${Dataforqry}[0]
    ${Dataforqry}    set variable    ${Dataforqry}[0]
    ${query}  Replace String    ${pcs_csl_cost_sheet_with_CsNo_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${Actual_Result}      ${Result0fQuery}[0]
#    log     ${Result0fQuery}[0] , ${CSStatus}

#Query Database On PCS_CSL_COST_SHEET where with cost sheet no.
##    [Arguments]     ${query}
##    ${query1}    set variable    ${pcs_csl_cost_sheet_Query}
#    log   ${DataForQry}
#    ${Dataforqry}  Split String    ${DataForQry}   -
#    log    ${DataForQry}[0]
#    ${Dataforqry}    set variable    ${DataForQry}[0]
#    ${query}  Replace String    ${pcs_csl_cost_sheet_version_with_CsNo_Query}    ???    ${Dataforqry}
#    log     String SQL : ${query}
#    ${Result0fQuery}    Query       ${query}
#    log   ${Result0fQuery}[0]
#    set global variable     ${ActualResult}      ${Result0fQuery}[0]
##    log     ${Result0fQuery}[0] , ${CSStatus}

#Query Database On PCS_CSL_COST_SHEET_VERSION where with cost sheet no.
##    [Arguments]     ${query}
##    ${query1}    set variable    ${pcs_csl_cost_sheet_Query}
#    log   ${DataForQry}
##    ${Dataforqry}  Split String    ${DataForQry}   -
##    log    ${DataForQry}[0]
##    ${Dataforqry}    set variable    ${DataForQry}[0]
#    ${query}  Replace String    ${pcs_csl_cost_sheet_version_with_CsNo_Query}    ???    ${Dataforqry}
#    log     String SQL : ${query}
#    ${Result0fQuery}    Query       ${query}
#    log   ${Result0fQuery}[0]
#    set global variable     ${ActualResult}      ${Result0fQuery}[0]
##    log     ${Result0fQuery}[0] , ${CSStatus}

Query Database On PCS_CSL_COST_SHEET where with cost sheet no.
#    [Arguments]     ${query}
#    ${query1}    set variable    ${pcs_csl_cost_sheet_Query}
    log   ${DataForQry}
    ${Dataforqry}  Split String    ${DataForQry}   -
    log    ${DataForQry}[0]
    ${Dataforqry}    set variable    ${DataForQry}[0]
    ${query}  Replace String    ${pcs_csl_cost_sheet_with_CsNo_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0]
#    log     ${Result0fQuery}[0] , ${CSStatus}

Query Database On PCS_FLOW_Transaction where with cost sheet no.
    log   ${DataForQry}
    ${query}  Replace String    ${pcs_flow_transaction_with_CsNo_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0]

Query Contract Duration On PCS_CSL_COST_SHEET where with cost sheet no.

    log    ${DataForQry}
    ${query}  Replace String    ${pcs_csl_cost_sheet_version_contract_duration_with_CsNo_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0][0]




Verify the data retrieved from DB
    log many   ${ActualResult}   ${CSStatus}
    RUN KEYWORD IF  '${CSStatus}' == '${Empty}'   Set Global Variable    ${CSStatus}    ${None}
    should contain      ${Actual_Result}        ${CSStatus}
    ${Status}=    Run Keyword And Return Status    should contain      ${Actual_Result}        ${CSStatus}
    log    ${Status}
    Run Keyword If    '${Status}'=='True'     Log     PASS
#    log many  ${Result0fQuery}[0]      ${Dataforqry}

Verify Expected Result And Actual Result
    log many   ${ActualResult}   ${ExpectResult}
    RUN KEYWORD IF  '${ExpectResult}' == '${Empty}'   Set Global Variable    ${ExpectResult}    ${None}
    RUN KEYWORD IF  '${ExpectResult}' == '-'   Set Global Variable    ${ExpectResult}    ${None}

#    RUN KEYWORD IF  '${ActualResult}' == ${None}   Set Global Variable    ${ActualResult}    ${None}
    should contain      ${Actual_Result}        ${ExpectResult}
    ${Status}=    Run Keyword And Return Status    should contain      ${Actual_Result}        ${ExpectResult}
    log    ${Status}
    Run Keyword If    '${Status}'=='True'     Log     PASS -Service ${ExpectResult} matches the results in the database.

Verify Expected Result And Actual Result with equal
    log many   ${ActualResult}   ${ExpectResult}
    RUN KEYWORD IF  '${ExpectResult}' == '${Empty}'   Set Global Variable    ${ExpectResult}    ${None}
    RUN KEYWORD IF  '${ActualResult}' == '${None}'   Set Global Variable    ${ActualResult}    ${None}
    Should Be Equal      ${Actual_Result}        ${ExpectResult}
    ${Status}=    Run Keyword And Return Status     Should Be Equal      ${Actual_Result}        ${ExpectResult}
    log    ${Status}
    Run Keyword If    '${Status}'=='True'     Log     PASS -Service ${ExpectResult} matches the results in the database.

Verify Expected Result And Actual Result from Excel
    RUN KEYWORD IF  '${ExpectResult}' == '${Empty}'   Set Global Variable    ${ExpectResult}    ${None}
#    RUN KEYWORD IF  '${ActualResult}' == '${None}'    Set Global Variable    ${ActualResult}    ${None}
    log many        ${ActualResult}   ${ExpectResult}
#    Pass Execution If  '${ExpectResult}' == 'None' and '${ActualResult}' == 'None'   This cost sheet does not have a service brand.
    Should Contain       ${Actual_Result}        ${ExpectResult}
    ${Status}=    Run Keyword And Return Status     Should Contain      ${Actual_Result}        ${ExpectResult}
    log    ${Status}
    Run Keyword If    '${Status}'=='True'     Log     PASS -Service ${ExpectResult} matches the results in Excel.

Query Database on CSL COST SHEET For Product Type
    ${query}    set variable    select CSV.SERVICE_GROUP_ID FROM sbniwf.pcs_csl_cost_sheet_version csv where csv.cost_sheet_version_no = '${Dataforqry}'
    log     String SQL : ${query}
    @{Result0fQuery}    Query       ${query}

Query Database on CSL COST SHEET Version Id
    ${query}    set variable    select * FROM sbniwf.pcs_csl_service s where s.cost_sheet_version_id = 8963;
    log     String SQL : ${query}
    @{Result0fQuery}    Query       ${query}
    log many  ${Result0fQuery}[0]      ${Dataforqry}  ${CSStatus}
    log many     @{Result0fQuery}
    [Return]    @{Result0fQuery}

Query Database on ONE time fixed cost
    [Arguments]     ${query}
    ${query}    set variable    select * FROM sbniwf.pcs_csl_service s where s.cost_sheet_version_id = 8963
    log     String SQL : ${query}
    @{Result0fQuery}    Query       ${query}
#    should contain      ${Result0fQuery}[0]      ${CSStatus}
    log many  ${Result0fQuery}[0]       ${CSStatus}
    [Return]    @{Result0fQuery}

#######################
Get Table Row By Cost Sheet No.
    [Arguments]     ${cs_no}
    ${total_row}=   Get Element Count   ${ASL_TotalRowCostSheet}
    Log     ${total_row}
    FOR     ${index}    IN RANGE    1   ${total_row}
        wait until element is visible    //*[@id="worklist-table"]/tbody/tr[${index}]    20s
        Scroll Element Into View    //*[@id="worklist-table"]/tbody/tr[${index}]
        #click element      //*[@id="worklist-table"]/tbody/tr[${index}]/td[1]/input
        ${RowData}=         Get Text      //*[@id="worklist-table"]/tbody/tr[${index}]
#        wait until element is visible       //td[@id="frmList:orderHistoryTable:0:j_id_jsp_1912529721_128"][${index}]  20s
#        ${}=    Get Text      //td[@id="frmList:orderHistoryTable:0:j_id_jsp_1912529721_128"][${index}]    #//*[contains(text(),'${order_no}')]/parent::td/parent::tr/td[13]
        log     ${RowData}
        ${IsEqual}=    Run Keyword And Return Status    Should Contain    ${RowData}    ${cs_no}
        log    ${IsEqual}
        ${RowNo}=      Set Variable    ${index}
        Run Keyword If    '${IsEqual}'=='True'    Run Keywords    Log    Rownumber is ${RowNo}    AND    Exit For Loop
    END
    set test variable    ${RowData}
#    set global variable    ${Date_time_history}
    Log  Row number = ${RowNo} Data = ${RowData}

search with text box
    input text   //*[@id="worklist-table_filter"]/label/input      ${DataFromRow}
    wait until keyword succeeds     30 s     2 s      Element Should Contain     //*[@id="worklist-table"]/tbody/tr[1]/td[${i}]     ${DataFromRow}


Click Element javascript
    [Arguments]     ${xpath}
    execute javascript   document.evaluate("${xpath}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()

Validate Function Data Display Consist
    wait until keyword succeeds     1 m     2 s     wait until element is visible   ${SearchTextLoc}
    element should be visible       ${ShowTextLoc}
    element should be visible       ${SearchTextLoc}
    element should be visible       ${PreviousTextLoc}
    element should be visible       //*[@id="worklist-table_paginate"]/ul/li[2]/a
    element should be visible       ${NextTextLoc}
    element should be visible       //*[@id="worklist-table_info"]
    element should be visible       //li[@class="dropdown user user-menu"]

Validate Count Task List Menu TC Manager
    Wait Until Keyword Succeeds    30 s     1 s    Click Element   ${App_Solution_List_Menu_Tab}
    Wait Until Keyword Succeeds    30 s     1 s    Element Should Be Visible        ${Showing_Count_Number}
    ${count_label}  get text  ${Showing_Count_Number}
    @{list}  Split String    ${count_label}  ${SPACE}
#    ${cur_start}  Set Variable  ${list}[1]
#    ${cur_end}  Set Variable  ${list}[5]
    ${count_label_Menu}  get text  ${Count_Task_App_Solution_List_Menu_Tab}
#    @{list1}  Split String    ${count_label_Menu}  ${SPACE}
    ${count_cur_task}  Set Variable  ${list}[5]
    Should Be Equal As Numbers  ${count_label_Menu}   ${count_cur_task}
    Log   Count of App Solution List Menu is ${count_label_Menu} and Count Tsak List is ${count_cur_task}

    Wait Until Keyword Succeeds    30 s     1 s    Click Element   ${WaitingApproveMenu}
    Wait Until Keyword Succeeds    30 s     1 s    Element Should Be Visible    ${Showing_Count_Number}
    ${count_label}  get text  ${Showing_Count_Number}
    @{list}  Split String    ${count_label}  ${SPACE}
    ${count_label_Menu}  get text  ${Count_Task_WaitingApproveMenu}
    ${count_cur_task}  Set Variable  ${list}[5]
    Should Be Equal As Numbers  ${count_label_Menu}   ${count_cur_task}
    Log   Count of App Solution List Menu is ${count_label_Menu} and Count Tsak List is ${count_cur_task}

    Wait Until Keyword Succeeds    30 s     1 s    Click Element   ${ApprovedMenu}
    Wait Until Keyword Succeeds    30 s     1 s    Element Should Be Visible    ${Showing_Count_Number}
    ${count_label}  get text  ${Showing_Count_Number}
    @{list}  Split String    ${count_label}  ${SPACE}
    ${count_label_Menu}  get text  ${Count_Task_ApprovedMenu}
    ${count_cur_task}  Set Variable  ${list}[5]
    Should Be Equal As Numbers  ${count_label_Menu}   ${count_cur_task}
    Log   Count of App Solution List Menu is ${count_label_Menu} and Count Tsak List is ${count_cur_task}

Wait for Page loading
        Wait Until Element Is Not Visible            ${loading_Page}        180s

Query On PCS_CSL_COST_SHEET_VERSION where with cost sheet no.

    log    ${DataForQry}
    ${query}  Replace String   ${pcs_csl_cost_sheet_version_with_CsNo_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0]

Query order reason On PCS_CSL_COST_SHEET_VERSION where with cost sheeet version id.

    log    ${DataForQry}
    ${DataForQry}       Convert To String    ${DataForQry}
    ${query}  Replace String   ${pcs_csl_order_reason_with_CsVerId_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0][0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0][0]

Query delegate from and delegate to On pcs_delegate where with cost sheeet version id.

    log    ${DataForQry}
    ${DataForQry}       Convert To String    ${DataForQry}
    ${query}  Replace String   ${pcs_csl_cost_sheet_delegate_From_To_with_CsNo_Query}    ???    ${DataForQry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    Log   ${Result0fQuery}
#    Pass Execution If    '${Result0fQuery}'=='${None}'      No result from database
#    Run Keyword And Ignore Error    log   ${Result0fQuery}[0]
#    Run Keyword And Ignore Error    set global variable     ${ActualResult}      ${Result0fQuery}[0]
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0]

Query Database On cost_sheet_version_id where with cost sheet no
    log   ${DataForQry}
    ${query}  Replace String   ${pcs_csl_cost_sheet_version_id_with_CsNo_Query}      ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0][0]
#    set global variable     ${ActualResult}      ${Result0fQuery}[0]
#    log     ${Result0fQuery}[0] , ${CSStatus}
    Set Global Variable    ${Data}  ${Result0fQuery}[0][0]
    ${DataForQry}=    Convert To String   ${Data}
    Set Global Variable    ${DataForQry}

Query ola_expired_date, created_date On pcs_flow_transaction where with csl_cost_sheet_version_id
    log   ${DataForQry}
    ${query}  Replace String   ${pcs_csl_ola_expired_date,created_date_with_CsID_Query}      ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    Log Many   ${Result0fQuery}[0]  ${Result0fQuery}[0][0]  ${Result0fQuery}[0][1]
    ${expireddate}  Set Variable    ${Result0fQuery}[0][0]
    ${createddate}  Set Variable     ${Result0fQuery}[0][1]
    Set Global Variable   ${expireddate}
    Set Global Variable   ${createddate}
#    ${temp} =   Subtract Date From Date             ${expireddate}   ${createddate}   verbose
#    ${Data}   Convert Date    ${expireddate}    date_format=%Y-%m-%d    result_format=%Y-%m-%d
#    set global variable     ${ActualResult}      ${Result0fQuery}[0]
#    log     ${Result0fQuery}[0] , ${CSStatus}
#    Set Global Variable    ${DataForQry}  ${Result0fQuery}[0][0]

Query Database On PCS_CSL_COST_SHEET.BC Summited date where with cost sheet no
    log   ${DataForQry}
#    ${Dataforqry}  Split String    ${DataForQry}   -
#    log    ${DataForQry}[0]
#    ${Dataforqry}    set variable    ${DataForQry}[0]
    ${query}  Replace String   ${pcs_csl_cost_sheet_BC_Submitted_Date_with_CsNo_Query}     ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    log   ${Result0fQuery}[0][0]
    ${DataDate}          Set Variable      ${Result0fQuery}[0][0]
    set global variable     ${ActualResult}      ${DataDate}
    Pass Execution If    '${ActualResult}'=='None'    No Data From Data Base
    ${Data}   Convert Date    ${DataDate}    date_format=%Y-%m-%d    result_format=%Y-%m-%d
    set global variable     ${ActualResult}      ${Data}

Query Approve Level On PCS_CSL_COST_SHEET_VERSION where with cost sheet no.

    log    ${DataForQry}
    ${query}  Replace String   ${pcs_csl_cost_sheet_Approve_Level_with_CsNo_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0]

Query Database On PCS_CSL_COST_SHEET.Create Date where with cost sheet no
    log   ${DataForQry}
#    ${Dataforqry}  Split String    ${DataForQry}   -
#    log    ${DataForQry}[0]
#    ${Dataforqry}    set variable    ${DataForQry}[0]
    ${query}  Replace String   ${pcs_csl_cost_sheet_Create_Date_with_CsNo_Query}      ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    log   ${Result0fQuery}[0][0]
    ${DataDate}          Set Variable      ${Result0fQuery}[0][0]
    ${Data}   Convert Date    ${DataDate}    date_format=%Y-%m-%d    result_format=%Y-%m-%d
    set global variable     ${ActualResult}      ${Data}

Query Database On PCS_CSL_COST_SHEET.Approve Date LV1 where with cost sheet no
    log   ${DataForQry}
#    ${Dataforqry}  Split String    ${DataForQry}   -
#    log    ${DataForQry}[0]
#    ${Dataforqry}    set variable    ${DataForQry}[0]
    ${query}  Replace String   ${pcs_csl_cost_sheet_Approve_date_lv_1_with_CsNo_Query}      ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    log   ${Result0fQuery}[0][0]
    ${time}  Set Variable     ${Result0fQuery}[0][0]
    Pass Execution If    '${time}'=='None'      Date Time Is Not Available
    ${DataDate}          Set Variable      ${Result0fQuery}[0][0]
    ${Data}   Convert Date    ${DataDate}    date_format=%Y-%m-%d    result_format=%Y-%m-%d
    set global variable     ${ActualResult}      ${Data}
#    log     ${Result0fQuery}[0] , ${CSStatus}

Query Database On PCS_CSL_COST_SHEET.Approve Date LV2 where with cost sheet no
    log   ${DataForQry}
    ${query}  Replace String   ${pcs_csl_cost_sheet_Approve_date_lv_2_with_CsNo_Query}      ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    log   ${Result0fQuery}[0][0]
    ${time}  Set Variable     ${Result0fQuery}[0][0]
    Pass Execution If    '${time}'=='None'      Date Time Is Not Available
    ${DataDate}          Set Variable      ${Result0fQuery}[0][0]
    ${Data}   Convert Date    ${DataDate}    date_format=%Y-%m-%d    result_format=%Y-%m-%d
    set global variable     ${ActualResult}      ${Data}

Query Database On PCS_CSL_COST_SHEET.Approve Date LV3 where with cost sheet no
    log   ${DataForQry}
    ${query}  Replace String   ${pcs_csl_cost_sheet_Approve_date_lv_3_with_CsNo_Query}      ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    log   ${Result0fQuery}[0][0]
    ${time}  Set Variable     ${Result0fQuery}[0][0]
    Pass Execution If    '${time}'=='None'      Date Time Is Not Available
    ${DataDate}          Set Variable      ${Result0fQuery}[0][0]
    ${Data}   Convert Date    ${DataDate}    date_format=%Y-%m-%d    result_format=%Y-%m-%d
    set global variable     ${ActualResult}      ${Data}

Verify Expected Result And Actual Result with equal number
    log many   ${ActualResult}   ${ExpectResult}
    RUN KEYWORD IF  '${ExpectResult}' == '${Empty}'   Set Global Variable    ${ExpectResult}    ${None}
    RUN KEYWORD IF  '${ActualResult}' == '${None}'   Set Global Variable    ${ActualResult}    ${None}
    ${ExpectResult}   Convert To Integer    ${ExpectResult}
    Should Be Equal      ${Actual_Result}        ${ExpectResult}
    ${Status}=    Run Keyword And Return Status     Should Be Equal      ${Actual_Result}        ${ExpectResult}
    log    ${Status}
    Run Keyword If    '${Status}'=='True'     Log     PASS - ${ExpectResult} matches the results in the database.

Remove 0 From Month
    log   ${RowData}
    Log    ${RowData}[1]
    Log    ${RowData}[1][0]

    ${RowData}=    Remove String   ${RowData}[1][0]      0
    log   ${RowData}

Validate Email Generated

    [Arguments]  ${cs_no}

    sleep  10s

    Execute Javascript    window.open('${Email_url}')

    Get Window Titles

    switch Window    Akarajit Tanjana - Outlook Web App

    # Go To   ${Email_url}

    wait until element is visible  //input[@value='ค้นหากล่องจดหมายทั้งหมด']  ${large_Wait_time}

    input text  //input[@value='ค้นหากล่องจดหมายทั้งหมด']  ${cs_no}

    wait until element is visible  //img[@id='imgS']  ${medium_wait_time}

    click element  //img[@id='imgS']

    sleep  2s

    FOR  ${i}  IN RANGE  30

        ${stat}  run keyword and return status  wait until element is visible  //div[@id='divViewport']//div[contains(text(),'${cs_no}')]  10s

        exit for loop if  ${stat}

        execute javascript  navigation.reload()

        wait until element is visible  //input[@value='ค้นหากล่องจดหมายทั้งหมด']  ${large_Wait_time}

        input text  //input[@value='ค้นหากล่องจดหมายทั้งหมด']  ${cs_no}

        wait until element is visible  //img[@id='imgS']  ${medium_wait_time}

        click element  //img[@id='imgS']

    END

    ${stat}  run keyword and return status  wait until element is visible  //div[@id='divViewport']//div[contains(text(),'${cs_no}')]

    run keyword unless  ${stat}  Fail  E-Mail not generated in 5 minute

    # click element  //div[@id='divViewport']//div[contains(text(),'${cs_no}')]

    capture page screenshot

Read Email Body As Text

    ${msg}  execute javascript  var body = document.getElementById('divBdy');var children = body.children;var msg = '';for (var i = 0; i < children.length; i++) {var tableChild = children[i];msg += tableChild.innerText;}return msg;

    log  ${msg}

    [return]  ${msg}

Verify Read Email Body As Text

    ${msg}  execute javascript  var body = document.getElementById('divBdy');var children = body.children;var msg = '';for (var i = 0; i < children.length; i++) {var tableChild = children[i];msg += tableChild.innerText;}return msg;

    log  ${msg}
    Set Global Variable    ${msg}
    [return]  ${msg}

Close Email

    close window

    ${win}  get window handles

    switch window  ${win}[0]

Verify brand downloaded file
    [Arguments]      ${CSNo}
    FOR  ${k}  IN RANGE  0  10
    ${flag}  set variable  0
    sleep  5s
    ${files}    List Files In Directory    ${OUTPUT_DIR}
    ${file_name}    Set Variable    sample
    ${len}    get length    ${files}
    log    ${files}
    # ${file}    Join Path    ${OUTPUT_DIR}    ${files[0]}
    #${reg}    set variable    19-AWN-1-383-01     # CancelOrder(?i).*\.xlsx
    FOR    ${i}    IN RANGE    ${len}
        #Length Should Be    ${files}    1    Should be only one file in the download folder
        log    ${files[${i}]}
#        Log    ${reg}
        ${stat}    run keyword and return status    should contain     ${files[${i}]}    ${CSNo}    #Chrome is still downloading a file
        IF    ${stat}
            ${file}    Join Path    ${OUTPUT_DIR}    ${files[${i}]}
            ${file_name}    Set Variable    ${files[${i}]}
            ${flag}  set variable  1
            Exit For Loop
        END
    END
    IF    ${stat}
        ${now}    Get Time    epoch
        ${new_path}    set variable    ${OUTPUT_DIR}\\DownloadedFile_Processed${now}.xlsx
        move file    ${file}    ${new_path}
        Set Global Variable    ${exported_file}    ${new_path}
    END
    exit for loop if  ${flag}==1
    END
    run keyword if  ${flag}==0  Fail  File not downloaded

Verify Expected Result And Actual Result Product
    ${count}    Get Line Count       ${RequiredData}
    ${RequiredData}      Split To Lines    ${RequiredData}
#    set global variable       ${ExpectResult}       ${RequiredData[0]}
#    Verify Expected Result And Actual Result
#    ${text}     Replace String    ${RequiredData}    ${\n}    ${SPACE}
#    log     ${RequiredData}[0]
#    log     ${RequiredData}[1]
#    log      ${RequiredData}[2]
    FOR    ${i}    IN RANGE   0    ${count}
#        ${count}  Evaluate    ${count}+1
        Log    ${RequiredData}[${i}]
        set global variable       ${ExpectResult}       ${RequiredData}[${i}]
        Verify Expected Result And Actual Result
    END

Query Task count In TCM3 waiting approve menu

    ${query}    set variable    ${pcs_csl_task_count_in_TCM3_wtap}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${Actual_Result}      ${Result0fQuery}[0][0]

Query Task count In TCS4 waiting approve menu

    ${query}    set variable    ${pcs_csl_task_count_in_TCS4_wtap}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${Actual_Result}      ${Result0fQuery}[0][0]

Query Database On PCS_CSL_COST_SHEET where with cost sheet no

    log   ${DataForQry}
#    ${Dataforqry}  Split String    ${DataForQry}   -
#    log    ${DataForQry}[0]
#    ${Dataforqry}    set variable    ${DataForQry}[0]
    ${query}  Replace String   ${WaitingApprove_csl_cost_sheet_version_with_CsNo_Query}      ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0]
#    log     ${Result0fQuery}[0] , ${CSStatus}

Query CSversionID On PCS_CSL_COST_SHEET_VERSION where with cost sheet no.

    log    ${DataForQry}
    ${query}  Replace String   ${pcs_csl_cost_sheet_version_with_CsNo_Query_CSv.ID}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0][0]
    set global variable     ${DataForQry}      ${Result0fQuery}[0][0]
    ${DataForQry}   Convert To String    ${DataForQry}
    set global variable     ${DataForQry}

Then login with CSL_BC3
    input text      ${LoginUser}       CSL_BC3
    input text      ${LoginPass}       CSL_BC3
    click element   ${LoginButt}
#    sleep   15 s
     wait until keyword succeeds     2 m       2 s           element should be visible    ${WaitingApproveMenu}

Then login with Marketing Role
    input text      ${LoginUser}        CSL_MKT1
    input text      ${LoginPass}        CSL_MKT1
    click element   ${LoginButt}
    wait until keyword succeeds     30 s       2 s      element should be visible    ${WaitingApproveMenu}


Then login with User Sale Role Support
    input text      ${LoginUser}        CSL_SSP1
    input text      ${LoginPass}        CSL_SSP1
    click element   ${LoginButt}
    wait until keyword succeeds     30 s       2 s      element should be visible    ${WaitingApproveMenu}
    Wait for Page loading

Then login with TC Sale Support Role 1
    wait until keyword succeeds     1 m       1 s      input text      ${LoginUser}        CSL_TCS1
    wait until keyword succeeds     1 m       1 s      input text      ${LoginPass}        CSL_TCS1
    wait until keyword succeeds     1 m       1 s      click element   ${LoginButt}

    wait until keyword succeeds     1 m       1 s      element should be visible    ${SMT_Request_Menu_Tab}

Open Pricing COA Url
    [Arguments]         ${browser}=gc       ${avoid-https}=True
    ${device}=          open browser     ${Pricing_COA_Web_Url}          ${browser}     options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window
    Sleep   2 s

Then login with BC-Manager
    wait until keyword succeeds     30 s     1 s         input text      ${LoginCOAUser}        thanaprj
    wait until keyword succeeds     30 s     1 s         input text      ${LoginCOAPass}        thanaprj
    wait until keyword succeeds     30 s     1 s         element should be visible              ${COALoginButt}
    wait until keyword succeeds     30 s     1 s         click element   ${COALoginButt}
    wait until keyword succeeds     2 m       2 s        element should be visible   ${COAMenu}

COA Approve Cost Sheet Process
    wait until keyword succeeds     30 s     1 s     Element Should Be Visible      ${CoaNeedApproveMenu}
    wait until keyword succeeds     30 s     1 s     Element Should Be Visible      ${CategoryTable}
    wait until keyword succeeds     30 s     1 s     Click Element                  ${CategoryTable}
    wait until keyword succeeds     30 s     1 s     Element Should Be Enabled      ${CoaSearchCrit}
    wait until keyword succeeds     30 s     1 s     Input Text                     ${CoaSearchCrit}    ${costsheetno.}
    wait until keyword succeeds     30 s     1 s     Element Should Be Visible      ${ListRequestTable}
    Sleep  2 s
    wait until keyword succeeds     30 s     1 s     Click Element                  ${ListRequestTable}
#    wait until keyword succeeds     30 s     1 s     Element Should Be Visible      ${TextDetailNeedApprove}
    wait until keyword succeeds     30 s     1 s     Element Should Be Visible      ${DetailNeedApprove}
    wait until keyword succeeds     30 s     1 s     Element Should Be Visible      ${ApproveButton}
    wait until keyword succeeds     30 s     1 s     Click Element                  ${ApproveButton}
    wait until keyword succeeds     30 s     1 s     Element Should Be Visible      ${TitleConfirmBox}
    wait until keyword succeeds     30 s     1 s     Element Should Be Visible      ${OkButtonConfirmBox}
    wait until keyword succeeds     30 s     1 s     Click Element                  ${OkButtonConfirmBox}
    wait until keyword succeeds     30 s     1 s     Element Should Be Visible      ${TitleCompleteBox}
    wait until keyword succeeds     30 s     1 s     Click Element                  ${OkButtonConfirmBox}
    Close Browser


Click Execute Javascript :

    [Arguments]   ${xPath}

    ${ele}    Get WebElement   ${xPath}

    Scroll Element Into View   ${xPath}

    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}

Validate the data display function
    wait until keyword succeeds     1 m     1 s       click element                   ${Fst_CheckBox}
    wait until keyword succeeds     1 m     1 s       wait until element is visible   ${SearchTextLoc}
    element should be visible       ${ShowTextLoc}
    element should be visible       ${SearchTextLoc}
    element should be visible       ${PreviousTextLoc}
    element should be visible       ${PageNumb}
    element should be visible       ${NextTextLoc}
    element should be visible       ${NumbEntriesCS}
    wait until keyword succeeds   1 m     2 s       click element  //*[@id="worklist-table"]/tbody/tr[1]/td[1]/input
    comment

Query Revenue Group Id On PCS_CSL_COST_SHEET_VERSION where with cost sheeet version id.

    log    ${DataForQry}
    ${DataForQry}       Convert To String    ${DataForQry}
    ${query}  Replace String   ${pcs_csl_revenue_group_id_with_CsVerId_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0][0]
    set global variable     ${DataForQry}      ${Result0fQuery}[0][0]
    ${DataForQry}   Convert To String    ${DataForQry}
    set global variable     ${DataForQry}
Query On pcs_csl_service_group where with service_group_id.

    log    ${DataForQry}
    ${query}  Replace String   ${pcs_csl_pcs_csl_service_group_with_service_group_id}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0]

Query On pcs_csl_revenue_group where with service_group_id.

    log    ${DataForQry}
    ${query}  Replace String   ${pcs_csl_pcs_csl_revenue_group_with_service_group_id}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0]

Query Revenue Group Id On pcs_csl_service_group where with service_group_id.

    log    ${DataForQry}
    ${query}  Replace String   ${revenue_group_Id_pcs_csl_pcs_csl_service_group_with_CS_id}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${DataForQry}      ${Result0fQuery}[0][0]
    ${DataForQry}   Convert To String    ${DataForQry}
    set global variable     ${DataForQry}

Get Value with Loop
    [Arguments]         ${Lacator}
    ${RequiredData}=         Get Value               ${Lacator}
    Set Global Variable    ${RequiredData}

Query File Name On pcs_csl_service_group where with service_group_id.

    log    ${DataForQry}
    ${query}  Replace String   ${File_Name_pcs_file_with_CS_id}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0][0]

Query Service Group Id On PCS_CSL_COST_SHEET_VERSION where with cost sheeet version id.
    log    ${DataForQry}
    ${DataForQry}       Convert To String    ${DataForQry}
    ${query}  Replace String   ${pcs_csl_service_group_id_with_CsVerId_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0][0]
    set global variable     ${DataForQry}      ${Result0fQuery}[0][0]
    ${DataForQry}   Convert To String    ${DataForQry}
    set global variable     ${DataForQry}

Then login with TC Support 1 role
    wait until keyword succeeds     1 m       1 s      input text      ${LoginUser}        CSL_TCS1
    wait until keyword succeeds     1 m       1 s      input text      ${LoginPass}        CSL_TCS1
    wait until keyword succeeds     1 m       1 s      click element   ${LoginButt}
    Wait for Page loading
    wait until keyword succeeds     1 m       1 s      element should be visible    ${SMT_Request_Menu_Tab}

Verify Expected Result And Actual Result Service Description
    ${count}     Get Length    ${RequiredData}
#   ${ExpectResult}      Split To Lines    ${ExpectResult}
       log     ${RequiredData}[0]
       log     ${RequiredData}[1]
       log     ${RequiredData}[2]
       log     ${RequiredData}[3]
    FOR    ${i}    IN RANGE   0    ${count}

#        ${count}  Evaluate    ${count}+1
        Log    ${RequiredData}[${i}]
        set global variable       ${ExpectResult}       ${RequiredData}[${i}]
        Verify Expected Result And Actual Result
    END

Query Stage ID Database On PCS_FLOW_Transaction where with cost sheet no.
    log   ${DataForQry}
    ${query}  Replace String    ${stage_id_pcs_flow_transaction_with_CsNo_Query}    ???    ${Dataforqry}
    log     String SQL : ${query}
    ${Result0fQuery}    Query       ${query}
    log   ${Result0fQuery}[0][0]
    set global variable     ${ActualResult}      ${Result0fQuery}[0][0]

Click Pagination Button
    Wait Until Element Is Visible    ${Pagination_Next_Button}
    wait until keyword succeeds     2 m       2 s    Click Element               ${Pagination_Next_Button}


Get Redeem For Payment Status Complete
            ${ASL_Row_Data_Cost_Sheet}   Replace String     ${ASL_Each_Row_Cost_Per_Unit_Service_One_Time}    ???    ${i}
            Log   ${ASL_Row_Data_Cost_Sheet}
            Wait Until Page Contains Element    ${ASL_Row_Data_Cost_Sheet}
#            Sleep   10 s
#            ${ele}      Get WebElement    ${ASL_Row_Data_Cost_Sheet}
            FOR    ${k}    IN RANGE  10
            wait until keyword succeeds     30 s       1 s    Scroll Element Into View      ${ASL_Row_Data_Cost_Sheet}
            ${CostPerUnit}   Get Text     ${ASL_Row_Data_Cost_Sheet}
            ${CostPerUnit}=    Remove String    ${CostPerUnit}    ,
            ${statt}  run keyword and return status   convert to number  ${CostPerUnit}
            exit for loop if  ${statt}
            sleep  2s

           END
           ${CostPerUnit}  convert to number  ${CostPerUnit}
            Capture Page Screenshot

            ${Stack}   Evaluate   ${Stack} + ${CostPerUnit}
#           ${Stack}=  Evaluate  "%.2f" % ${Stack}
#           ${Stack}   Evaluate    +${CostPerUnit}
            Set Global Variable    ${Stack}

Check Status Payment Type
            ${KBT_Row_Data_Status}     Replace String       ${KBT_Status_Each_Row_Cust_Trans}     ???    ${i}
            Log         ${KBT_Row_Data_Status}
            FOR    ${m}    IN RANGE  10
                wait until keyword succeeds     30 s       1 s    Scroll Element Into View          ${KBT_Row_Data_Status}
                ${Status_Type}       Get Text        ${KBT_Row_Data_Status}
                Set Global Variable    ${Status_Type}
                ${stat1}    run keyword and return status     Should Not Be Equal    ${Empty}    ${Status_Type}
                exit for loop if  ${stat1}
                sleep  2s
            END
            Run Keyword IF     '${Status_Type}'=='Complete'      Get Redeem And Reward Payment Comeplete Value
            Run Keyword IF     '${Status_Type}'=='Void'          Get Redeem And Reward Payment Void Value


Get Redeem And Reward Payment Comeplete Value
            ${ASL_Row_Data_Cost_Sheet}   Replace String     ${ASL_Each_Row_Cost_Per_Unit_Service_One_Time}    ???    ${i}
            Log   ${ASL_Row_Data_Cost_Sheet}
            Wait Until Page Contains Element    ${ASL_Row_Data_Cost_Sheet}
#            Sleep   10 s
#            ${ele}      Get WebElement    ${ASL_Row_Data_Cost_Sheet}
            FOR    ${k}    IN RANGE  10
            wait until keyword succeeds     30 s       1 s    Scroll Element Into View      ${ASL_Row_Data_Cost_Sheet}
            ${CostPerUnit}   Get Text     ${ASL_Row_Data_Cost_Sheet}
            ${CostPerUnit}=    Remove String    ${CostPerUnit}    ,
            ${statt}  run keyword and return status   convert to number  ${CostPerUnit}
            exit for loop if  ${statt}
            sleep  2s
           END
           ${CostPerUnit}  convert to number  ${CostPerUnit}
            Capture Page Screenshot
            ${Stack_Redeem_Pay_Com}   Evaluate   ${Stack_Redeem_Pay_Com} + ${CostPerUnit}
#           ${Stack}=  Evaluate  "%.2f" % ${Stack}
#           ${Stack}   Evaluate    +${CostPerUnit}
            Set Global Variable    ${Stack_Redeem_Pay_Com}
            Get Reward For Payment Complete

Get Redeem And Reward Payment Void Value
            ${ASL_Row_Data_Cost_Sheet}   Replace String     ${ASL_Each_Row_Cost_Per_Unit_Service_One_Time}    ???    ${i}
            Log   ${ASL_Row_Data_Cost_Sheet}
            Wait Until Page Contains Element    ${ASL_Row_Data_Cost_Sheet}
            FOR    ${k}    IN RANGE  10
            wait until keyword succeeds     30 s       1 s    Scroll Element Into View      ${ASL_Row_Data_Cost_Sheet}
            ${CostPerUnit}   Get Text     ${ASL_Row_Data_Cost_Sheet}
            ${CostPerUnit}=    Remove String    ${CostPerUnit}    ,
            ${statt}  run keyword and return status   convert to number  ${CostPerUnit}
            exit for loop if  ${statt}
            sleep  2s
           END
           ${CostPerUnit}  convert to number  ${CostPerUnit}
            Capture Page Screenshot
            ${Stack_Redeem_Pay_Void}   Evaluate   ${Stack_Redeem_Pay_Void} + ${CostPerUnit}
            Set Global Variable    ${Stack_Redeem_Pay_Void}
            Get Reward For Payment Void

Get Redeem For Redemption Value
            ${ASL_Row_Data_Cost_Sheet}   Replace String     ${ASL_Each_Row_Cost_Per_Unit_Service_One_Time}    ???    ${i}
            Log   ${ASL_Row_Data_Cost_Sheet}
            Wait Until Page Contains Element    ${ASL_Row_Data_Cost_Sheet}
            FOR    ${k}    IN RANGE  10
            wait until keyword succeeds     30 s       1 s    Scroll Element Into View      ${ASL_Row_Data_Cost_Sheet}
            ${CostPerUnit}   Get Text     ${ASL_Row_Data_Cost_Sheet}
            ${CostPerUnit}=    Remove String    ${CostPerUnit}    ,
            ${statt}  run keyword and return status   convert to number  ${CostPerUnit}
            exit for loop if  ${statt}
            sleep  2s
           END
           ${CostPerUnit}  convert to number  ${CostPerUnit}
            Capture Page Screenshot
            ${Stack_Redeem_Redemption}   Evaluate   ${Stack_Redeem_Redemption} + ${CostPerUnit}
            Set Global Variable    ${Stack_Redeem_Redemption}

Get Reward For Payment Complete
            ${KBT_Reward_Data_Value}   Replace String     ${KBT_Reward_Each_Row_Cust_Trans}    ???    ${i}
            Log   ${KBT_Reward_Data_Value}
            Wait Until Page Contains Element    ${KBT_Reward_Data_Value}
            FOR    ${k}    IN RANGE  10
            wait until keyword succeeds     30 s       1 s    Scroll Element Into View      ${KBT_Reward_Data_Value}
            ${CostPerUnit}   Get Text     ${KBT_Reward_Data_Value}
            ${CostPerUnit}=    Remove String    ${CostPerUnit}    ,
            ${statt}  run keyword and return status   convert to number  ${CostPerUnit}
            exit for loop if  ${statt}
            sleep  2s
           END
           ${CostPerUnit}  convert to number  ${CostPerUnit}
            Capture Page Screenshot
            ${Stack_Reward_Pay_Com}   Evaluate   ${Stack_Reward_Pay_Com} + ${CostPerUnit}
            Set Global Variable    ${Stack_Reward_Pay_Com}

Get Reward For Payment Void
            ${KBT_Reward_Data_Value}   Replace String     ${KBT_Reward_Each_Row_Cust_Trans}    ???    ${i}
            Log   ${KBT_Reward_Data_Value}
            Wait Until Page Contains Element    ${KBT_Reward_Data_Value}
            FOR    ${k}    IN RANGE  10
            wait until keyword succeeds     30 s       1 s    Scroll Element Into View      ${KBT_Reward_Data_Value}
            ${CostPerUnit}   Get Text     ${KBT_Reward_Data_Value}
            ${CostPerUnit}=    Remove String    ${CostPerUnit}    ,
            ${statt}  run keyword and return status   convert to number  ${CostPerUnit}
            exit for loop if  ${statt}
            sleep  2s
           END
           ${CostPerUnit}  convert to number  ${CostPerUnit}
            Capture Page Screenshot
             ${Stack_Reward_Pay_Void}   Evaluate    ${Stack_Reward_Pay_Void} + ${CostPerUnit}
            Set Global Variable     ${Stack_Reward_Pay_Void}