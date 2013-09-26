 require 'win32ole'

  excel = WIN32OLE.new('Excel.Application')
  #excel = WIN32OLE::connect('excel.Application')  #excel running
  excel.visible = true
  wrkbook= excel.Workbooks.Open('D:\\workspace\\UnipeiManageTest\\Logins.xlsx')
  wrksheet= wrkbook.Worksheets(1)

#Convert the range of cells to a 2D array
login_data = wrksheet.range("A1:B2").value

#Output of the 2D array
p login_data
#=> [["jsmith", "password1"], ["jdoe", "password2"]]

#Start your browser
b = Watir::Browser.new    

#Loop through the login data
login_data.each do |data|

    #Determine the user id and password for the row of data
    user = data[0]
    password = data[1]

    #Go to the login page
    b.goto 'http://tech/mellingcarsweb/Admin/Login.aspx'

    #Input the fields and submit
    b.text_field(:id, "MainContent_txtUsername").set(user)
    b.text_field(:id, "MainContent_txtPassword").set(password)
    b.button(:id, "MainContent_btnLogin").click

    #Do something to validate the result
end