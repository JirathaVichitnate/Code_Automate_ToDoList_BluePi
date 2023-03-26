*** Settings ***
Documentation    Suite description


Resource        ../Resources/Keywords/Common_keywords.robot


#Library         ../Resources/PageKeywords/OverrideSeleniumLibrary.py
*** Test Cases ***
001:เข้าสู่เว็ปไซต์ TO DO LIST
    [Documentation]
    ...      - แสดง Sceen  :
    ...      - ประกอบด้วยข้อมูล
    ...      - ส่วนที่ 1  Title : 'TO DO LIST'
    ...      - ส่วนที่ 2  Menu :
    ...        - Add Item
    ...        - TO-DO Tasks
    ...        - Completed
    ...      - ส่วนที่ 3  Text Box : input สำหรับใส่รายการ
    [Tags]    Step 1

    Open URL To Do List
    Wait Until Page Contains Element           ${Title_ToDoList}       ${Thirty_Second}
    Wait Until Page Contains Element           ${Menu_AddItem}         ${Thirty_Second}
    Wait Until Page Contains Element           ${Menu_ToDoTasks}       ${Thirty_Second}
    Wait Until Page Contains Element           ${Menu_Completed}       ${Thirty_Second}
    Wait Until Page Contains Element           ${input_list_textbox}     ${Thirty_Second}
    Capture Page Screenshot         TCS_1_001.png

002:ตรวจสอบ Action การ Add Item
    [Documentation]
    ...      - หน้าจอแสดง รายการที่ Add ที่ Menu TO-DO Tasks
    [Tags]    Step 2
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${Read_Book_Act}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element    ${Read_Book_TextList}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  30
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${Read_Book_TextList}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_ToDoTasks}
    END
    Capture Page Screenshot         TCS_2_001.png

003:ตรวจสอบ Action การ Completed Task ที่ To Do List
    [Documentation]
    ...      - หน้าจอแสดง รายการที่ Completed ที่ Menu Completed
    [Tags]    Step 3
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Read_Book_TextList}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Menu_Completed}
    Wait Until Page Contains Element      ${Read_Book_TextList_Completed_Menu}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  30
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${Read_Book_TextList_Completed_Menu}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_Completed}
    END
    Capture Page Screenshot         TCS_3_001.png


004:ตรวจสอบ Action การ delete Item
    [Documentation]
    ...      - หน้าจอไม่แสดง รายการที่ Delete ที่ Menu Completed
    [Tags]    Step 4
    Wait Until Page Contains Element    ${Delete_Button_Fst_Task_Completed_Menu}      ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Delete_Button_Fst_Task_Completed_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Element Should Not Be Visible    ${Read_Book_TextList_Completed_Menu}
    Capture Page Screenshot         TCS_4_001.png
    Close Browser

005:ตรวจสอบ Action การ Add Item ด้วยข้อมูลซ้ำ
    [Documentation]
    ...     - หน้าจอแสดง รายการที่ Add ที่ Menu TO-DO Tasks
    ...     - Column ประกอบด้วย  Tasks ที่ซ้ำกัน
    [Tags]    Step 5
    Open URL To Do List
    Wait Until Page Contains Element           ${Title_ToDoList}       ${Thirty_Second}
    Wait Until Page Contains Element           ${Menu_AddItem}         ${Thirty_Second}
    Wait Until Page Contains Element           ${input_list_textbox}     ${Thirty_Second}

    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${Watch_Movie_Act}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Textfield Value Should Be    ${input_list_textbox}    ${EMPTY}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${Watch_Movie_Act}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Textfield Value Should Be    ${input_list_textbox}    ${EMPTY}
    
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element    ${Watch_Movie_TextList_Task_ToDoTask_Menu}      ${Thirty_Second}
    ${count}    Get Element Count    ${Watch_Movie_TextList_Task_ToDoTask_Menu}
    ${count}     Convert To String    ${count}
    Should Be Equal    ${count}    ${count_two}
    
    Capture Page Screenshot         TCS_5_001.png

