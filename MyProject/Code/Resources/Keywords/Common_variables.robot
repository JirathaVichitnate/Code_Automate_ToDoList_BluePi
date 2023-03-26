*** Variable ***

${Read_Book_Act}             Read Book
${Watch_Movie_Act}           Watch Movie
${NetFlix_Time}              NetFlix Time
${count_two}            2
${Sing_Act}             ร้องเพลง
${Plant_Act}             ปลูกป่า
${Movie_Part1}          ดูหนังภาค1
${Movie_Part2}          ดูหนังภาค2
${Workout_Act}          Workout
${Browser}              Edge
${URL}                  https://abhigyank.github.io/To-Do-List/
${Kubata_URL}           https://skc-dev-1-5.d2udy2kv786rka.amplifyapp.com/
${Thirty_Second}        30 s
${Two_Seconds}          2 s


${Login_Page_Truck2Hand_Tile}            //h1[text()='เข้าสู่ระบบ']
${Username_TextBox}                      //input[@name="username"]
${Password_TextBox}                      //input[@name="password"]

${Login_Button}             //button[text()='เข้าสู่ระบบ']
${Popup_Error}             //*[text()='ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง']


${user_test_fail}          cat
${password_test_fail}      12345




${Pricing_web_url}                https://sit-iworkflow.cdc.ais.th/Pricing/#/login  #https://staging-iworkflow.intra.ais/Pricing/#/login   https://staging-iworkflow.intra.ais/Pricing/#/login    #
${Pricing_EDS_Web_Url}           https://sit-iworkflow.cdc.ais.th/Pricing/#/login  #https://staging-iworkflow.intra.ais/Pricing/#/login
${Pricing_CSL_Web_Url}           https://staging-iworkflow.intra.ais/CSLPricing/#/login   #https://sit-iworkflow.cdc.ais.th/CSLPricing           #
${Pricing_Cloud_Web_Url}      https://sit-iworkflow.cdc.ais.th/Pricing
${browser}      Edge
#//*[@id="worklist-table_paginate"]/ul/li[2]/a
#Pricing Portal Page locter
${Approved_ListTabLoc}    //*[contains(text(),'APPROVED LIST')]
${SMT_Request_Menu_Tab}    //*[contains(text(),'SMT REQUEST')]
${App_Solution_List_Menu_Tab}  //*[(text()=' APP SOLUTION LIST ')]  #//*[contains(text(),' APP SOLUTION LIST ')]
${Pricing_List_Menu_Tab}            //*[contains(text(),' PRICING LIST ')]
${App_Costsheet_List_Menu}          //*[contains(text(),' APP COSTSHEET LIST ')]
${PricingOnlineTab}         //*[contains(text(),'PRICING ONLINE')]
${CostSheetMenuTab}          //*[contains(text(),'COST SHEET')]
${Count_Task_App_Solution_List_Menu_Tab}     //span[text()=" APP SOLUTION LIST "]/following::span[1]

${SearchTextBox}    //*[@id="worklist-table_filter"]/label/input

${Pricing_List_SearchTextBox}      //*[@id="pricinglist-table_filter"]/label/input

${SearchTextLoc}    //*[contains(text(),'Search:')]
${ShowTextLoc}    //*[contains(text(),'Show ')]
${NumTextLoc}       //*[@id="cost-sheet-SearchList-table_length"]/label/select
${entriesTextLoc}    //*[contains(text(),' entries')]
${PreviousTextLoc}    //*[contains(text(),'Previous')]
${NextTextLoc}     //*[contains(text(),'Next')]
${PagesClsLoc}   //*[@class='paginate_button active']
${PageNumb}       //*[@id="worklist-table_paginate"]/ul/li[2]/a

${NumbEntriesCS}        //*[@id="worklist-table_info"]

${NumPage}   //*[@id="worklist-table_paginate"]/ul/li[2]/a


${DropDownListEntrySearchMenu}          //*[@id="cost-sheet-SearchList-table_length"]/label/select
#-------------------------------------------------Search Criteria---------------------------------------------------------------