006:ตรวจสอบ Action การ Completed Item กรณีข้อมูลซ้ำ
    [Documentation]
    ...     - หน้าจอแสดง รายการที่ Completed ที่ Menu Completed ทั้ง  2 task
    [Tags]    Step 6
    Wait Until Page Contains Element    ${Watch_Movie_TextList_Completed_Menu_Fst_Task}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Watch_Movie_TextList_Completed_Menu_Fst_Task}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Menu_Completed}
    Wait Until Page Contains Element      ${Watch_Movie_TextList_Completed_Menu}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  10
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${Watch_Movie_TextList_Completed_Menu}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_Completed}
    END

    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element    ${Watch_Movie_TextList_Task_ToDoTask_Menu}      ${Thirty_Second}

    Wait Until Page Contains Element    ${Watch_Movie_TextList_Completed_Menu_Fst_Task}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Watch_Movie_TextList_Completed_Menu_Fst_Task}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Menu_Completed}
    Wait Until Page Contains Element      ${Watch_Movie_TextList_Completed_Menu}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  10
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${Watch_Movie_TextList_Completed_Menu}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_Completed}
    END
    ${count}    Get Element Count    ${Watch_Movie_TextList_Completed_Menu}
    ${count}     Convert To String    ${count}
    Should Be Equal    ${count}    ${count_two}

    Capture Page Screenshot         TCS_6_001.png
007:ตรวจสอบ Action การ delete Item กรณีข้อมูลซ้ำ
    [Documentation]
    ...     - หน้าจอไม่แสดง รายการที่ Delete ที่ Menu Completed  ทั้ง  2 task
    [Tags]    Step 7
    Wait Until Page Contains Element    ${Delete_Button_Fst_Watch_Movie_Task_Completed_Menu}      ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Delete_Button_Fst_Watch_Movie_Task_Completed_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element       ${Menu_ToDoTasks}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Menu_Completed}
    Wait Until Page Contains Element    ${Delete_Button_Fst_Watch_Movie_Task_Completed_Menu}      ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Delete_Button_Fst_Watch_Movie_Task_Completed_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Element Should Not Be Visible    ${Delete_Button_Fst_Watch_Movie_Task_Completed_Menu}
    Capture Page Screenshot         TCS_4_001.png
    Close Browser

008:ตรวจสอบ Action การ delete Item ที่ Menu TO-DO tasks
    [Documentation]
    ...     - หน้าจอไม่แสดง รายการที่ Delete ที่ Menu TO-DO Tasks
    [Tags]    Step 8
    Open URL To Do List
    Wait Until Page Contains Element           ${Title_ToDoList}       ${Thirty_Second}
    Wait Until Page Contains Element           ${Menu_AddItem}         ${Thirty_Second}
    Wait Until Page Contains Element           ${input_list_textbox}     ${Thirty_Second}

    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${NetFlix_Time}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Textfield Value Should Be    ${input_list_textbox}    ${EMPTY}

    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element   ${NetFlix_Time_TextList_Task_ToDoTask_Menu}      ${Thirty_Second}

    Wait Until Page Contains Element           ${Delete_Button_Fst_Watch_Movie_Task_ToDoTasks_Menu}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element     ${Delete_Button_Fst_Watch_Movie_Task_ToDoTasks_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Element Should Not Be Visible    ${NetFlix_Time_TextList_Task_ToDoTask_Menu}
    Capture Page Screenshot         TCS_8_001.png
    Close Browser

009:ตรวจสอบ Action การ Add Item ด้วย ภาษาไทย
    [Documentation]
    ...     - หน้าจอแสดง รายการที่ Add ที่ Menu TO-DO Tasks
    [Tags]    Step 9
     Open URL To Do List
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${Sing_Act}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element    ${Sing_Song_TextList}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  30
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${Sing_Song_TextList}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_ToDoTasks}
    END
    Capture Page Screenshot         TCS_9_001.png
010:ตรวจสอบ Action การ Completed Task ที่ To Do List ด้วย ภาษาไทย
    [Documentation]
    ...     - หน้าจอแสดง รายการภาษาไทยที่ Completed ที่ Menu Completed
    [Tags]    Step 10
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Sing_Song_TextList}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Menu_Completed}
    Wait Until Page Contains Element      ${Sing_Song_TextList_Completed_Menu}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  30
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${Sing_Song_TextList_Completed_Menu}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_Completed}
    END
    Capture Page Screenshot         TCS_10_001.png