${CostSheetNoTextCrit}          //label[contains(text(),'Cost Sheet No.')]/parent::div/div/input[@id="cs_no"]        #//label[contains(text(),'Cost Sheet No.')]/parent::div/div/input
${CritCostSheetNoTextBox}       //label[contains(text(),'Cost Sheet No.')]/parent::div/div/input
${OpportunityTextCrit}          //label[contains(text(),'Opportunity No.')]/parent::div/div/input
${BCSumittedDateTextCrit}       //label[contains(text(),'BC Submitted Date')]/parent::div/my-date-picker//input
${CreateDateFromTextCrit}       //label[contains(text(),'Create Date From')]/parent::div//input
${CreateDateToTextCrit}          //label[contains(text(),'Create Date To')]/parent::div//input
${CANoTextCrit}              //label[contains(text(),'CA No.')]/parent::div//input
${CustomerNameTextCrit}    (//label[text()='Customer Name']/following::input)[1]  #//label[contains(text(),'Customer Name')]/parent::div/div/input [@class="form-control input-sm ng-pristine ng-invalid ng-touched"]
${CustomerNameEngTextCrit}       //label[contains(text(),'Customer Name Eng')]/parent::div/div/input
${SaleOwnerTextCrit}        //label[contains(text(),'Sale Owner')]/parent::div//input
${CreateByTextCrit}         //label[contains(text(),'Create By')]/parent::div//input
${OpenCalendarButt}         //label[contains(text(),'BC Submitted Date')]/parent::div/my-date-picker//button [@class="btnpicker btnpickerenabled"]                    #//label[contains(text(),'BC Submitted Date')]/parent::div/my-date-picker//button [@class="btnpicker btnpickerenabled" and @aria-label="Open Calendar"]
${Calendar}         //div [@class="selector selectorarrow selectorarrowleft"]


${OpenCalendarButt_C_D_Fr}    //label[contains(text(),'Create Date From')]/parent::div//button     #//label[contains(text(),'BC Submitted Date')]/parent::div/my-date-picker//button [@class="btnpicker btnpickerenabled"]                    #//label[contains(text(),'BC Submitted Date')]/parent::div/my-date-picker//button [@class="btnpicker btnpickerenabled" and @aria-label="Open Calendar"]
${OpenCalendarButt_C_D_To}    //label[contains(text(),'Create Date To')]/parent::div//button
${Calendar_C_D_Fr}         //div[@class="selector selectorarrow selectorarrowleft"]
${Calendar_C_D_To}     //div[@class="selector selectorarrow selectorarrowleft"]
${RandCalendarDate}        //*[@class="daycell currmonth tablesingleday" and @aria-label="Select day${randD}"]


#${SearchButton}     //button [@class="btn btn-success pull-right"]
${SearchButton}     (//button[text()='Search'])
${ClearButton}       (//button[text()=' Clear '])
#${ClearButton}    //*[@class="box-footer clearfix"]//button[2]  # //*[@id="Clear" and contains(text(),'Clear')]         #//button [@class="btn btn-default pull-right" and @id="Clear"]


${Criteria}    //form [@class="ng-untouched ng-pristine ng-invalid"]




${SMTRequestWorkListLoc}              name:worklist-table_length      #//label[text()='Show ']/select
${SMTRequestShowingEntriesLoc}        id:worklist-table_info

#id:worklist-table_paginate
${CostSheetDropDownLoc}              name:cost-sheet-approve-table_length
${ApprovedListSheetTableCountLoc}    //*[@id="cost-sheet-approve-table"]/tbody/tr
${Page3LocaterXpath}                 //*[@id="cost-sheet-approve-table_paginate"]/ul/li[4]/a
${Page2LocaterXpath}                 //*[@id="cost-sheet-approve-table_paginate"]/ul/li[3]/a
${Page1LocaterXpath}                 //*[@id="cost-sheet-approve-table_paginate"]/ul/li[2]/a
${SheetTotalPagesXpath}              //*[@id="cost-sheet-approve-table_info"]
${ApprovedTextInTableXpath}          //span[contains(text(),'Approved')]

${Cost_Sheet_No_Update_Page}         //label[text()='Cost Sheet No.']/parent::div/div/input


${CheckBoxSearchResult}              //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[1]/input
${CheckBox}                          //*[@id="worklist-table"]/tbody/tr[1]/td[1]/input
${Fst_CheckBox}                //*[@id="worklist-table"]/tbody/tr[1]/td[1]/input
${STCheckBoxSearchResult}            //table[@id='cost-sheet-SearchList-table']/tbody/tr[1]/td[1]/input  #//table[@id='cost-sheet-SearchList-table']/tbody/tr[1]/td[1]/input
${RandSTCheckBoxSearchResult}        //table[@id='cost-sheet-SearchList-table']/tbody/tr[???]/td[1]/input
${TotalSearchBoxSearchResult}        //table[@id='cost-sheet-SearchList-table']/tbody/tr/td[1]/input
${TotalRowSearchResult}              //table[@id='cost-sheet-SearchList-table']/tbody/tr

${SearchBoxSTC}                      //*[@id="cost-sheet-SearchList-table_filter"]/label/input
#---------------------------------Search result Data Table-----------------------------------------------------
${Table_List_Column_Cost_Sheet_Status}           //th[text()='Cost Sheet Status']
${Table_List_Column_Opportunity_No}              //th[text()='Opportunity No.']
${Table_List_Column_Cost_Sheet_No}               //th[text()='Cost Sheet No.']
${Table_List_Column_Sale_Order_No}               //th[text()='Sale Order No.']
${Table_List_Column_SFM_Cost_Sheet_No}           //th[text()='SFM Cost Sheet No.']
${Table_List_Column_Sale_Order_Message}          //th[text()='Sale Order Message']
${Table_List_Column_Oppertunity_Id}              //th[text()='Opportunity ID']
${Table_List_Column_Order_type}                  //th[text()='Order type']
${Table_List_Column_Lease_Line_type}             //th[text()='Lease Line type']
${Table_List_Column_Service_Group}               //th[text()='Service Group']
${Table_List_Column_Cost_Sheet_Type}             //th[text()='Cost Sheet Type']
${Table_List_Column_CA_No}                       //th[text()='CA No.']
${Table_List_Column_Customer_Name}               //th[text()='Customer Name']
${Table_List_Column_Customer_Name_Eng}           //th[text()='Customer Name Eng']
${Table_List_Column_Project_Name}                //th[text()='Project Name']
${Table_List_Column_Sale_Owner}                  //th[text()='Sale Owner']
${Table_List_Column_Create_Date}                 //th[text()='Create Date']
${Table_List_Column_BC_Submitted_Date}           //th[text()='BC Submitted Date']
${Table_List_Column_Performer_Name}              //th[text()='Performer Name']
${Table_List_Column_Approve_Name_Level}          //th[text()='Approve Name Level 1']
${Table_List_Column_Approve_Date_Level_1}        //th[text()='Approve Date Level 1']
${Table_List_Column_Approve_Name_Level_2}        //th[text()='Approve Name Level 2']
${Table_List_Column_Approve_Date_Level_2}        //th[text()='Approve Date Level 2']
${Table_List_Column_Approve_Name_Level_3}        //th[text()='Approve Name Level 3']
${Table_List_Column_Approve_Date_Level_3}        //th[text()='Approve Date Level 3']
${Table_List_Column_Delegate_From}               //th[text()='Delegate From']
${Table_List_Column_Delegate_To}                 //th[text()='Delegate To']

${Table_List_Column_Cost_Sheet_Status_Data_R1}                   (//table[@id='cost-sheet-SearchList-table']/tbody/tr/td[2])[1]    #//*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[2]
${Search_Text_Table_List_Column_Cost_Sheet_Status_Data_R1}       (//table[@id='cost-sheet-SearchList-table']/tbody/tr/td[2])[1]/span
${Table_List_Column_Opportunity_No_Data_R1}                      //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[3]
${Table_List_Column_Cost_Sheet_No_Data_R1}                       //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[4]/a                 #//*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[4]
${Table_List_Column_Order_type_Data_R1}                          //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[8]
${Table_List_Column_Lease_Line_type_R1}                          //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[9]
${Table_List_Column_Cost_Sheet_type_R1}                          //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[12]
${Table_List_Column_CA_No_R1}                                    //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[13]
${Table_List_Column_Customer_Name_R1}                            //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[14]
${Table_List_Column_Customer_Name_Eng_R1}                        //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[15]
${Table_List_Column_Project_Name_R1}                             //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[16]
${Table_List_Column_Sale_Owner_R1}                               //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[17]
${Table_List_Column_Create_Date_R1}                              //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[18]
${Table_List_Column_BC_Submitted_Date_R1}                        //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[19]
${Table_List_Column_Performer_Name_R1}                           //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[20]
${Table_List_Column_Approve_Name_Level_1_R1}                     //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[21]
${Table_List_Column_Approve_Date_Level_1_R1}                     //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[22]
${Table_List_Column_Approve_Name_Level_2_R1}                     //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[23]
${Table_List_Column_Approve_Date_Level_2_R1}                     //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[24]
${Table_List_Column_Approve_Name_Level_3_R1}                     //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[25]
${Table_List_Column_Approve_Date_Level_3_R1}                     //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[26]
${Table_List_Column_Approve_Delegate_From_R1}                    //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[27]
${Table_List_Column_Approve_Delegate_To_R1}                      //*[@id="cost-sheet-SearchList-table"]/tbody/tr[1]/td[28]
${Search_Table_List_Number_Of_Row}                               //*[@id="cost-sheet-SearchList-table"]/tbody/tr
${Row_Data_Table}                                                //*[@id="worklist-table"]

${Table_List_Column_Order_Type}                //th[text()='Order Type']
${Table_List_Column_Customer_Name}             //th[text()='Customer Name']
${Table_List_Column_Project_Name}              //th[text()='Project Name']
${Table_List_Column_Pricing_Name}              //th[text()='Pricing Name']
${Table_List_Column_Pricing_Submitted_Date}    //th[text()='Pricing Submitted Date']
${Table_List_Column_TC_Name}                   //th[text()='TC Name']
${Table_List_Column_TC_Submitted_Date}         //th[text()='TC Submitted Date']
${Table_List_Column_BC_Name}                   //th[text()='BC Name']
${Table_List_Column_BC_Submitted_Date}         //th[text()='BC Submitted Date']
#-----------------Update Cost Sheet Page-----------------------------
${UpdCosSh_name_eng}        //*[@id="cust_name_en" and @class="form-control ng-untouched ng-pristine ng-invalid"]
${UpdCosSh_name_tha}        //*[@id="cust_name_th" and @class="form-control ng-pristine ng-valid ng-touched"]


${OpportunityIdXpath}                   //*[@id="cost-sheet-approve-table"]/tbody/tr[1]/td[3]
############## Log in Page #############
${LoginUser}                            (//*[@class="form-control ng-untouched ng-pristine ng-invalid"])[1]
${LoginPass}                            //*[@class="form-control ng-untouched ng-pristine ng-invalid"]

${LoginButt}                            //*[@class="btn btn-block btn-success"]
############### CSL Pricing Page ############
${WaitingApproveMenu}                  //*[text()=' WAITING APPROVE ']        #//*[contains(text(),'WAITING APPROVE')]
${ApprovedMenu}              //span[text()=" APPROVED "]            #//*[contains(text(),'APPROVED')]
${Count_Task_WaitingApproveMenu}        //span[text()=" WAITING APPROVE "]/following::span[1]
${Count_Task_ApprovedMenu}        //span[text()=" APPROVED "]/following::span[1]

#Data Base
${cs_version_status}     SELECT cs_version_status FROM sbniwf.pcs_cost_sheet_version WHERE cs_version_status
${cs_version_ID}    SELECT opportunity_id FROM sbniwf.pcs_cost_sheet_version WHERE opportunity_id
#-------------------Button---------------------------
${ActionButton}           //button[text()="Action"]/following::button     #  //button[@class="btn btn-success dropdown-toggle"]
${Actionbutt}             //button[@type='button' and @class="btn btn-success dropdown-toggle" and @data-toggle="dropdown"]
${Submitbutt}             //*[contains(text(),'Submit')]
${Rejectbutt}             //*[contains(text(),'Reject')]
${Delegatebutt}           //a[(text()='Delegate')]      #//*[contains(text(),'Delegate')]
${Submit_Sub_Butt}        //a[contains(text(),'Submit')]   #/parent::li/parent::ul//a[3]
${Submit_CS_Butt}         //button[contains(text(),'Submit')]
##################### Times###################################
${Large_Wait_Time}         20s
${Medium_Wait_Time}        10s
${Middle_Wait_Time}        30 s
${Wait_Half_Minute}        30 s
${One_Second}               1 s

${UserName_Box}            //*[@class="dropdown-toggle"]

${Data_Display_Function}      //div[@class="dataTables_scrollHead"]
${Data_Table}                 //div[@class="dataTables_scrollBody"]/table


########################## App solution list ###################



#//*[contains(text(),'WAITING APPROVE')]
${ASL_TotalCheckBoxCostSheet}    //*[@id="worklist-table"]/tbody/tr/td[1]/input
${ASL_TotalRowCostSheet}         //*[@id="worklist-table"]/tbody/tr

${remainingpage}                 //li[@class="paginate_button "]/a
${EntriesDropDownLoc}            //*[@id="worklist-table_length"]/label/select

${Resul_Data_Rows}               //*[@id="worklist-table"]/tbody/tr
${Data_Rows}                     //*[@id="worklist-table"]/tbody/tr
${Showing_Count_Number}          //div[contains(text(),'Showing')]    #${Showing_Count_Number_List}       ${Showing_Number_Per_Page}
${Pagination_Previous_Button}    //a[text()='Previous']
${Pagination_Next_Button}        //a[text()='Next']
${Pagination_DropDown}           //label[text()='Show ']/select

${Pagination_Count}              //*[text()="Previous"]/following::a[@aria-controls="worklist-table"]


####################### Add brand#################################

${Create_New_CS_Button}           //a[contains(text(),' Create New Cost Sheet ')]

${Drop_Down_Order_Type}           //select[@formcontrolname="orderType"]

${Drop_Down_Main_Product}         //select[@formcontrolname="leaseLineFlg"]
${remainingpage}    //li[@class="paginate_button "]/a
${UserName_Box}          //*[@class="dropdown-toggle"]

${loading_Page}                         //div[contains(@class,'backdrop')]
${Cost_Sheet_No_Panel}                  //label[text()='Cost Sheet No.']
${One_Time_Charge_Value}                //label[text()="One Time Charge "]/following::input[1]
${Table_One_Time_Update_CS_page}        //h3[text()='One Time']  #//h3[contains(text(),'One Time')]
${Table_Monthly_Update_CS_page}         //h3[contains(text(),'Monthly')]
${Search_Tab_Menu}                      //span[text()=' SEARCH ']

${Update_Cost_Sheet_Title}            //h1[text()=' Update Cost Sheet ']
${Save_Success_Popup}            //div[contains(text(),'ดำเนินการบันทึกข้อมูลสำเร็จ')]

${Pricing_COA_Web_Url}                  https://staging-newcpe.ais.co.th/COA/
${LoginCOAUser}                         //div[@id="login-form"]/input[@placeholder="Username"]
${LoginCOAPass}                         //div[@id="login-form"]/input[@placeholder="Password"]
${COALoginButt}                            //a[text()='Submit']
${COAMenu}                              //div[@id="mob_collapse"]/span
${CoaNeedApproveMenu}                       //span[text()='Need Approve']
${CategoryTable}                              //ul[@id="ul_viewCategory"]/div/table
${CoaSearchCrit}                    //input[@id="textFilter"]
${ListRequestTable}                    //ul[@id="ul_viewTransaction"]/div
${TextDetailNeedApprove}                    //span[text()='  Detail']
${DetailNeedApprove}               //div[@id="div_onDetail"]
${ApproveButton}                //a[text()='Approve']
${TitleConfirmBox}                //h4[text()='Confirm']
${OkButtonConfirmBox}              //button[text()=' OK ']
${TitleCompleteBox}                  //h4[text()=' Complete']