011:ตรวจสอบ Action การ delete Item ภาษาไทย
    [Documentation]
    ...     - หน้าจอแสดง รายการภาษาไทยที่ Completed ที่ Menu Completed
    [Tags]    Step 11
    Wait Until Page Contains Element    ${Delete_Button_Fst_SingSong_Task_Completed_Menu}      ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Delete_Button_Fst_SingSong_Task_Completed_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Element Should Not Be Visible    ${Sing_Song_TextList_Completed_Menu}
    Capture Page Screenshot         TCS_11_001.png
    Close Browser

012:ตรวจสอบ Action การ delete Item ที่ Menu TO-DO tasks ภาษาไทย
    [Documentation]
    ...     - '- หน้าจอไม่แสดง รายการที่ Delete ที่ Menu TO-DO Tasks
    [Tags]    Step 12

    Open URL To Do List
    Wait Until Page Contains Element           ${Title_ToDoList}       ${Thirty_Second}
    Wait Until Page Contains Element           ${Menu_AddItem}         ${Thirty_Second}
    Wait Until Page Contains Element           ${input_list_textbox}     ${Thirty_Second}

    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${Plant_Act}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Textfield Value Should Be    ${input_list_textbox}    ${EMPTY}

    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element   ${Plant_TextList_Task_ToDoTask_Menu}      ${Thirty_Second}

    Wait Until Page Contains Element           ${Delete_Button_Fst_Plant_Task_ToDoTasks_Menu}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element     ${Delete_Button_Fst_Plant_Task_ToDoTasks_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Element Should Not Be Visible    ${Plant_TextList_Task_ToDoTask_Menu}
    Capture Page Screenshot         TCS_12_001.png
    Close Browser

013:ตรวจสอบ Action การ Add Item ด้วย กรณีมีตัวเลข
    [Documentation]
    ...     - '- หน้าจอไม่แสดง รายการที่ Delete ที่ Menu TO-DO Tasks
    [Tags]    Step 13
    Open URL To Do List
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${Movie_Part1}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element   ${Movie_Part_1_TextList}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  30
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${Movie_Part_1_TextList}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_ToDoTasks}
    END
    Capture Page Screenshot         TCS_13_001.png

014:ตรวจสอบ Action การ Completed Task ที่ To Do List กรณีมีตัวเลข
    [Documentation]
    ...     - หน้าจอแสดง รายการกรณีมีตัวเลขที่ Completed ที่ Menu Completed
    [Tags]    Step 14
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Movie_Part_1_TextList}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Menu_Completed}
    Wait Until Page Contains Element      ${Moive_Part_1_TextList_Completed_Menu}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  30
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${Moive_Part_1_TextList_Completed_Menu}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_Completed}
    END
    Capture Page Screenshot         TCS_14_001.png

015:ตรวจสอบ Action การ delete Item กรณีมีตัวเลข
    [Documentation]
    ...     - หน้าจอแสดง รายการภาษาไทยที่ Completed ที่ Menu Completed
    [Tags]    Step 15
    Wait Until Page Contains Element    ${Delete_Button_Fst_MoviePart1_Task_Completed_Menu}       ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Delete_Button_Fst_MoviePart1_Task_Completed_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Element Should Not Be Visible    ${Moive_Part_1_TextList_Completed_Menu}
    Capture Page Screenshot         TCS_15_001.png
    Close Browser

016:ตรวจสอบ Action การ delete Item ที่ Menu TO-DO tasks ภาษาไทย
    [Documentation]
    ...     - หน้าจอไม่แสดง รายการที่ Delete ที่ Menu TO-DO Tasks
    [Tags]    Step 16

    Open URL To Do List
    Wait Until Page Contains Element           ${Title_ToDoList}       ${Thirty_Second}
    Wait Until Page Contains Element           ${Menu_AddItem}         ${Thirty_Second}
    Wait Until Page Contains Element           ${input_list_textbox}     ${Thirty_Second}

    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${Movie_Part2}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Textfield Value Should Be    ${input_list_textbox}    ${EMPTY}

    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element   ${Movie_Part_2_TextList_Task_ToDoTask_Menu}      ${Thirty_Second}

    Wait Until Page Contains Element           ${Delete_Button_Fst_Movie_Part_2_ToDoTasks_Menu}      ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element     ${Delete_Button_Fst_Movie_Part_2_ToDoTasks_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Element Should Not Be Visible    ${Movie_Part_2_TextList_Task_ToDoTask_Menu}
    Capture Page Screenshot         TCS_16_001.png
    Close Browser

017:ตรวจสอบ Action การ Add Item ด้วย กรณีมีFormวันที่
    [Documentation]
    ...     - หน้าจอแสดง รายการภาษาไทยที่ Add ที่ Menu TO-DO Tasks
    [Tags]    Step 17
    Open URL To Do List
    ${currentdate}    Get Current Date   result_format=%d/%m/%Y
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${Workout_Act}${currentdate}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element   ${WorkOut_TextList}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  30
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${WorkOut_TextList}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_ToDoTasks}
    END
    Capture Page Screenshot         TCS_17_001.png

018:ตรวจสอบ Action การ Completed Task ที่ To Do List กรณีมีFormวันที่
    [Documentation]
    ...     - หน้าจอแสดง รายการกรณีมีFormวันที่ที่ Completed ที่ Menu Completed
    [Tags]    Step 18
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${WorkOut_TextList}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Menu_Completed}
    Wait Until Page Contains Element      ${Workout_TextList_Completed_Menu}      ${Thirty_Second}
    FOR  ${i}  IN RANGE  30
        ${stat}  run keyword and return status  Wait Until Element Is Visible   ${Workout_TextList_Completed_Menu}
        exit for loop if  ${stat}
        sleep  1s
        run keyword and ignore error  Click Element     ${Menu_AddItem}
        run keyword and ignore error  Element Should Be Visible    ${input_list_textbox}
        run keyword and ignore error  Click Element     ${Menu_Completed}
    END
    Capture Page Screenshot         TCS_18_001.png

019:ตรวจสอบ Action การ delete Item กรณีมีFormวันที่
    [Documentation]
    ...     - หน้าจอไม่แสดง รายการที่ Delete ที่ Menu Completed
    [Tags]    Step 19
    Wait Until Page Contains Element    ${Delete_Button_Fst_Workout_Task_Completed_Menu}       ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element        ${Delete_Button_Fst_Workout_Task_Completed_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Element Should Not Be Visible    ${Workout_TextList_Completed_Menu}
    Capture Page Screenshot         TCS_19_001.png
    Close Browser


020:ตรวจสอบ Action การ delete Item ที่ Menu TO-DO tasks กรณีมีFormวันที่
    [Documentation]
    ...     - หน้าจอไม่แสดง รายการที่ Delete ที่ Menu TO-DO Tasks
    [Tags]    Step 20

    Open URL To Do List
    Wait Until Page Contains Element           ${Title_ToDoList}       ${Thirty_Second}
    Wait Until Page Contains Element           ${Menu_AddItem}         ${Thirty_Second}
    Wait Until Page Contains Element           ${input_list_textbox}     ${Thirty_Second}

    ${currentdate}    Get Current Date   result_format=%d/%m/%Y
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Input Text    ${input_list_textbox}    ${Workout_Act}${currentdate}
    Wait Until Page Contains Element    ${Add_Button}     ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Add_Button}
    Textfield Value Should Be    ${input_list_textbox}    ${EMPTY}

    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element    ${Menu_ToDoTasks}
    Wait Until Page Contains Element   ${WorkOut_TextList}      ${Thirty_Second}

    Wait Until Page Contains Element           ${Delete_Button_Fst_Workout_ToDoTasks_Menu}      ${Thirty_Second}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Click Element     ${Delete_Button_Fst_Workout_ToDoTasks_Menu}
    Wait Until Keyword Succeeds    ${Thirty_Second}    ${Two_Seconds}    Element Should Not Be Visible    ${WorkOut_TextList}
    Capture Page Screenshot         TCS_20_001.png
    Close Browser














